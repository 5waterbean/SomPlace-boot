package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Mapper
public interface MeetingMapper {
	List<Meeting> getMeetingList();
	int getMeetingId(MeetingCommand meetingCommand);
	public void createMeeting(MeetingCommand meetingCommand);
}
