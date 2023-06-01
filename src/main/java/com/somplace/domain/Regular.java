package com.somplace.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
public class Regular extends Meeting implements Serializable {
	private String meetingName;
	private String meetingDay;
	private Date startDay;
	private String meetingTime;
	
	public Regular(String meetingName, String meetingDay, Date startDay, String meetingTime) {
		super();
		this.meetingName = meetingName;
		this.meetingDay = meetingDay;
		this.startDay = startDay;
		this.meetingTime = meetingTime;
	}

	public Regular() {
		super();
	}
}
