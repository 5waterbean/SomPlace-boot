package com.somplace.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.service.ReviewService;

@Controller
@RequestMapping("/review/info")
public class InfoReviewListController {
	@Autowired
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	@GetMapping
	public ModelAndView infoReviewList(@RequestParam("meetingId") int meetingId) {
		ModelAndView mav = new ModelAndView("");
		
		
		return mav;
	}
}
