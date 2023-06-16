package com.somplace.controller.review;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.domain.Regular;
import com.somplace.domain.Review;
import com.somplace.domain.command.ReviewCommand;
import com.somplace.service.RegularService;
import com.somplace.service.ReviewService;

@Controller
@RequestMapping("/review/update")
@SessionAttributes("memberSession")
public class UpdateReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private RegularService regularService;

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	public void setRegularService(RegularService regularService) {
		this.regularService = regularService;
	}

	// 수정하기 버튼 클릭 -> 후기 수정 페이지로 이동
	@GetMapping("/form")
	public ModelAndView form(@RequestParam("meetingId") int meetingId,
			@ModelAttribute("memberSession") Member memberSession,
			@RequestParam(value = "scoreSum", defaultValue = "0") double scoreSum) {
		ModelAndView mav = new ModelAndView("review/reviewUpdate");

		Regular regular = regularService.getRegularById(meetingId);
		mav.addObject("regular", regular);

		List<Review> reviewList = reviewService.getReviewById(meetingId);
		mav.addObject("reviewList", reviewList);

		Review reviewOne = reviewService.getReviewBymeetingIdAndId(meetingId, memberSession.getMemberId());
		mav.addObject("review", reviewOne);
		
		mav.addObject("scoreSum", scoreSum);

		return mav;
	}

	// 후기 수정(POST)
	@PostMapping
	public ModelAndView updateReview(@Valid @ModelAttribute ReviewCommand reviewCommand, BindingResult result,
			@RequestParam("meetingId") int meetingId, @ModelAttribute("memberSession") Member memberSession,
			@RequestParam(value = "scoreSum", defaultValue = "0") double scoreSum) {
		// 성공했을 때 넘어가야하기 때문에 만들기
		ModelAndView mav = new ModelAndView("redirect:/meeting/regular/info");

		if (result.hasErrors()) {
			mav = new ModelAndView("review/reviewUpdate");
		} else {
			reviewService.updateReview(reviewCommand);

			// /meeting/regular/info에서 getMapping 할 때 checkedById로 매개변수로 넘어감
			mav.addObject("checkedById", reviewCommand.getMeetingId());

			List<Review> reviewList = reviewService.getReviewById(meetingId);
			mav.addObject("reviewList", reviewList);

			Review reviewOne = reviewService.getReviewBymeetingIdAndId(meetingId, memberSession.getMemberId());
			mav.addObject("review", reviewOne);
		}

		mav.addObject("scoreSum", scoreSum);
		
		return mav;
	}

}