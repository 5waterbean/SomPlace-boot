package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMemberMeetingDao;

@Service
@Transactional
public class MemberMeetingService {
	@Autowired
	private MybatisMemberMeetingDao memberMeetingDao;
	
	// 회원 리스트 조회
	public List<String> findJoinMemberIdList(int meetingId) throws DataAccessException {
		return memberMeetingDao.findJoinMemberIdList(meetingId);
	}
	
	// 신청자 리스트 조회
	public List<String> findApplyMemberIdList(int meetingId) throws DataAccessException {
		return memberMeetingDao.findApplyMemberIdList(meetingId);
	}
	
	// heart 값 가져오기
	public int getHeart(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingDao.getHeart(memberId, meetingId);
	}
	
	// apply 값 가져오기
	public int getApply(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingDao.getApply(memberId, meetingId);
	}
	
	// 모임 신청, 찜하기 (insert)
	public int insertMemberMeeting(int what, String memberId, int meetingId) {
		if (what == 0) { // 모임 신청 (찜하기 안했을 경우)
			return memberMeetingDao.insertApplyMeeting(memberId, meetingId);
		} else { // 모임 찜하기 (모임 신청 안했을 경우)
			return memberMeetingDao.insertHeartMeeting(memberId, meetingId);
		}
	}
	
	
	
	// 내가 속한 모임 아이디 조회
	public List<Integer> getMyJoinMeetingId(String memberId) throws DataAccessException {
		return memberMeetingDao.getMyJoinMeetingId(memberId);
	}
		
	// 내가 찜한 모임 아이디 조회
	public List<Integer> getMyLikeMeetingId(String memberId) throws DataAccessException {
		return memberMeetingDao.getMyLikeMeetingId(memberId);
	}
		
	// 내가 신청한 모임 아이디 조회
	public List<Integer> getMyApplyMeetingId(String memberId) throws DataAccessException {
		return memberMeetingDao.getMyApplyMeetingId(memberId);
	}
}
