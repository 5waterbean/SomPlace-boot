package com.somplace.dao;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Member;

public interface MemberDao {
	public Member getMember(String memberId) throws DataAccessException;
}
