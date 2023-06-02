package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisRegularDao;
import com.somplace.domain.Regular;
import com.somplace.domain.command.RegularCommand;

@Service
@Transactional
public class RegularService {
	@Autowired
	private MybatisRegularDao regularDao;
	
	// 정기적 모임 생성
	public void createRegular(RegularCommand meetingCommand) throws DataAccessException {
		regularDao.createRegular(meetingCommand);
	}
		
	// 정기적 모임 수정
	public void updateRegular(RegularCommand meetingCommand) throws DataAccessException {
		regularDao.updateRegular(meetingCommand);
	}
	
	// 정기적 모임 조회
	public Regular getRegularById(int meetingId) throws DataAccessException {
		return regularDao.getRegularById(meetingId);
	}
		
	// 정기적 정렬
	public List<Regular> sortRegular(String sortWith) {
		if (sortWith.equals("order")) {
			return regularDao.sortRegularByOrder(); 
		} else {
			return regularDao.sortRegularByHeart();
		}
	}
	
	// 정기적모임 카테고리 정렬
	public List<Regular> sortRegularCategory(String category, String sortWith) {
		if (sortWith.equals("order")) {
			return regularDao.sortRegularCategoryByOrder(category);
		} else {
			return regularDao.sortRegularCategoryByHeart(category);
		}
	}
	
	// 정기적모임(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularByKeyOrder(String key) throws DataAccessException {
		return regularDao.searchRegularByKeyOrder(key);
	}
		
	// 정기적모임(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularByKeyHeart(String key) throws DataAccessException {
		return regularDao.sortRegularByKeyHeart(key);
	}
		
	// 정기적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularCategoryByKeyOrder(String key, String category) throws DataAccessException {
		return regularDao.searchRegularCategoryByKeyOrder(key, category);
	}
		
	// 정기적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularCategoryByKeyHeart(String key, String category) throws DataAccessException {
		return regularDao.sortRegularCategoryByKeyHeart(key, category);
	}
}
