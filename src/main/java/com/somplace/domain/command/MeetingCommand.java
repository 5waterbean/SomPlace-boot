package com.somplace.domain.command;

import java.sql.Timestamp;
import java.sql.Date;

import lombok.Data;

@Data
public class MeetingCommand {
	private int meetingId;
	private String meetingTitle;
	private int maxPeople;
	private int numOfPeople;
	private String meetingPlace;
	private String memo;
	private String meetingInfo;
	private String meetingInfoDetail;
	private String creatorId;
	
	// regular
	private String meetingName;
	private String regularMeetingDay;
	private Date startDay;
	private String meetingTime;
	
	// irregular
	private Timestamp irregularMeetingDay;
	private String irregularMeetingDate;
	private String irregularMeetingTime;
	
}