package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMeetingDao;
import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Service
@Transactional
public class MeetingService {
	
	@Autowired
	private MybatisMeetingDao meetingDao;
	
	public List<Meeting> getMeetingList(){
		return meetingDao.getMeetingList();
	}
	
	//전체 정렬
	public List<Meeting> sortAll(String sortWith){
		if (sortWith.equals("order")) {
			return meetingDao.sortAllByOrder(); 
		}
		else {
			return meetingDao.sortAllByHeart();
		}
	}
	
	// 카테고리 정렬
	public List<Meeting> sortCategory(String category, String sortWith) {
		if (sortWith.equals("order")) {
			return meetingDao.sortCategoryByOrder(category);
		} else {
			return meetingDao.sortCategoryByHeart(category);
		}
	}
	
	//전체(키워드) 검색, 인기순 정렬
	public List<Meeting> sortAllByKeyHeart(String key) {
		return meetingDao.sortAllByKeyHeart(key);
	}
	//카테고리별(키워드) 검색, 인기순 정렬
	public List<Meeting> sortCategoryByKeyHeart(String key, String category) {
		return meetingDao.sortCategoryByKeyHeart(key, category);
	}
	
	// 전체(키워드) 검색
	public List<Meeting> searchAllByKey(String key) {
		return meetingDao.searchAllByKey(key);
	}
	// 카테고리(키워드) 검색
	public List<Meeting> searchCategoryByKey(String key, String category) {
		return meetingDao.searchCategoryByKey(key, category);
	}
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) {
		return meetingDao.getMeetingId(meetingCommand);
	}
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) {
		meetingDao.createMeeting(meetingCommand);
	}
	
	// 모임 수정
	public void updateMeeting(MeetingCommand meetingCommand) {
		meetingDao.updateMeeting(meetingCommand);
	}
	
	// 내가 생성한 모임 조회
	public List<Meeting> getMadeMeetingList(String creatorId) {
		return meetingDao.getMadeMeetingList(creatorId);
	}
}
