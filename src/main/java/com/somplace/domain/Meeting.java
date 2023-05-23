package com.somplace.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
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
	
	public Meeting() {
		super();
	}
	
	public Meeting(int meetingId, String meetingTitle, int numOfPeople, int maxPeople, String meetingPlace, String memo,
			String meetingInfo, String meetingInfoDetail, int close, int cancel, String creatorId) {
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
	}

	public int getMeetingId() {
		return meetingId;
	}
	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}
	public String getMeetingTitle() {
		return meetingTitle;
	}
	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}
	public int getNumOfPeople() {
		return numOfPeople;
	}
	public void setNumOfPeople(int numOfPeople) {
		this.numOfPeople = numOfPeople;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public String getMeetingPlace() {
		return meetingPlace;
	}
	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getMeetingInfo() {
		return meetingInfo;
	}
	public void setMeetingInfo(String meetingInfo) {
		this.meetingInfo = meetingInfo;
	}
	public String getMeetingInfoDetail() {
		return meetingInfoDetail;
	}
	public void setMeetingInfoDetail(String meetingInfoDetail) {
		this.meetingInfoDetail = meetingInfoDetail;
	}
	public int getClose() {
		return close;
	}
	public void setClose(int close) {
		this.close = close;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	public String getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}
	
}
