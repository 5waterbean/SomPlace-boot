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
	public int insertMemberMeeting(int apply, String memberId, int meetingId) {
		if (apply == 0) { // 모임 신청 (찜하기 안했을 경우)
			return memberMeetingDao.insertApplyMeeting(memberId, meetingId);
		} else { // 모임 찜하기 (모임 신청 안했을 경우)
			return memberMeetingDao.insertHeartMeeting(memberId, meetingId);
		}
	}
	
	// 모임 신청, 찜하기 (update)
	public int updateMemberMeeting(int apply, int heart, String memberId, int meetingId, int what) {
		
		if (what == 0) { //모임 신청,취소일 경우
			if (apply == -1 && heart == 1) { // 모임 신청 (찜하기o)
				return memberMeetingDao.updateApplyMeeting(memberId, meetingId);
			}
			else if (apply == 1 && heart == 1) { // 모임 신청 취소 (찜하기o)
				return memberMeetingDao.updateApplyCancelMeeting(memberId, meetingId);
			} 
		}
		else if (what == 1){ //찜하기,취소일 경우
			if (apply != -1 && heart == 0) { // 모임 찜하기 (신청, 수락 되어 있을 경우)
				return memberMeetingDao.updateHeartMeeting(memberId, meetingId);
			} 
			else if (apply != -1 && heart == 1) { // 모임 찜하기 취소 (신청, 수락 되어 있을 경우)
				return memberMeetingDao.updateHeartCancelMeeting(memberId, meetingId);
			}
		}
		else { //회원 수락일 경우
			if (apply == 1) { // 내가 생성한 모임 회원 수락 (신청이 되어있을 때)
				return memberMeetingDao.updateConfirmApplyMeeting(memberId, meetingId);
			}
		}
		return -1;
	}
	
	// 모임 신청 취소 (찜하기 되어 있지 않을 경우), 모임 찜하기 취소 (신청, 수락 되어있지 않을 경우), 내가 생성한 모임 회원 내보내기
	public void deleteMemberMeeting(String memberId, int meetingId) {
		memberMeetingDao.deleteMemberMeeting(memberId, meetingId);
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
