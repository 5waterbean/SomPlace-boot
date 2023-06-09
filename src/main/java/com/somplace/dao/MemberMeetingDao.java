package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface MemberMeetingDao {
	// 회원 리스트 조회
	public List<String> findJoinMemberIdList(int meetingId) throws DataAccessException;
	
	// 신청자 리스트 조회
	public List<String> findApplyMemberIdList(int meetingId) throws DataAccessException;
	
	// heart 값 가져오기
	public int getHeart(String memberId, int meetingId) throws DataAccessException;
	
	// apply 값 가져오기
	public int getApply(String memberId, int meetingId) throws DataAccessException;

	// 모임 신청 (찜하기 안했을 경우)
	public int insertApplyMeeting(String memberId, int meetingId) throws DataAccessException;

	// 모임 찜하기 (모임 신청 안했을 경우)
	public int insertHeartMeeting(String memberId, int meetingId) throws DataAccessException;

	// 모임 신청 (찜하기 되어있을 경우)
	public int updateApplyMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 찜하기 (신청, 수락 되어 있을 경우)
	public int updateHeartMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 신청 취소 (찜하기 되어 있을 경우)
	public int updateApplyCancelMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 찜하기 취소 (신청, 수락 되어 있을 경우)
	public int updateHeartCancelMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 내가 생성한 모임 회원 수락 (신청이 되어있을 때)
	public int updateConfirmApplyMeeting(String memberId, int meetingId) throws DataAccessException;
		
	// 모임 신청 취소 (찜하기 되어 있지 않을 경우), 모임 찜하기 취소 (신청, 수락 되어있지 않을 경우), 내가 생성한 모임 회원 내보내기
	public void deleteMemberMeeting(String memberId, int meetingId) throws DataAccessException;
	
	
	// 내가 속한 모임 아이디 조회
	public List<Integer> getMyJoinMeetingId(String memberId) throws DataAccessException;
		
	// 내가 찜한 모임 아이디 조회
	public List<Integer> getMyLikeMeetingId(String memberId) throws DataAccessException;
		
	// 내가 신청한 모임 아이디 조회
	public List<Integer> getMyApplyMeetingId(String memberId) throws DataAccessException;
}
