package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Meeting;

public interface MeetingDao {
	public List<Meeting> getMeetingList() throws DataAccessException;
}
