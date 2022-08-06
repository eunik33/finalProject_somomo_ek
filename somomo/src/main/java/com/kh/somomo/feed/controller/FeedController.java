package com.kh.somomo.feed.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.somomo.common.model.vo.PageInfo;
import com.kh.somomo.common.template.Pagination;
import com.kh.somomo.common.template.Time;
import com.kh.somomo.feed.model.service.FeedService;
import com.kh.somomo.feed.model.vo.FeedAttachment;
import com.kh.somomo.feed.model.vo.FeedBoard;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	@RequestMapping("list.fd")
	public ModelAndView selectFeedList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) throws ParseException {
		
		PageInfo pi = Pagination.getPageInfo(feedService.selectFeedListCount(), currentPage, 10, 2);
		ArrayList<FeedBoard> fList = feedService.selectFeedList(pi);
		for(FeedBoard fb : fList) {
			fb.setBoardDate(Time.getDiffTime(fb.getBoardDate()));
			if(fb.getBoardType().equals("M")) {
				setMeetCondition(fb);
			}
		}
		
		mv.addObject("pi", pi)
		  .addObject("fList", fList)
		  .addObject("rList", feedService.selectRegionList())
		  .setViewName("feed/feedListView");
		return mv;
	}
	
	// 모집조건 텍스트 설정 (모집성별 + 모집나이)
	public void setMeetCondition(FeedBoard fb) {
		
		String condition = null;
		
		if(fb.getMeetAge().equals("A") && fb.getMeetGender().equals("A")) {
			fb.setMeetCondition("누구나 참여 가능");
			return;
		}
		
		if(fb.getMeetAge().equals("A")) condition = "나이 제한 없음 | ";
		else condition = fb.getMeetAge() + "세 | ";
		
		if(fb.getMeetGender().equals("A")) condition += "성별제한 없음";
		else if(fb.getMeetGender().equals("F")) condition += "여성만";
		else condition += "남성만";
		
		fb.setMeetCondition(condition);
	}
	
	@RequestMapping("insert.fd")
	public String enrollForm(FeedBoard fb, String minAge, String maxAge,
							 MultipartHttpServletRequest mtfRequest, HttpSession session, Model model) {
		
		int result = 0;
		if(fb.getBoardType().equals("G")) { // 일반게시글
			List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
			ArrayList<FeedAttachment> fatList = new ArrayList<>();
			
			if(!fileList.isEmpty()) {
				fatList = saveFile(fileList, session);
			}
			
			result = feedService.insertGeneralBoard(fb, fatList);
			
		} else { // 모임모집글
			fb.setMeetDate(fb.getMeetDate().replace("T", " ")); // 2022-08-05T15:33에서 T를 공백으로 대체
			
			if(fb.getMeetAge().equals("selectAge")) { // 모집나이 직접입력했을 시
				fb.setMeetAge(minAge + "~" + maxAge); // 20~30 형태로 저장
			}
			result = feedService.insertMeetBoard(fb);
		}
		
		if(result > 0) {
			return "redirect:list.fd";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}

	public ArrayList<FeedAttachment> saveFile(List<MultipartFile> fileList, HttpSession session) {

		ArrayList<FeedAttachment> atList = new ArrayList<>();
		
        for (MultipartFile upfile : fileList) {
            String originName = upfile.getOriginalFilename(); // 원본 파일 명
            
            String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //년월일시분초
            int randNum = (int)(Math.random() * 90000) + 10000; // 5자리 랜덤값
            String ext = originName.substring(originName.lastIndexOf(".")); // 확장자

            // somomo_20220803111150_12345.jpg 형태
            String changeName = "somomo_" + currentTime + "_" + randNum + ext;
            
            FeedAttachment at = new FeedAttachment();
            at.setOriginName(originName);
            at.setChangeName("resources/feedUploadFiles/" + changeName);
            atList.add(at);
            
            String savePath = session.getServletContext().getRealPath("/resources/feedUploadFiles/");
            
            try {
            	upfile.transferTo(new File(savePath + changeName));
            } catch (IllegalStateException | IOException e) {
    			e.printStackTrace();
    		}
        }
        
        return atList;
	}
	
	@RequestMapping("detail.fb")
	public ModelAndView selectFeedBoard(int bno, ModelAndView mv) {
		
		int result = feedService.increaseCount(bno);
		
		if(result > 0) {
			FeedBoard fb = new FeedBoard();
			String bType = feedService.selectBoardType(bno);
			
			if(bType.equals("G")) { // 일반게시글
				fb = feedService.selectGeneralBoard(bno);
				mv.addObject("fb", fb).setViewName("feed/feedGeneralDetailView");
			} else { // 모임모집글
				fb = feedService.selectMeetBoard(bno);
				
				setMeetCondition(fb); // 모집성별 텍스트 변환
				
				mv.addObject("fb", fb).setViewName("feed/feedMeetDetailView");
			}
			
		} else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("delete.fb")
	public String deleteFeedBoard(int bno, HttpSession session, Model model) {
		
		int result = feedService.deleteFeedBoard(bno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:list.fd";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
}
