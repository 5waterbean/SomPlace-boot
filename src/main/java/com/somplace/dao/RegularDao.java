package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;

public interface RegularDao {
	// 정기적 모임 생성
	public void createRegular(MeetingCommand meetingCommand) throws DataAccessException;
			
	// 정기적 모임 수정
	public void updateRegular(Regular regular) throws DataAccessException;
			
	// 정기적 최신순 정렬
	public List<Regular> sortRegularByOrder() throws DataAccessException;
			
	// 정기적 인기순 정렬
	public List<Regular> sortRegularByHeart() throws DataAccessException;
	
	// 정기적 모임 카테고리별 최신순 정렬
	public List<Regular> sortRegularCategoryByOrder(String category) throws DataAccessException;
	
	// 정기적 모임 카테고리별 인기순 정렬
	public List<Regular> sortRegularCategoryByHeart(String category) throws DataAccessException;
	
	// 정기적모임(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularByKeyOrder(String key) throws DataAccessException;
		
	// 정기적모임(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularByKeyHeart(String key) throws DataAccessException;
		
	// 정기적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularCategoryByKeyOrder(String key, String category) throws DataAccessException;
		
	// 정기적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularCategoryByKeyHeart(String key, String category) throws DataAccessException;
	
}
