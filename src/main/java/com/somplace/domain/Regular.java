package com.somplace.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Regular extends Meeting implements Serializable {
	private String meetingName;
	private String meetingDay;
	private Date startDay;
	private String meetingTime;

}
