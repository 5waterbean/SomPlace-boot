package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.somplace.domain.Irregular;
import com.somplace.domain.command.IrregularCommand;

@Mapper
public interface IrregularMapper {
	//일시적모임 생성
	void createIrregular(IrregularCommand meetingCommand);
	//일시적모임 수정
	void updateIrregular(IrregularCommand meetingCommand);
	
	//일시적모임 가져오기
	Irregular getIrregularById(int meetingId);
	
	//일시적모임 최신순 정렬
	List<Irregular> sortIrregularByOrder();
	//일시적모임 인기순 정렬
	List<Irregular> sortIrregularByHeart();
	
	//일시적모임 카테고리별 최신순 정렬
	List<Irregular> sortIrregularCategoryByOrder(String category) throws DataAccessException;
	//일시적모임 카테고리별 인기순 정렬
	List<Irregular> sortIrregularCategoryByHeart(String category) throws DataAccessException;

	//일시적모임(키워드) 검색, 최신순 정렬
	List<Irregular> searchIrregularByKeyOrder(String key) throws DataAccessException;
	//일시적모임(키워드) 검색, 인기순 정렬
	List<Irregular> sortIrregularByKeyHeart(String key) throws DataAccessException;

	//일시적모임 카테고리별(키워드) 검색, 최신순 정렬
	List<Irregular> searchIrregularCategoryByKeyOrder(@Param("key")String key, @Param("category")String category) throws DataAccessException;
	//일시적모임 카테고리별(키워드) 검색, 인기순 정렬
	List<Irregular> sortIrregularCategoryByKeyHeart(@Param("key")String key, @Param("category")String category) throws DataAccessException;

	// 내가 속한 일시적 모임 조회
	List<Irregular> getMyJoinIrregularList(List<Integer> meetingIdList) throws DataAccessException;
}
