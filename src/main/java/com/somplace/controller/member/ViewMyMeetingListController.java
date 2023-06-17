package com.somplace.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;
import com.somplace.domain.Member;
import com.somplace.domain.Regular;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;
import com.somplace.service.RegularService;

@Controller
@SessionAttributes("memberSession")
@RequestMapping("/member/myMeeting")
public class ViewMyMeetingListController {
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private RegularService regularService;
	
	@Autowired
	private IrregularService irregularService;	
	
	@RequestMapping("/made")
	public ModelAndView getMadeMeetingList(@ModelAttribute("memberSession") Member loginMember) {
		List<Meeting> madeMeetingList = meetingService.getMadeMeetingList(loginMember.getMemberId());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("meetingListType", "made");
		mav.addObject("myMeetingList", madeMeetingList);
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
	
	@RequestMapping("/like")
	public ModelAndView getLikeMeetingList(@ModelAttribute("memberSession") Member loginMember) {
		List<Integer> likeMeetingIdList = loginMember.getLikeMeetingIdList();
		ModelAndView mav = new ModelAndView();
		
		if(likeMeetingIdList.size() != 0) {
			List<Meeting> likeMeetingList = meetingService.getMyMeetingList(likeMeetingIdList);
			mav.addObject("myMeetingList", likeMeetingList);
		}
		
		mav.addObject("meetingListType", "like");
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
	
	@RequestMapping("/apply")
	public ModelAndView getApplyMeetingList(@ModelAttribute("memberSession") Member loginMember) {
		List<Integer> applyMeetingIdList = loginMember.getApplyMeetingIdList();
		ModelAndView mav = new ModelAndView();
		
		if(applyMeetingIdList.size() != 0) {
			List<Meeting> applyMeetingList = meetingService.getMyMeetingList(applyMeetingIdList);
			mav.addObject("myMeetingList", applyMeetingList);
		}
		
		mav.addObject("meetingListType", "apply");
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
	
	@RequestMapping("/join/regular")
	public ModelAndView getJoinRegularList(@ModelAttribute("memberSession") Member loginMember) {
		List<Integer> joinMeetingIdList = loginMember.getJoinMeetingIdList();
		ModelAndView mav = new ModelAndView();
		
		if(joinMeetingIdList.size() != 0) {
			List<Regular> joinRegularList = regularService.getMyJoinRegularList(joinMeetingIdList);
			mav.addObject("myMeetingList", joinRegularList);
		}
		
		mav.addObject("meetingListType", "joinRegular");
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
	
	@RequestMapping("/join/irregular")
	public ModelAndView getJoinIrregularList(@ModelAttribute("memberSession") Member loginMember) {
		List<Integer> joinMeetingIdList = loginMember.getJoinMeetingIdList();
		ModelAndView mav = new ModelAndView();
		
		if(joinMeetingIdList.size() != 0) {
			List<Irregular> joinIrregularList = irregularService.getMyJoinIrregularList(joinMeetingIdList);
			mav.addObject("myMeetingList", joinIrregularList);
		}
		
		mav.addObject("meetingListType", "joinIrregular");
		mav.setViewName("member/myMeetingList");
		
		return mav;
	}
}
