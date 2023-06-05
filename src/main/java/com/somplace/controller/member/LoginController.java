package com.somplace.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@PostMapping("/member/login")
	public ModelAndView login(@RequestParam("memberId") String memberId, 
						@RequestParam("password") String password,
						Model model, HttpSession session) {
		
		Member member = memberService.getMember(memberId);
		if(member == null) {
			model.addAttribute("msg", "존재하지 않는 아이디입니다.");
		}
		else if(!member.getPw().equals(password)) {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		}
		else {
			member.setLikeMeetingIdList(memberMeetingService.getMyLikeMeetingId(memberId));
			session.setAttribute("memberSession", member);
			return new ModelAndView("redirect:/meeting/sort/all");
		}
		
		model.addAttribute("url", "/");
		return new ModelAndView("alert");
	}
}
