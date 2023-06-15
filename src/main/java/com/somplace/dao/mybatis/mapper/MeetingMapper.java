package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Mapper
public interface MeetingMapper {
	List<Meeting> getMeetingList();
	
	// 전체 인기순 정렬
	List<Meeting> sortAllByHeart();
	// 전체 최신순 정렬
	List<Meeting> sortAllByOrder();
	
	// 카테고리 인기순 정렬
	List<Meeting> sortCategoryByHeart(String category);
	// 카테고리 최신순 정렬
	List<Meeting> sortCategoryByOrder(String category);
	
	//전체(키워드) 검색, 인기순 정렬
	List<Meeting> sortAllByKeyHeart(String key);
	//카테고리별(키워드) 검색, 인기순 정렬
	List<Meeting> sortCategoryByKeyHeart(@Param("key")String key, @Param("category")String category);
	
	// 전체(키워드) 검색
	List<Meeting> searchAllByKey(String key);
	// 카테고리(키워드) 검색
	List<Meeting> searchCategoryByKey(@Param("key")String key, @Param("category")String category);
	
	// 모임 아이디 조회
	int getMeetingId(MeetingCommand meetingCommand);
	
	// 모임 생성
	void createMeeting(MeetingCommand meetingCommand);
	
	// 모임 수정
	void updateMeeting(MeetingCommand meetingCommand);
	
	// 현재인원 수정
	void updateNumOfPeople(@Param("meetingId")int meetingId, @Param("count")int count);
	
	// 모임 삭제
	void deleteMeeting(int meetingId);
	
	// 모집 마감하기
	void closeMeeting(int meetingId);
	// 다시 모집하기
	void closeCancelMeeting(int meetingId);
	
	// 내가 생성한 모임 조회
	List<Meeting> getMadeMeetingList(String creatorId);
	
	// 내가 찜한 or 신청한 모임 목록 조회
	List<Meeting> getMyMeetingList(List<Integer> meetingIdList);
}
