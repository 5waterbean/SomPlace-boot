package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

@Mapper
public interface MemberMeetingMapper {
	// 회원 리스트 조회
	List<String> findJoinMemberIdList(int meetingId);
	
	// 신청자 리스트 조회
	List<String> findApplyMemberIdList(int meetingId);
	
	// heart 값 가져오기
	int getHeart(@Param("memberId")String memberId, @Param("meetingId")int meetingId);
	
	// apply 값 가져오기
	int getApply(@Param("memberId")String memberId, @Param("meetingId")int meetingId);
	
	// 모임 신청 (찜하기 안했을 경우)
	int insertApplyMeeting(@Param("memberId") String memberId, @Param("meetingId") int meetingId);

	// 모임 찜하기 (모임 신청 안했을 경우)
	int insertHeartMeeting(@Param("memberId") String memberId, @Param("meetingId") int meetingId);
	
	// 모임 신청 (찜하기 되어있을 경우)
	int updateApplyMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 찜하기 (신청, 수락 되어 있을 경우)
	int updateHeartMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 신청 취소 (찜하기 되어 있을 경우)
	int updateApplyCancelMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 찜하기 취소 (신청, 수락 되어 있을 경우)
	int updateHeartCancelMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 내가 생성한 모임 회원 수락 (신청이 되어있을 때)
	int updateConfirmApplyMeeting(String memberId, int meetingId) throws DataAccessException;
	
	// 모임 신청 취소 (찜하기 되어 있지 않을 경우), 모임 찜하기 취소 (신청, 수락 되어있지 않을 경우), 내가 생성한 모임 회원 내보내기
	void deleteMemberMeeting(String memberId, int meetingId) throws DataAccessException;
	
	
	
	// 내가 속한 모임 아이디 조회
	List<Integer> getMyJoinMeetingId(String memberId);
	
	// 내가 찜한 모임 아이디 조회
	List<Integer> getMyLikeMeetingId(String memberId);
	
	// 내가 신청한 모임 아이디 조회
	List<Integer> getMyApplyMeetingId(String memberId);
}
