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
	private MeetingMapper MeetingMapper;

	// 모임 전체 조회
	public List<Meeting> getMeetingList() throws DataAccessException {
		return MeetingMapper.getMeetingList();
	}
	
	// 전체 인기순 정렬
	public List<Meeting> sortAllByHeart() throws DataAccessException {
		return MeetingMapper.sortAllByHeart();
	}
	// 전체 최신순 정렬
	public List<Meeting> sortAllByOrder() throws DataAccessException {
		return MeetingMapper.sortAllByOrder();
	}
	
	//전체(키워드) 검색, 인기순 정렬
	public List<Meeting> sortAllByKeyHeart(String key) throws DataAccessException {
		return MeetingMapper.sortAllByKeyHeart(key);
	}
	//카테고리별(키워드) 검색, 인기순 정렬
	public List<Meeting> sortCategoryByKeyHeart(String key, String category) throws DataAccessException {
		return MeetingMapper.sortCategoryByKeyHeart(key, category);
	}
	
	// 전체(키워드) 검색
	public List<Meeting> searchAllByKey(String key) throws DataAccessException {
		return MeetingMapper.searchAllByKey(key);
	}
	// 카테고리(키워드) 검색
	public List<Meeting> searchCategoryByKey(String key, String category) throws DataAccessException {
		return MeetingMapper.searchCategoryByKey(key, category);
	}
	
	// 카테고리 인기순 정렬
	public List<Meeting> sortCategoryByHeart(String category) throws DataAccessException {
		return MeetingMapper.sortCategoryByHeart(category);
	}
	// 카테고리 최신순 정렬
	public List<Meeting> sortCategoryByOrder(String category) throws DataAccessException {
		return MeetingMapper.sortCategoryByOrder(category);
	}
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) throws DataAccessException {
		return MeetingMapper.getMeetingId(meetingCommand);
	}
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) throws DataAccessException {
		MeetingMapper.createMeeting(meetingCommand);
	}
	
	// 모임 수정
	public void updateMeeting(MeetingCommand meetingCommand) throws DataAccessException {
		MeetingMapper.updateMeeting(meetingCommand);
	}
	
	// 모임 삭제
	public void deleteMeeting(int meetingId) throws DataAccessException {
		MeetingMapper.deleteMeeting(meetingId);
	}

	// 내가 생성한 모임 리스트 조회
	public List<Meeting> getMadeMeetingList(String creatorId) throws DataAccessException {
		return MeetingMapper.getMadeMeetingList(creatorId);
	}
}
