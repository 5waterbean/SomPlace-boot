package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface MemberMeetingDao {
	// 회원 리스트 조회
	public List<String> findJoinMemberIdList(int meetingId) throws DataAccessException;
	
	// 신청자 리스트 조회
	public List<String> findApplyMemberIdList(int meetingId) throws DataAccessException;

	// 내가 속한 모임 아이디 조회
	public List<Integer> getMyJoinMeetingId(String memberId) throws DataAccessException;
		
	// 내가 찜한 모임 아이디 조회
	public List<Integer> getMyLikeMeetingId(String memberId) throws DataAccessException;
		
	// 내가 신청한 모임 아이디 조회
	public List<Integer> getMyApplyMeetingId(String memberId) throws DataAccessException;
}
