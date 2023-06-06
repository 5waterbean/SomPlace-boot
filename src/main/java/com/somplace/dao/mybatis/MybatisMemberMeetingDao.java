package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.mybatis.mapper.MemberMeetingMapper;

@Repository
public class MybatisMemberMeetingDao {
	@Autowired
	private MemberMeetingMapper memberMeetingMapper;

	// 회원 리스트 조회
	public List<String> findJoinMemberIdList(int meetingId) throws DataAccessException {
		return memberMeetingMapper.findJoinMemberIdList(meetingId);
	}
	
	// 신청자 리스트 조회
	public List<String> findApplyMemberIdList(int meetingId) throws DataAccessException {
		return memberMeetingMapper.findApplyMemberIdList(meetingId);
	}
	
	// heart 값 가져오기
	public int getHeart(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.getHeart(memberId, meetingId);
	}
	
	// apply 값 가져오기
	public int getApply(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.getApply(memberId, meetingId);
	}

	// 모임 신청 (찜하기 안했을 경우)
	public int insertApplyMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.insertApplyMeeting(memberId, meetingId);
	}

	// 모임 찜하기 (모임 신청 안했을 경우)
	public int insertHeartMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.insertHeartMeeting(memberId, meetingId);
	}
	
	
	
	
	
	
	// 내가 속한 모임 아이디 조회
	public List<Integer> getMyJoinMeetingId(String memberId) throws DataAccessException {
		return memberMeetingMapper.getMyJoinMeetingId(memberId);
	}
		
	// 내가 찜한 모임 아이디 조회
	public List<Integer> getMyLikeMeetingId(String memberId) throws DataAccessException {
		return memberMeetingMapper.getMyLikeMeetingId(memberId);
	}
		
	// 내가 신청한 모임 아이디 조회
	public List<Integer> getMyApplyMeetingId(String memberId) throws DataAccessException {
		return memberMeetingMapper.getMyApplyMeetingId(memberId);
	}
}
