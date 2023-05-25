package com.somplace.domain.command;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MeetingCommand {
	private String meetingTitle;
	private int maxPeople;
	private String meetingplace;
	private String memo;
	private String meetingInfo;
	private String meetingInfoDetail;
	private String creatorid;
	
	// regular
	private String meetingName;
	private String regularMeetingDay;
	private Date startDay;
	private String meetingTime;
	
	// irregular
	private Date irregularMeetingDay;
}
