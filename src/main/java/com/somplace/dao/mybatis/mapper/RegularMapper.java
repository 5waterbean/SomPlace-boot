package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.somplace.domain.Regular;
import com.somplace.domain.command.RegularCommand;

@Mapper
public interface RegularMapper {
	// 정기적 모임 생성
	void createRegular(RegularCommand meetingCommand);
		
	// 정기적 모임 수정
	void updateRegular(RegularCommand meetingCommand);
	
	// 정기적 모임 가져오기
	Regular getRegularById(int meetingId);
		
	// 정기적 최신순 정렬
	List<Regular> sortRegularByOrder() throws DataAccessException;
				
	// 정기적 인기순 정렬
	List<Regular> sortRegularByHeart() throws DataAccessException;
		
	// 정기적 모임 카테고리별 최신순 정렬
	List<Regular> sortRegularCategoryByOrder(String category) throws DataAccessException;
		
	// 정기적 모임 카테고리별 인기순 정렬
	List<Regular> sortRegularCategoryByHeart(String category) throws DataAccessException;
		
	// 정기적모임(키워드) 검색, 최신순 정렬
	List<Regular> searchRegularByKeyOrder(String key) throws DataAccessException;
			
	// 정기적모임(키워드) 검색, 인기순 정렬
	List<Regular> sortRegularByKeyHeart(String key) throws DataAccessException;
			
	// 정기적모임 카테고리별(키워드) 검색, 최신순 정렬
	List<Regular> searchRegularCategoryByKeyOrder(@Param("key")String key, @Param("category")String category) throws DataAccessException;
			
	// 정기적모임 카테고리별(키워드) 검색, 인기순 정렬
	List<Regular> sortRegularCategoryByKeyHeart(@Param("key")String key, @Param("category")String category) throws DataAccessException;
		
}
