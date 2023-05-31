package com.somplace.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Irregular extends Meeting implements Serializable {
	private Timestamp meetingDate;
}
