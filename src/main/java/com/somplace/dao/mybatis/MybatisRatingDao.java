package com.somplace.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.somplace.dao.RatingDao;
import com.somplace.dao.mybatis.mapper.RatingMapper;

@Repository
public class MybatisRatingDao implements RatingDao {
	@Autowired
	private RatingMapper ratingMapper;
	
	public int ratingCheck(String rater, String evaluatedMember, int meetingId) throws DataAccessException {
		return ratingMapper.ratingCheck(rater, evaluatedMember, meetingId); 
	}
	
	public int likeMember(String rater, String evaluatedMember, int meetingId) throws DataAccessException {
		return ratingMapper.likeMember(rater, evaluatedMember, meetingId);
	}
	
	public int dislikeMember(String rater, String evaluatedMember, int meetingId) throws DataAccessException {
		return ratingMapper.dislikeMember(rater, evaluatedMember, meetingId);
	}

}
