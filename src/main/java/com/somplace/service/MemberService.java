package com.somplace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisMemberDao;
import com.somplace.domain.Member;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MybatisMemberDao memberDao;
	
	public Member getMember(String memberId){
		return memberDao.getMember(memberId);
	}
}
