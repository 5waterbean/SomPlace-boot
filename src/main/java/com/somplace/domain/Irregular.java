package com.somplace.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class Irregular extends Meeting implements Serializable {
	private Timestamp meetingDate;

	public Irregular(Timestamp meetingDate) {
		super();
		this.meetingDate = meetingDate;
	}
	
	public Irregular() {
		super();
	}
}
