package com.somplace.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;

@Mapper
public interface ReviewMapper {
	//후기 생성
	void createReview(ReviewCommand reviewCommand);
	
	//후기 수정
	void updateReview(ReviewCommand reviewCommand);
	
	//후기 목록 조회
	List<Review> getReviewById(int meetingId);
	
	//후기 한 개 조회
	Review getReviewBymeetingIdAndId(@Param("meetingId")int meetingId, @Param("id")String id);
}