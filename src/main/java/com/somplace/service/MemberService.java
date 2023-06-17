package com.somplace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMemberDao;
import com.somplace.dao.mybatis.MybatisRatingDao;
import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MybatisMemberDao memberDao;
	
	@Autowired
	private MybatisRatingDao ratingDao;
	
	public Member getMember(String memberId) {
		return memberDao.getMember(memberId);
	}
	
	public void createMember(MemberCommand memberComm) {
		memberDao.createMember(memberComm);
	}
	
	public int memberIdCheck(String memberId) {
		return memberDao.memberIdCheck(memberId);
	}
	
	public void updateMember(MemberCommand memberComm) {
		memberDao.updateMember(memberComm);
	}
	
	public int deleteMember(String memberId) {
		return memberDao.deleteMember(memberId);
	}
	
	public int ratingCheck(String rater, String evaluatedMember, int meetingId) {
		return ratingDao.ratingCheck(rater, evaluatedMember, meetingId);
	}
	
	@Transactional
	public int rateMember(String rater, String evaluatedMember, int meetingId, String type) {
		if(type.equals("like")) {
			memberDao.updateMemberGood(evaluatedMember);
			return ratingDao.likeMember(rater, evaluatedMember, meetingId);
		}
		else {
			memberDao.updateMemberBad(evaluatedMember);
			return ratingDao.dislikeMember(rater, evaluatedMember, meetingId);
		}
	}
}
