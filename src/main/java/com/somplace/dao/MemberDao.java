package com.somplace.dao;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;

public interface MemberDao {
	public Member getMember(String memberId) throws DataAccessException;
	
	public void createMember(MemberCommand memberComm) throws DataAccessException;
	
	public int memberIdCheck(String memberId) throws DataAccessException;
	
	public void updateMember(MemberCommand memberComm) throws DataAccessException;
	
	public int deleteMember(String memberId) throws DataAccessException;
	
	public void updateMemberGood(String memberId) throws DataAccessException;
	
	public void updateMemberBad(String memberId) throws DataAccessException;
}
