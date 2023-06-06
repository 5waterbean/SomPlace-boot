package com.somplace.controller.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.somplace.domain.Member;
import com.somplace.service.MemberMeetingService;

@Controller
@RequestMapping("/meeting/like")
@SessionAttributes("memberSession")
public class LikeMeetingController {
	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@PostMapping
	@ResponseBody
	public int heartMeeting(@RequestParam("checkedById") int checkedById,
		@ModelAttribute("memberSession") Member memberSession) {
		
		// 모임 찜하기 (insert)
		memberSession.getLikeMeetingIdList().add(checkedById);
		
		return memberMeetingService.insertMemberMeeting(1, memberSession.getMemberId(), checkedById);
	}
	
}	
