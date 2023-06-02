package com.somplace.domain.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class IrregularCommand extends MeetingCommand {
	private Timestamp irregularMeetingDay;
	private String irregularMeetingDate;
	private String irregularMeetingTime;
}
