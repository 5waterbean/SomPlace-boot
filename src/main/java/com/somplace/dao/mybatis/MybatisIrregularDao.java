package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.IrregularDao;
import com.somplace.dao.mybatis.mapper.IrregularMapper;
import com.somplace.domain.Irregular;
import com.somplace.domain.command.MeetingCommand;

@Repository
public class MybatisIrregularDao implements IrregularDao {
	@Autowired
	private IrregularMapper irregularMapper;
	
	// 일시적모임 생성
	public void createIrregular(MeetingCommand meetingCommand)  throws DataAccessException {
		irregularMapper.createIrregular(meetingCommand);
	}
	// 일시적모임 수정
	public void updateIrregular(MeetingCommand meetingCommand)  throws DataAccessException {
		irregularMapper.updateIrregular(meetingCommand);
	}
		
	// 일시적모임 조회
	public Irregular getIrregularById(int meetingId)  throws DataAccessException {
		return irregularMapper.getIrregularById(meetingId);
	}
	
	// 일시적모임 최신순 정렬
	public List<Irregular> sortIrregularByOrder()  throws DataAccessException {
		return irregularMapper.sortIrregularByOrder();
	}	
	// 일시적모임 인기순 정렬
	public List<Irregular> sortIrregularByHeart()  throws DataAccessException {
		return irregularMapper.sortIrregularByHeart();
	}	
	
	//일시적모임 카테고리별 최신순 정렬
	public List<Irregular> sortIrregularCategoryByOrder(String category) throws DataAccessException {
		return irregularMapper.sortIrregularCategoryByOrder(category);
	}
	//일시적모임 카테고리별 인기순 정렬
	public List<Irregular> sortIrregularCategoryByHeart(String category) throws DataAccessException {
		return irregularMapper.sortIrregularCategoryByHeart(category);
	}

	//일시적모임(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularByKeyOrder(String key) throws DataAccessException {
		return irregularMapper.searchIrregularByKeyOrder(key);
	}
	//일시적모임(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularByKeyHeart(String key) throws DataAccessException {
		return irregularMapper.sortIrregularByKeyHeart(key);
	}

	//일시적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularCategoryByKeyOrder(String key, String category) throws DataAccessException {
		return irregularMapper.searchIrregularCategoryByKeyOrder(key, category);
	}
	//일시적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularCategoryByKeyHeart(String key, String category) throws DataAccessException {
		return irregularMapper.sortIrregularCategoryByKeyHeart(key, category);
	}
}
