package com.somplace.domain.command;

import javax.validation.constraints.NotEmpty;

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
}