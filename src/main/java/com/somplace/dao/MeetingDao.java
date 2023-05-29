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
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) throws DataAccessException;
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) throws DataAccessException;
	
	// 내가 생성한 모임 조회
	public List<Meeting> getMadeMeetingList(String creatorId) throws DataAccessException;
}
