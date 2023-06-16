package com.somplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somplace.dao.mybatis.MybatisReviewDao;
import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;

@Service
@Transactional
public class ReviewService {
	@Autowired
	private MybatisReviewDao reviewDao;
	
	//후기 생성
	public void createReview(ReviewCommand reviewCommand) {
		reviewDao.createReview(reviewCommand);
	}
	
	//후기 수정
	public void updateReview(ReviewCommand reviewCommand) {
		reviewDao.updateReview(reviewCommand);
	}
	
	//후기 목록 보기
	public List<Review> getReviewById(int meetingId) {
		return reviewDao.getReviewById(meetingId);		
	}
	
	//후기 한 개 목록 조회
	public Review getReviewBymeetingIdAndId(int meetingId, String id) {
		return reviewDao.getReviewBymeetingIdAndId(meetingId, id);
	}
 }
