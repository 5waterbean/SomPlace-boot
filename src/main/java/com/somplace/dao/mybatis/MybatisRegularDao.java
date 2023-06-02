package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.RegularDao;
import com.somplace.dao.mybatis.mapper.RegularMapper;
import com.somplace.domain.Regular;
import com.somplace.domain.command.RegularCommand;

@Repository
public class MybatisRegularDao implements RegularDao {
	@Autowired
	private RegularMapper regularMapper;
	
	// 정기적 모임 생성
	public void createRegular(RegularCommand meetingCommand) throws DataAccessException {
		regularMapper.createRegular(meetingCommand);
	}
	
	// 정기적 모임 수정
	public void updateRegular(RegularCommand meetingCommand) throws DataAccessException {
		regularMapper.updateRegular(meetingCommand);
	}
	
	// 정기적 모임 조회
	public Regular getRegularById(int meetingId) throws DataAccessException {
		return regularMapper.getRegularById(meetingId);
	}
	
	// 정기적 최신순 정렬
	public List<Regular> sortRegularByOrder() throws DataAccessException {
		return regularMapper.sortRegularByOrder();
	}
			
	// 정기적 인기순 정렬
	public List<Regular> sortRegularByHeart() throws DataAccessException {
		return regularMapper.sortRegularByHeart();
	}
	
	// 정기적 모임 카테고리별 최신순 정렬
	public List<Regular> sortRegularCategoryByOrder(String category) throws DataAccessException {
		return regularMapper.sortRegularCategoryByOrder(category);
	}
		
	// 정기적 모임 카테고리별 인기순 정렬
	public List<Regular> sortRegularCategoryByHeart(String category) throws DataAccessException {
		return regularMapper.sortRegularCategoryByHeart(category);
	}
	
	// 정기적모임(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularByKeyOrder(String key) throws DataAccessException {
		return regularMapper.searchRegularByKeyOrder(key);
	}
		
	// 정기적모임(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularByKeyHeart(String key) throws DataAccessException {
		return regularMapper.sortRegularByKeyHeart(key);
	}
		
	// 정기적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Regular> searchRegularCategoryByKeyOrder(String key, String category) throws DataAccessException {
		return regularMapper.searchRegularCategoryByKeyOrder(key, category);
	}
		
	// 정기적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Regular> sortRegularCategoryByKeyHeart(String key, String category) throws DataAccessException {
		return regularMapper.sortRegularCategoryByKeyHeart(key, category);
	}
	
}
