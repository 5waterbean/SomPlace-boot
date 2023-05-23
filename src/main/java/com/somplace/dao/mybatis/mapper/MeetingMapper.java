package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Meeting;

@Mapper
public interface MeetingMapper {
	List<Meeting> getMeetingList();
}
