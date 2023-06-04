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
}
