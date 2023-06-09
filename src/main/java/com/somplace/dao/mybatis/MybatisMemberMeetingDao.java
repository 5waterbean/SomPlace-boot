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
	
	// 모임 신청 (찜하기 되어있을 경우)
	public int updateApplyMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.updateApplyMeeting(memberId, meetingId);
	}
	
	// 모임 찜하기 (신청, 수락 되어 있을 경우)
	public int updateHeartMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.updateHeartMeeting(memberId, meetingId);
	}
	
	// 모임 신청 취소 (찜하기 되어 있을 경우)
	public int updateApplyCancelMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.updateApplyCancelMeeting(memberId, meetingId);
	}
	
	// 모임 찜하기 취소 (신청, 수락 되어 있을 경우)
	public int updateHeartCancelMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.updateHeartCancelMeeting(memberId, meetingId);
	}
	
	// 내가 생성한 모임 회원 수락 (신청이 되어있을 때)
	public int updateConfirmApplyMeeting(String memberId, int meetingId) throws DataAccessException {
		return memberMeetingMapper.updateConfirmApplyMeeting(memberId, meetingId);
	}
	
	// 모임 신청 취소 (찜하기 되어 있지 않을 경우), 모임 찜하기 취소 (신청, 수락 되어있지 않을 경우), 내가 생성한 모임 회원 내보내기
	public void deleteMemberMeeting(String memberId, int meetingId) throws DataAccessException {
		memberMeetingMapper.deleteMemberMeeting(memberId, meetingId);
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
