package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public int getMeetingId(MeetingCommand meetingCommand) {
		return meetingDao.getMeetingId(meetingCommand);
	}
	
	public void createMeeting(MeetingCommand meetingCommand) {
		meetingDao.createMeeting(meetingCommand);
	}
	
	public List<Meeting> getMadeMeetingList(String creatorId) {
		return meetingDao.getMadeMeetingList(creatorId);
	}
}
