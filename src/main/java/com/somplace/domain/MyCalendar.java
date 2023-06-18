package com.somplace.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MyCalendar {
	private int month;
	private int today;
	private int lastDate; // 해당 월의 마지막 날짜 28, 29, 30, 31
	private int firstDay; // 해당 월의 시작 요일
	private List<Irregular> myJoinIrregularList;
	private List<Regular> myJoinRegularList;
	
	public MyCalendar() {
		super();
	}
}
