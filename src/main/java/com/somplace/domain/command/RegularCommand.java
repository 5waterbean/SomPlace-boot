package com.somplace.domain.command;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class RegularCommand extends MeetingCommand {
	// regular
	@Size(min = 1, max = 40, message = "더 짧게 입력해주세요.")
	private String meetingName;
	@NotEmpty(message = "모임 날짜를 선택해주세요.")
	private String regularMeetingDay;
	private Date startDay;
	@NotEmpty(message = "모임 시간을 선택해주세요.")
	private String meetingTime;
}