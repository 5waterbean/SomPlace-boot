package com.somplace.dao;

import java.util.List;

import com.somplace.domain.Meeting;
import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;

public interface RegularDao {
	// 정기적 모임 생성
	public void createRegular(MeetingCommand meetingCommand);
	// 정기적 모임 수정
	public void updateRegular(Regular regular);
	// 정기적 모임(키워드) 검색
	public List<Meeting> searchRegularByKey(String key, String category);
	// 정기적 인기순 정렬
	public List<Meeting> sortRegularByHeart(String category);
	// 정기적 최신순 정렬
	public List<Meeting> sortRegularByOrder(String category);
	
}
