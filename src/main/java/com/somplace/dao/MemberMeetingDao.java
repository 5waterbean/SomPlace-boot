package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface MemberMeetingDao {
	// 회원 리스트 조회
	public List<String> findJoinMemberIdList(int meetingId) throws DataAccessException;
	
	// 신청자 리스트 조회
	public List<String> findApplyMemberIdList(int meetingId) throws DataAccessException;
}
