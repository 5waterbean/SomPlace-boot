package com.somplace.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
@SuppressWarnings("serial")
public class Irregular extends Meeting implements Serializable {
	private Date meetingDay;
}