package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Meeting;
import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;

@Mapper
public interface RegularMapper {
	void createRegular(MeetingCommand meetingCommand);
	void updateRegular(Regular regular);
	List<Meeting> searchRegularByKey(String key, String category);
	List<Meeting> sortRegularByHeart(String category);
	List<Meeting> sortRegularByOrder(String category);
}
