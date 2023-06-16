package com.somplace.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
	public void createReview(ReviewCommand reviewCommand) throws DataAccessException {
		reviewMapper.createReview(reviewCommand);
	}

//	후기 수정
	@Override
	public void updateReview(ReviewCommand reviewCommand) throws DataAccessException {
		reviewMapper.updateReview(reviewCommand);
	}

//	후기 목록 보기
	@Override
	public List<Review> getReviewById(int meetingId) throws DataAccessException {
		return reviewMapper.getReviewById(meetingId);
	}

//	후기 한 개 목록 조회
	@Override
	public Review getReviewBymeetingIdAndId(int meetingId, String id) throws DataAccessException {
		return reviewMapper.getReviewBymeetingIdAndId(meetingId, id);
	}

}
