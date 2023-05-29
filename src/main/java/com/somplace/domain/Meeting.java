package com.somplace.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
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
	private int heart;
	
	public Meeting() {
		super();
	}
	
	public Meeting(int meetingId, String meetingTitle, int numOfPeople, int maxPeople, String meetingPlace, String memo,
			String meetingInfo, String meetingInfoDetail, int close, int cancel, String creatorId, int heart) {
		super();
		this.meetingId = meetingId;
		this.meetingTitle = meetingTitle;
		this.numOfPeople = numOfPeople;
		this.maxPeople = maxPeople;
		this.meetingPlace = meetingPlace;
		this.memo = memo;
		this.meetingInfo = meetingInfo;
		this.meetingInfoDetail = meetingInfoDetail;
		this.close = close;
		this.cancel = cancel;
		this.creatorId = creatorId;
		this.heart = heart;
	}

}
