package com.kh.somomo.feed.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.somomo.common.model.vo.PageInfo;
import com.kh.somomo.common.template.FileRename;
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
	
	@ResponseBody
	@RequestMapping(value="listtest.fd", produces="application/json; charset-UTF-8")
	public String selectTest(@RequestParam(value="cpage", defaultValue="1") int currentPage) throws ParseException {
		
		PageInfo pi = Pagination.getPageInfo(feedService.selectFeedListCount(), currentPage, 10, 2);
		ArrayList<FeedBoard> fList = feedService.selectFeedList(pi);
		for(FeedBoard fb : fList) {
			fb.setBoardDate(Time.getDiffTime(fb.getBoardDate()));
			if(fb.getBoardType().equals("M")) {
				setMeetCondition(fb);
			}
		}
		return new Gson().toJson(fList);
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
			
			ArrayList<FeedAttachment> fatList = new ArrayList<>();
			
			Iterator<String> fileNames = mtfRequest.getFileNames();
			
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				
				MultipartFile upfile = mtfRequest.getFile(fileName);
				if(!upfile.getOriginalFilename().equals("")) {
					
					HashMap<String, String> map = FileRename.saveFile(upfile, session, "feedUploadFiles");
					
		            FeedAttachment at = new FeedAttachment();
		            at.setOriginName(map.get("originName"));
		            at.setChangeName(map.get("changeName"));
		            fatList.add(at);
				}
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
