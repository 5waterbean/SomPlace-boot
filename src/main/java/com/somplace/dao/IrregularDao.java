package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Irregular;
import com.somplace.domain.command.IrregularCommand;

public interface IrregularDao {
	// 일시적모임 생성
	public void createIrregular(IrregularCommand meetingCommand) throws DataAccessException;
	// 일시적모임 수정
	public void updateIrregular(IrregularCommand meetingCommand) throws DataAccessException;
	
	//일시적모임 조회
	public Irregular getIrregularById(int meetingId) throws DataAccessException;
	
	// 일시적모임 최신순 정렬
	public List<Irregular> sortIrregularByOrder() throws DataAccessException;
	// 일시적모임 인기순 정렬
	public List<Irregular> sortIrregularByHeart() throws DataAccessException;
	
	//일시적모임 카테고리별 최신순 정렬
	public List<Irregular> sortIrregularCategoryByOrder(String category) throws DataAccessException;
	//일시적모임 카테고리별 인기순 정렬
	public List<Irregular> sortIrregularCategoryByHeart(String category) throws DataAccessException;

	//일시적모임(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularByKeyOrder(String key) throws DataAccessException;
	//일시적모임(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularByKeyHeart(String key) throws DataAccessException;

	//일시적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularCategoryByKeyOrder(String key, String category) throws DataAccessException;
	//일시적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularCategoryByKeyHeart(String key, String category) throws DataAccessException;
}
