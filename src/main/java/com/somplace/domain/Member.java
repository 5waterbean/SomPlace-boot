package com.somplace.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class Member implements Serializable {
	private String memberId;
	private String pw;
	private String name;
	private int studentNumber;
	private String major;
	private String phone;
	private int good;
	private int bad;
	private Date birth;
	
	public Member() {
		super();
	}
	
	public Member(String memberId, String pw, String name, int studentNumber, String major, String phone, int good,
			int bad, Date birth) {
		super();
		this.memberId = memberId;
		this.pw = pw;
		this.name = name;
		this.studentNumber = studentNumber;
		this.major = major;
		this.phone = phone;
		this.good = good;
		this.bad = bad;
		this.birth = birth;
	}
}
