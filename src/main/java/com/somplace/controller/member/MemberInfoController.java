package com.somplace.controller.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.domain.command.MemberCommand;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;

@Controller
@RequestMapping("/member/myInfo")
public class MemberInfoController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMeetingService memberMeetingService;

	@GetMapping
	public String myInfo() {
		return "member/myInfo";
	}
	
	@GetMapping("/update")
	public ModelAndView updateMyInfoForm() {
		return new ModelAndView("member/myInfoUpdate", "majorList", JoinMemberController.majorList);
	}
	
	@PostMapping("/update")
	public ModelAndView updateMyInfo(@Valid @ModelAttribute MemberCommand memberCommand, 
										BindingResult bindingResult, HttpSession session, SessionStatus sessionStatus) {		
		if (bindingResult.hasErrors()) {
			return new ModelAndView("member/myInfoUpdate", "majorList", JoinMemberController.majorList);
		}
		
		String memberId = memberCommand.getMemberId();
		memberService.updateMember(memberCommand);
		
		Member updateMember = memberService.getMember(memberId);
		updateMember.setLikeMeetingIdList(memberMeetingService.getMyLikeMeetingId(memberId));
		updateMember.setApplyMeetingIdList(memberMeetingService.getMyApplyMeetingId(memberId));
		updateMember.setJoinMeetingIdList(memberMeetingService.getMyJoinMeetingId(memberId));
		
		sessionStatus.setComplete();
		session.setAttribute("memberSession", updateMember);
		
		return new ModelAndView("redirect:/member/myInfo");
	}
}
