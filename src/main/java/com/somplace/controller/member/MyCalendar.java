package com.somplace.controller.member;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MyCalendar {
	private int month;
	private int lastDate; // 해당 월의 마지막 날짜 28, 29, 30, 31
	private int firstDay; // 해당 월의 시작 요일
	
	public MyCalendar() {
		super();
	}
	
	public MyCalendar(int month, int lastDate, int firstDay) {
		super();
		this.month = month;
		this.lastDate = lastDate;
		this.firstDay = firstDay;
	}
}
