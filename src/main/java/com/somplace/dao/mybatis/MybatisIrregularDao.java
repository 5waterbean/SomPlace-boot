package com.somplace.dao.mybatis;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.somplace.dao.IrregularDao;
import com.somplace.dao.mybatis.mapper.IrregularMapper;
import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;
import com.somplace.domain.command.MeetingCommand;

@Repository
public class MybatisIrregularDao implements IrregularDao {
	@Autowired
	private IrregularMapper irregularMapper;
	
	// 일시적모임 생성
	public void createIrregular(MeetingCommand meetingCommand) {
		irregularMapper.createIrregular(meetingCommand);
	}
	// 일시적모임 수정
	public void updateIrregular(Irregular irregular) {
		irregularMapper.updateIrregular(irregular);
	}
		
	// 일시적모임 가져오기
	public Irregular getIrregularById(int meetingId) {
		return irregularMapper.getIrregularById(meetingId);
	}
		
	// 일시적모임(키워드) 검색
	public List<Meeting> searchIrregularByKey(String key, String category) {
		return irregularMapper.searchIrregularByKey(key, category);
	}
		
	// 일시적모임 인기순 정렬
	public List<Meeting> sortIrregularByHeart(String category) {
		return irregularMapper.sortIrregularByHeart(category);
	}	
	// 일시적모임 최신순 정렬
	public List<Meeting> sortIrregularByOrder(String category) {
		return irregularMapper.sortIrregularByOrder(category);
	}
}
