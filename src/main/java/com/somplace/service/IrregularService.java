package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisIrregularDao;
import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;

@Service
@Transactional
public class IrregularService {
	@Autowired
	private MybatisIrregularDao irregularDao;
	
	//일시적모임 생성
	public void createIrregular(Irregular irregular) {
		irregularDao.createIrregular(irregular);
	}
	//일시적모임 수정
	public void updateIrregular(Irregular irregular) {
		irregularDao.updateIrregular(irregular);
	}
	
	//일시적모임 가져오기
	public Irregular getIrregularById(int meetingId) {
		return irregularDao.getIrregularById(meetingId);
	}
	
	//일시적모임(키워드) 검색
	public List<Meeting> searchIrregularByKey(String key, String category) {
		return irregularDao.searchIrregularByKey(key, category);
	}
	
	//일시적모임 정렬
	public List<Meeting> sortIrregular(String sortWith, String category) {
		if (sortWith.equals("heart")) {
			return irregularDao.sortIrregularByHeart(category);
		} else {
			return irregularDao.sortIrregularByOrder(category);
		}
	}
}
