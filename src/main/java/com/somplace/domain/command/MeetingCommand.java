package com.somplace.domain.command;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;

import lombok.Data;

@Data
public class MeetingCommand {
	private String meetingTitle;
	private int maxPeople;
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
	private Date irregularMeetingDay;
	private String irregularMeetingDate;
	private String irregularMeetingTime;
	
}
