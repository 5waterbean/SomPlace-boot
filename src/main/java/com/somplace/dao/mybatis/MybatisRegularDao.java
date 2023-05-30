package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.somplace.dao.RegularDao;
import com.somplace.dao.mybatis.mapper.RegularMapper;
import com.somplace.domain.Meeting;
import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;

@Repository
public class MybatisRegularDao implements RegularDao {
	@Autowired
	private RegularMapper regularMapper;
	
	// 정기적 모임 생성
	public void createRegular(MeetingCommand meetingCommand) {
		regularMapper.createRegular(meetingCommand);
	}
	
	// 정기적 모임 수정
	public void updateRegular(Regular regular) {
		regularMapper.updateRegular(regular);
	}
	
	// 정기적 모임(키워드) 검색
	public List<Meeting> searchRegularByKey(String key, String category) {
		return regularMapper.searchRegularByKey(key, category);
	}
	
	// 정기적 인기순 정렬
	public List<Meeting> sortRegularByHeart(String category) {
		return regularMapper.sortRegularByHeart(category);
	}
	
	// 정기적 인기순 정렬
	public List<Meeting> sortRegularByOrder(String category) {
		return regularMapper.sortRegularByOrder(category);
	}
}
