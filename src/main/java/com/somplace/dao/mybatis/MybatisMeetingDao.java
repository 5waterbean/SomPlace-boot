package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.MeetingDao;
import com.somplace.dao.mybatis.mapper.MeetingMapper;
import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Repository
public class MybatisMeetingDao implements MeetingDao {
	@Autowired
	private MeetingMapper meetingMapper;

	// 모임 전체 조회
	public List<Meeting> getMeetingList() throws DataAccessException {
		return meetingMapper.getMeetingList();
	}
	
	// 전체 인기순 정렬
	public List<Meeting> sortAllByHeart() throws DataAccessException {
		return meetingMapper.sortAllByHeart();
	}
	// 전체 최신순 정렬
	public List<Meeting> sortAllByOrder() throws DataAccessException {
		return meetingMapper.sortAllByOrder();
	}
	
	//전체(키워드) 검색, 인기순 정렬
	public List<Meeting> sortAllByKeyHeart(String key) throws DataAccessException {
		return meetingMapper.sortAllByKeyHeart(key);
	}
	//카테고리별(키워드) 검색, 인기순 정렬
	public List<Meeting> sortCategoryByKeyHeart(String key, String category) throws DataAccessException {
		return meetingMapper.sortCategoryByKeyHeart(key, category);
	}
	
	// 전체(키워드) 검색
	public List<Meeting> searchAllByKey(String key) throws DataAccessException {
		return meetingMapper.searchAllByKey(key);
	}
	// 카테고리(키워드) 검색
	public List<Meeting> searchCategoryByKey(String key, String category) throws DataAccessException {
		return meetingMapper.searchCategoryByKey(key, category);
	}
	
	// 카테고리 인기순 정렬
	public List<Meeting> sortCategoryByHeart(String category) throws DataAccessException {
		return meetingMapper.sortCategoryByHeart(category);
	}
	// 카테고리 최신순 정렬
	public List<Meeting> sortCategoryByOrder(String category) throws DataAccessException {
		return meetingMapper.sortCategoryByOrder(category);
	}
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) throws DataAccessException {
		return meetingMapper.getMeetingId(meetingCommand);
	}
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) throws DataAccessException {
		meetingMapper.createMeeting(meetingCommand);
	}
	
	// 모임 수정
	public void updateMeeting(MeetingCommand meetingCommand) throws DataAccessException {
		meetingMapper.updateMeeting(meetingCommand);
	}
	
	// 현재인원 수정
	public void updateNumOfPeople(int meetingId, int count) throws DataAccessException {
		meetingMapper.updateNumOfPeople(meetingId, count);
	}
	
	// 모임 삭제
	public void deleteMeeting(int meetingId) throws DataAccessException {
		meetingMapper.deleteMeeting(meetingId);
	}
	
	// 모집 마감하기
	public void closeMeeting(int meetingId) throws DataAccessException {
		meetingMapper.closeMeeting(meetingId);
	}
	// 다시 모집하기
	public void closeCancelMeeting(int meetingId) throws DataAccessException {
		meetingMapper.closeCancelMeeting(meetingId);
	}

	// 내가 생성한 모임 리스트 조회
	public List<Meeting> getMadeMeetingList(String creatorId) throws DataAccessException {
		return meetingMapper.getMadeMeetingList(creatorId);
	}
	
	// 내가 찜한 or 신청한 모임 목록 조회
	public List<Meeting> getMyMeetingList(List<Integer> meetingIdList) throws DataAccessException {
		return meetingMapper.getMyMeetingList(meetingIdList);
	}
}
