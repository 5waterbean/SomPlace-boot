package com.somplace.domain;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Regular extends Meeting implements Serializable {
	private String meetingName;
	private String meetingDay;
	private String meetingTime;
	private Date startDay;
	//private List<Review> reviewList;
	
	public Regular() {
		
	}
	
	public Regular(String meetingName, String meetingDay, String meetingTime, Date startDay) {
		super();
		this.meetingName = meetingName;
		this.meetingDay = meetingDay;
		this.meetingTime = meetingTime;
		this.startDay = startDay;
	}
	
	public String getMeetingName() { return meetingName;	}
	public void setMeetingName(String meetingName) { this.meetingName = meetingName;	}
	public String getMeetingDay() { return meetingDay; }
	public void setMeetingDay(String meetingDay) { this.meetingDay = meetingDay; }
	public String getMeetingTime() { return meetingTime; }
	public void setMeetingTime(String meetingTime) { this.meetingTime = meetingTime;	}
	public Date getStartDay() { return startDay; }
	public void setStartDay(Date startDay) { this.startDay = startDay; }
	
}
