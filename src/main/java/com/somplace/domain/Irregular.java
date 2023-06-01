package com.somplace.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
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
