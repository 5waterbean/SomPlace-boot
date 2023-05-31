package com.somplace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMemberDao;
import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MybatisMemberDao memberDao;
	
	public Member getMember(String memberId){
		return memberDao.getMember(memberId);
	}
	
	public void createMember(MemberCommand memberComm){
		memberDao.createMember(memberComm);
	}
	
	public int memberIdCheck(String memberId) {
		return memberDao.memberIdCheck(memberId);
	}
}
