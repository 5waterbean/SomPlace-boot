package com.somplace.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somplace.service.MemberService;

@Controller
public class MemberRatingController {
	@Autowired
	private MemberService memberService;

	@PostMapping("member/rating")
	@ResponseBody
	public String rateMember(@RequestParam String rater, @RequestParam String evaluatedMember, @RequestParam int meetingId, @RequestParam String type) {
		if(memberService.ratingCheck(rater, evaluatedMember, meetingId) == 0) {
			if(memberService.rateMember(rater, evaluatedMember, meetingId, type) == 1)
				return type + "Success";
		}
		return "rated";
	}
}
