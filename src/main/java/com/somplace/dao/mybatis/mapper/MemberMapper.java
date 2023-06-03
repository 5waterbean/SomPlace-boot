package com.somplace.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;

@Mapper
public interface MemberMapper {
	Member getMember(String memberId);
	
	void createMember(MemberCommand memberComm);
	
	int memberIdCheck(String memberId);
	
	void updateMember(MemberCommand memberComm);
}
