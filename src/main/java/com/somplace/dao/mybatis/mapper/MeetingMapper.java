package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Mapper
public interface MeetingMapper {
	List<Meeting> getMeetingList();
	
	// 전체 인기순 정렬
	List<Meeting> sortAllByHeart();
	// 전체 최신순 정렬
	List<Meeting> sortAllByOrder();
	
	// 모임 아이디 조회
	int getMeetingId(MeetingCommand meetingCommand);
	
	// 모임 생성
	void createMeeting(MeetingCommand meetingCommand);
	
	// 내가 생성한 모임 조회
	List<Meeting> getMadeMeetingList(String creatorId);
}
