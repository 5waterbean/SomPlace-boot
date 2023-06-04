package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMeetingMapper {
	// 회원 리스트 조회
	List<String> findJoinMemberIdList(int meetingId);
	
	// 신청자 리스트 조회
	List<String> findApplyMemberIdList(int meetingId);
}
