package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

public interface MeetingDao {
	public List<Meeting> getMeetingList() throws DataAccessException;
	
	public int getMeetingId(MeetingCommand meetingCommand);
	
	public void createMeeting(MeetingCommand meetingCommand);

	public List<Meeting> getMadeMeetingList(String creatorId) throws DataAccessException;
}
