package com.somplace.dao;

import org.springframework.dao.DataAccessException;

public interface RatingDao {
	public int ratingCheck(String rater, String evaluatedMember, int meetingId) throws DataAccessException;

	public int likeMember(String rater, String evaluatedMember, int meetingId) throws DataAccessException;
	
	public int dislikeMember(String rater, String evaluatedMember, int meetingId) throws DataAccessException;
}
