package com.somplace.dao.mybatis.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Mapper
public interface IrregularMapper {
	//일시적모임 생성
	void createIrregular(MeetingCommand meetingCommand);
	//일시적모임 수정
	void updateIrregular(Irregular irregular);
	
	//일시적모임 가져오기
	Irregular getIrregularById(int meetingId);
	
	//일시적모임(키워드) 검색
	List<Meeting> searchIrregularByKey(String key, String category);
	
	//일시적모임 인기순 정렬
	List<Meeting> sortIrregularByHeart(String category);
	//일시적모임 최신순 정렬
	List<Meeting> sortIrregularByOrder(String category);
}
