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
	
	// 전체 인기순 정렬
//		public List<Meeting> sortAllByHeart() throws DataAccessException {
//			return meetingDao.sortAllByHeart();
//		}
//		// 전체 최신순 정렬
//		public List<Meeting> sortAllByOrder() throws DataAccessException {
//			return meetingDao.sortAllByOrder();
//		}
	
	// 모임 아이디 조회
	public int getMeetingId(MeetingCommand meetingCommand) {
		return meetingDao.getMeetingId(meetingCommand);
	}
	
	// 모임 생성
	public void createMeeting(MeetingCommand meetingCommand) {
		meetingDao.createMeeting(meetingCommand);
	}
	
	// 내가 생성한 모임 조회
	public List<Meeting> getMadeMeetingList(String creatorId) {
		return meetingDao.getMadeMeetingList(creatorId);
	}
}
