package com.somplace.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;

public interface ReviewDao {
	//후기 생성
	public void createReview(ReviewCommand reviewCommand) throws DataAccessException;
	
	//후기 수정
	public void updateReview(ReviewCommand reviewCommand) throws DataAccessException;
	
	//후기 전체 목록 조회
	public List<Review> getReviewById(int meetingId) throws DataAccessException;
	
	//후기 하나 조회
	public Review getReviewBymeetingIdAndId(int meetingId, String id) throws DataAccessException;
}
