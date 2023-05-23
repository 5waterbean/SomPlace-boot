package com.somplace.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.MemberDao;
import com.somplace.dao.mybatis.mapper.MemberMapper;
import com.somplace.domain.Member;

@Repository
public class MybatisMemberDao implements MemberDao {
	@Autowired
	private MemberMapper memberMapper;
	
	public Member getMember(String memberId) throws DataAccessException {
		return memberMapper.getMember(memberId);
	}
}
