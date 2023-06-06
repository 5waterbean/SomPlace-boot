package com.somplace.dao;

import java.util.List;

import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;

public interface ReviewDao {
	//후기 생성
	public void createReview(ReviewCommand reviewCommand);
	
	//후기 수정
	public void updateReview(ReviewCommand reviewCommand);
	
	//후기 목록 조회
	public List<Review> getReviewById(int meetingId);
}
