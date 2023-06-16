package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

public interface MeetingDao {
	public List<Meeting> getMeetingList() throws DataAccessException;
	
	// 전체 인기순 정렬
	public List<Meeting> sortAllByHeart() throws DataAccessException;
	// 전체 최신순 정렬
	public List<Meeting> sortAllByOrder() throws DataAccessException;
	
	// 카테고리 인기순 정렬
	public List<Meeting> sortCategoryByHeart(String category) throws DataAccessException;
	// 카테고리 최신순 정렬
	public List<Meeting> sortCategoryByOrder(String category) throws DataAccessException;
	
	//전체(키워드) 검색, 인기순 정렬
	public List<Meeting> sortAllByKeyHeart(String key) throws DataAccessException;
	//카테고리별(키워드) 검색, 인기순 정렬
	public List<Meeting> sortCategoryByKeyHeart(String key, String category) throws DataAccessException;
	
	// 전체(키워드) 검색
	public List<Meeting> searchAllByKey(String key) throws DataAccessException;
	// 카테고리(키워드) 검색
	public List<Meeting> searchCategoryByKey(String key, String category) throws DataAccessException;
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) throws DataAccessException;
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) throws DataAccessException;
	
	// 모임 수정
	public void updateMeeting(MeetingCommand meetingCommand) throws DataAccessException;
	
	// 현재인원 수정
	public void updateNumOfPeople(int meetingId, int count) throws DataAccessException;
	
	// 모임 삭제
	public void deleteMeeting(int meetingId) throws DataAccessException;
	
	// 모집 마감하기
	public void closeMeeting(int meetingId) throws DataAccessException;
	// 다시 모집하기
	public void closeCancelMeeting(int meetingId) throws DataAccessException;
	
	// 내가 생성한 모임 조회
	public List<Meeting> getMadeMeetingList(String creatorId) throws DataAccessException;
	
	// 내가 생성한 모임 아이디 조회
	public List<Integer> getMadeMeetingId(String creatorId) throws DataAccessException;
	
	// 모임 아이디로 모임 목록 조회
	public List<Meeting> getMyMeetingList(List<Integer> meetingIdList) throws DataAccessException;
}
