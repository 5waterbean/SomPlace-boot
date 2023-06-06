package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMeetingMapper {
	// 회원 리스트 조회
	List<String> findJoinMemberIdList(int meetingId);
	
	// 신청자 리스트 조회
	List<String> findApplyMemberIdList(int meetingId);
	
	// 내가 속한 모임 아이디 조회
	List<Integer> getMyJoinMeetingId(String memberId);
	
	// 내가 찜한 모임 아이디 조회
	List<Integer> getMyLikeMeetingId(String memberId);
	
	// 내가 신청한 모임 아이디 조회
	List<Integer> getMyApplyMeetingId(String memberId);
}
