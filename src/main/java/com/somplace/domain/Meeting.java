package com.somplace.domain;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Meeting implements Serializable {
	private int meetingId;
	private String meetingTitle;
	private int numOfPeople;
	private int maxPeople;
	private String meetingPlace;
	private String memo;
	private String meetingInfo;
	private String meetingInfoDetail;
	private int close;
	private int cancel;
	private String creatorId; // member id와 연결
}
