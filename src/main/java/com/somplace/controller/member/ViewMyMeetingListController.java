package com.somplace.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Meeting;
import com.somplace.domain.Member;
import com.somplace.service.MeetingService;

@Controller
@SessionAttributes("memberSession")
@RequestMapping("/member/myMeeting")
public class ViewMyMeetingListController {
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping("/made")
	public ModelAndView getMadeMeetingList(@ModelAttribute("memberSession") Member loginMember) {
//		List<Meeting> madeMeetingList = meetingService.getMadeMeetingList(loginMember.getMemberId());
		List<Meeting> madeMeetingList = meetingService.getMeetingList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("meetingListType", "made");
		mav.addObject("myMeetingList", madeMeetingList);
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
}
