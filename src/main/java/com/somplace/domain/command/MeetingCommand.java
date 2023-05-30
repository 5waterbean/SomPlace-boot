package com.somplace.domain.command;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

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
	@NotEmpty(message = "상세 카테고리를 선택해주세요.")
	private String meetingInfoDetail;
	private String meetingInfo;
	private String creatorId;
	
	// regular
	private String meetingName;
	@NotEmpty(message = "모임 날짜를 선택해주세요.")
	private String regularMeetingDay;
	private Date startDay;
	@NotEmpty(message = "모임 시간을 선택해주세요.")
	private String meetingTime;
	
	// irregular
	private Timestamp irregularMeetingDay;
	private String irregularMeetingDate;
	private String irregularMeetingTime;
	
}