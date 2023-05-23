package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMeetingDao;
import com.somplace.domain.Meeting;

@Service
@Transactional
public class MeetingService {
	
	@Autowired
	private MybatisMeetingDao meetingDao;
	
	public List<Meeting> getMeetingList(){
		return meetingDao.getMeetingList();
	}
}
