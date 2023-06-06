package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.somplace.dao.ReviewDao;
import com.somplace.dao.mybatis.mapper.ReviewMapper;
import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;

@Repository
public class MybatisReviewDao implements ReviewDao {
	@Autowired
	private ReviewMapper reviewMapper;
	
//	후기 생성
	@Override
	public void createReview(ReviewCommand reviewCommand) {
		reviewMapper.createReview(reviewCommand);
	}

//	후기 수정
	@Override
	public void updateReview(ReviewCommand reviewCommand) {
		reviewMapper.updateReview(reviewCommand);
	}

//	후기 목록 보기
	@Override
	public List<Review> getReviewById(int meetingId) {
		return reviewMapper.getReviewById(meetingId);
	}

}
