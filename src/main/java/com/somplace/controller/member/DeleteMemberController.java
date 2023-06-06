package com.somplace.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.service.MemberService;

@Controller
@SessionAttributes("memberSession")
public class DeleteMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/delete")
	public ModelAndView deleteMember(@ModelAttribute("memberSession") Member loginMember, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		int result = memberService.deleteMember(loginMember.getMemberId());
		
		if(result == 1) {
			mav.addObject("msg", "탈퇴되었습니다.");
			mav.addObject("url", "/");
		}
		else {
			mav.addObject("msg", "탈퇴를 실패했습니다.");
			mav.addObject("url", "/member/myInfo");
		}
		
		session.invalidate();
		return mav;
	}
}
