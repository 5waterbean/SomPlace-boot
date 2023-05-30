package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisRegularDao;
import com.somplace.domain.Meeting;
import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;

@Service
@Transactional
public class RegularService {
	@Autowired
	private MybatisRegularDao regularDao;
	
	public void createRegular(MeetingCommand meetingCommand) {
		regularDao.createRegular(meetingCommand);
	}
	
	public void updateRegular(Regular regular) {
		regularDao.updateRegular(regular);
	}
	
	public List<Meeting> searchRegularByKey(String key, String category) {
		return regularDao.searchRegularByKey(key, category);
	}
	
	public List<Meeting> sortRegular(String sortWith, String category) {
		if (sortWith.equals("heart")) {
			return regularDao.sortRegularByHeart(category);
		} else {
			return regularDao.sortRegularByOrder(category);
		}
	}
}
