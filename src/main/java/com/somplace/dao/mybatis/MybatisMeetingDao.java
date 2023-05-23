package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.MeetingDao;
import com.somplace.dao.mybatis.mapper.MeetingMapper;
import com.somplace.domain.Meeting;

@Repository
public class MybatisMeetingDao implements MeetingDao {
	@Autowired
	private MeetingMapper MeetingMapper;

	// 모임 전체 조회
	public List<Meeting> getMeetingList() throws DataAccessException {
		return MeetingMapper.getMeetingList();
	}
	// 모임 검색
	
	// 모임 정렬
	
	// 모임 삭제
}
