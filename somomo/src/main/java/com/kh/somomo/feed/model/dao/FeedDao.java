package com.kh.somomo.feed.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.somomo.common.model.vo.PageInfo;
import com.kh.somomo.common.model.vo.RegionCategory;
import com.kh.somomo.feed.model.vo.FeedAttachment;
import com.kh.somomo.feed.model.vo.FeedBoard;

@Repository
public class FeedDao {

	public int selectFeedListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("feedMapper.selectFeedListCount");
	}
	
	public ArrayList<FeedBoard> selectFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("feedMapper.selectFeedList", null, rowBounds);
	}
	
	public ArrayList<RegionCategory> selectRegionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("feedMapper.selectRegionList");
	}

	public int insertGeneralBoard(SqlSessionTemplate sqlSession, FeedBoard b) {
		return sqlSession.insert("feedMapper.insertGeneralBoard", b);
	}

	public int insertFeedAttachment(SqlSessionTemplate sqlSession, FeedAttachment fat) {
		return sqlSession.insert("feedMapper.insertFeedAttachment", fat);
	}
	
	public int insertMeetBoard(SqlSessionTemplate sqlSession, FeedBoard fb) {
		return sqlSession.insert("feedMapper.insertMeetBoard", fb);
	}

	public int insertChatRoom(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("feedMapper.insertChatRoom");
	}

	public int insertChatMember(SqlSessionTemplate sqlSession, String boardWriter) {
		return sqlSession.insert("feedMapper.insertChatMember", boardWriter);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("feedMapper.increaseCount", boardNo);
	}

	public String selectBoardType(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("feedMapper.selectBoardType", boardNo);
	}
	
	public FeedBoard selectGeneralBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("feedMapper.selectGeneralBoard", boardNo);
	}
	
	public ArrayList<FeedAttachment> selectFeedAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("feedMapper.selectFeedAttachment", boardNo);
	}
	
	public FeedBoard selectMeetBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("feedMapper.selectMeetBoard", boardNo);
	}

	public int deleteFeedBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("feedMapper.deleteFeedBoard", boardNo);
	}










}
