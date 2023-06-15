package com.somplace.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@SuppressWarnings("serial")
@ToString
public class Review implements Serializable {
	private int reviewId;
	private int star;
	private String reviewMemo;
	private String id;
	private int meetingId;
	
	public Review() {
		super();
	}

	public Review(int reviewId, int star, String reviewMemo, String id, int meetingId) {
		super();
		
		this.reviewId = reviewId;
		this.star = star;
		this.reviewMemo = reviewMemo;
		this.id = id;
		this.meetingId = meetingId;
	}
}
