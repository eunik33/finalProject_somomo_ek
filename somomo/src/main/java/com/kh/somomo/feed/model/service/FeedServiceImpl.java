package com.kh.somomo.feed.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.somomo.common.model.vo.PageInfo;
import com.kh.somomo.common.model.vo.RegionCategory;
import com.kh.somomo.feed.model.dao.FeedDao;
import com.kh.somomo.feed.model.vo.FeedAttachment;
import com.kh.somomo.feed.model.vo.FeedBoard;

@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private FeedDao feedDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectFeedListCount() {
		return feedDao.selectFeedListCount(sqlSession);
	}

	@Override
	public ArrayList<FeedBoard> selectFeedList(PageInfo pi) {
		return feedDao.selectFeedList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<RegionCategory> selectRegionList() {
		return feedDao.selectRegionList(sqlSession);
	}

	@Override
	public int insertGeneralBoard(FeedBoard fb, ArrayList<FeedAttachment> fatList) {
		
		int result1 = feedDao.insertGeneralBoard(sqlSession, fb);
		int result2 = 1;
		if(!fatList.isEmpty()) {
			for(FeedAttachment fat : fatList) {
				result2 *= feedDao.insertFeedAttachment(sqlSession, fat);
			}
		}

		return result1 * result2;
	}
	
	@Override
	public int insertMeetBoard(FeedBoard fb) {
		int result1 = feedDao.insertMeetBoard(sqlSession, fb);
		int result2 = feedDao.insertChatRoom(sqlSession);
		int result3 = feedDao.insertChatMember(sqlSession, fb.getBoardWriter());
		return result1 * result2 * result3;
	}
	
	@Override
	public int increaseCount(int boardNo) {
		return feedDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public String selectBoardType(int boardNo) {
		return feedDao.selectBoardType(sqlSession, boardNo);
	}
	
	@Override
	public FeedBoard selectGeneralBoard(int boardNo) {
		return feedDao.selectGeneralBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<FeedAttachment> selectFeedAttachment(int boardNo) {
		return feedDao.selectFeedAttachment(sqlSession, boardNo);
	}

	@Override
	public FeedBoard selectMeetBoard(int boardNo) {
		return feedDao.selectMeetBoard(sqlSession, boardNo);
	}
	
	@Override
	public int updateFeedBoard(FeedBoard b) {
		return 0;
	}

	@Override
	public int deleteFeedBoard(int boardNo) {
		return 0;
	}



}
