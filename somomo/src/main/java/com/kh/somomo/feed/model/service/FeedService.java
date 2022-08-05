package com.kh.somomo.feed.model.service;

import java.util.ArrayList;

import com.kh.somomo.common.model.vo.PageInfo;
import com.kh.somomo.common.model.vo.RegionCategory;
import com.kh.somomo.feed.model.vo.FeedAttachment;
import com.kh.somomo.feed.model.vo.FeedBoard;

public interface FeedService {

	// 피드 리스트 조회 + 페이징처리
	// 피드 게시글 전체 개수 조회
	int selectFeedListCount();
	// 피드 게시글 목록 조회
	ArrayList<FeedBoard> selectFeedList(PageInfo pi);
	
	// 지역 카테고리 목록 조회
	ArrayList<RegionCategory> selectRegionList();
	
	
	// 글 작성 서비스
	// 일반게시글 : 글 + 첨부파일
	int insertGeneralBoard(FeedBoard fb, ArrayList<FeedAttachment> fatList);
	// 모임모집글 : 글 + 채팅방 생성 및 채팅멤버 등록
	int insertMeetBoard(FeedBoard fb);
	
	// 게시글 상세 조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int boardNo);
	// 게시글 타입 조회 (일반 / 모임모집)
	String selectBoardType(int boardNo);
	// 일반게시글 조회
	FeedBoard selectGeneralBoard(int boardNo);
	// 게시글 첨부파일 조회
	ArrayList<FeedAttachment> selectFeedAttachment(int boardNo);
	// 모임모집글 조회
	FeedBoard selectMeetBoard(int boardNo);
	
	// 게시글 수정
	int updateFeedBoard(FeedBoard fb);
	
	// 게시글 삭제
	int deleteFeedBoard(int boardNo);


}
