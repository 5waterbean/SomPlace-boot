package com.somplace.dao;

import java.sql.Date;
import java.util.List;

import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;


public interface IrregularDao {
	// 일시적모임 생성
	public void createIrregular(MeetingCommand meetingCommand);
	// 일시적모임 수정
	public void updateIrregular(Irregular irregular);
	
	//일시적모임 가져오기
	public Irregular getIrregularById(int meetingId);
	
	// 일시적모임(키워드) 검색
	public List<Meeting> searchIrregularByKey(String key, String category);
	
	// 일시적모임 인기순 정렬
	public List<Meeting> sortIrregularByHeart(String category);
	// 일시적모임 최신순 정렬
	public List<Meeting> sortIrregularByOrder(String category);
	
}
