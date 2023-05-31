package com.somplace.dao;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;

public interface MemberDao {
	public Member getMember(String memberId) throws DataAccessException;
	
	public void createMember(MemberCommand memberComm) throws DataAccessException;
	
	public int memberIdCheck(String memberId) throws DataAccessException;
}
