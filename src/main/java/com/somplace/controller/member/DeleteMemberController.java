package com.somplace.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;

@Controller
@SessionAttributes("memberSession")
public class DeleteMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@RequestMapping("/member/delete")
	public ModelAndView deleteMember(@ModelAttribute("memberSession") Member loginMember, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		String memberId = loginMember.getMemberId();
		List<Integer> joinMeetingList = memberMeetingService.getMyJoinMeetingId(memberId);
		int result = memberService.deleteMember(memberId, joinMeetingList);
		
		if(result == 1) {
			mav.addObject("msg", "탈퇴되었습니다.");
			mav.addObject("url", "/");
			session.invalidate();
		}
		else {
			mav.addObject("msg", "탈퇴를 실패했습니다.");
			mav.addObject("url", "/member/myInfo");
		}
		
		return mav;
	}
}
