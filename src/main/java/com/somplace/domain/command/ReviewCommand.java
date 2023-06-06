package com.somplace.domain.command;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class ReviewCommand {
	private int reviewId;
	private int star;
	private String reviewMemo;
	private String id;
	private int meetingId;
}
