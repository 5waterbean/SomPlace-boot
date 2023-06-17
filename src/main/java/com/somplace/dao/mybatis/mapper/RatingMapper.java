package com.somplace.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RatingMapper {
	int ratingCheck(@Param("rater") String rater, @Param("evaluatedMember") String evaluatedMember, @Param("meetingId") int meetingId);

	int likeMember(@Param("rater") String rater, @Param("evaluatedMember") String evaluatedMember, @Param("meetingId") int meetingId);
	
	int dislikeMember(@Param("rater") String rater, @Param("evaluatedMember") String evaluatedMember, @Param("meetingId") int meetingId);
}
