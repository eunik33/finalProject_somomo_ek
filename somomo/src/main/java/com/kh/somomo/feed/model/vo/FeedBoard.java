package com.kh.somomo.feed.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class FeedBoard {

	// 테이블 : FEED_BOARD (피드게시글)
	private int boardNo;
	private String boardWriter;
	private int regionNo;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private int count;
	private String boardDate;
	private String meetPlace;
	private String longitude; // 220803 순서 변경
	private String latitude;
	private String meetDate;
	private String meetTotal;
	private String meetGender;
	private String meetAge; // 220803 변수타입 변경
	private String status;
	
	private String meetCondition; // 모임모집 신청조건
	
	// REGION_CATEGORY테이블과 JOIN해서 받아온 값
	private String regionName;
	
	// MEMBER테이블과 JOIN해서 받아온 값
	private String nickname;
	
	// REPLY테이블과 JOIN해서 받아온 값
	private int countReply;
	
	// CHAT_ROOM, CHAT_MEMBER테이블과 JOIN해서 받아온 값
	private int countMember;
	
	
}
