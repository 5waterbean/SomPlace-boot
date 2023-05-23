package com.somplace.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Member;

@Mapper
public interface MemberMapper {
	Member getMember(String id);
}
