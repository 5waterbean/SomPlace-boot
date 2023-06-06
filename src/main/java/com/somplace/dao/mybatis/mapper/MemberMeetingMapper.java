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
	public void insertApplyMeeting(@Param("memberId")String memberId, @Param("meetingId")int meetingId);

	// 모임 찜하기 (모임 신청 안했을 경우)
	public void insertHeartMeeting(@Param("memberId")String memberId, @Param("meetingId")int meetingId);
	
	
	// 내가 속한 모임 아이디 조회
	List<Integer> getMyJoinMeetingId(String memberId);
	
	// 내가 찜한 모임 아이디 조회
	List<Integer> getMyLikeMeetingId(String memberId);
	
	// 내가 신청한 모임 아이디 조회
	List<Integer> getMyApplyMeetingId(String memberId);
}
