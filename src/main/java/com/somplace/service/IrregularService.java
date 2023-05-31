package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisIrregularDao;
import com.somplace.domain.Irregular;
import com.somplace.domain.command.MeetingCommand;

@Service
@Transactional
public class IrregularService {
	@Autowired
	private MybatisIrregularDao irregularDao;
	
	//일시적모임 생성
	public void createIrregular(MeetingCommand meetingCommand) {
		irregularDao.createIrregular(meetingCommand);
	}
	//일시적모임 수정
	public void updateIrregular(MeetingCommand meetingCommand) {
		irregularDao.updateIrregular(meetingCommand);
	}
	
	//일시적모임 가져오기
	public Irregular getIrregularById(int meetingId) {
		return irregularDao.getIrregularById(meetingId);
	}
	
	//일시적모임 정렬
	public List<Irregular> sortIrregular(String sortWith) {
		if (sortWith.equals("heart")) {
			return irregularDao.sortIrregularByHeart();
		} else {
			return irregularDao.sortIrregularByOrder();
		}
	}
	
	// 일시적모임 카테고리별 정렬
	public List<Irregular> sortIrregularCategory(String category, String sortWith) {
		if (sortWith.equals("order")) {
			return irregularDao.sortIrregularCategoryByOrder(category);
		} else {
			return irregularDao.sortIrregularCategoryByHeart(category);
		}
	}
	
	//일시적모임(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularByKeyOrder(String key) {
		return irregularDao.searchIrregularByKeyOrder(key);
	}
	//일시적모임(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularByKeyHeart(String key) {
		return irregularDao.sortIrregularByKeyHeart(key);
	}

	//일시적모임 카테고리별(키워드) 검색, 최신순 정렬
	public List<Irregular> searchIrregularCategoryByKeyOrder(String key, String category) {
		return irregularDao.searchIrregularCategoryByKeyOrder(key, category);
	}
	//일시적모임 카테고리별(키워드) 검색, 인기순 정렬
	public List<Irregular> sortIrregularCategoryByKeyHeart(String key, String category) {
		return irregularDao.sortIrregularCategoryByKeyHeart(key, category);
	}
}
