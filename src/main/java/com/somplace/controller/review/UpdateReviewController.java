package com.somplace.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.service.ReviewService;

@Controller
@RequestMapping("/review/update")
public class UpdateReviewController {
	@Autowired
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	//	수정하기 버튼 클릭 -> 후기 수정 페이지로 이동
//	@GetMapping("/form")
//	public ModelAndView form()
	
	//	후기 수정(POST)
	
}