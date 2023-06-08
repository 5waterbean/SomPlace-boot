package com.somplace.controller.member;

import java.time.LocalDate;

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
						@RequestParam("password") String password, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = memberService.getMember(memberId);
		
		if(member == null) {
			mav.addObject("msg", "존재하지 않는 아이디입니다.");
		}
		else if(!member.getPw().equals(password)) {
			mav.addObject("msg", "비밀번호가 틀렸습니다.");
		}
		else {
			mav.setViewName("redirect:/meeting/sort/all");
			member.setLikeMeetingIdList(memberMeetingService.getMyLikeMeetingId(memberId));
			member.setApplyMeetingIdList(memberMeetingService.getMyApplyMeetingId(memberId));
			session.setAttribute("memberSession", member);
			
			LocalDate now = LocalDate.now();
			int month = now.getMonthValue(); // 이번 달
			int lastDate = now.lengthOfMonth(); // 해당 월의 마지막 날짜 ex)28, 30, 31
			int firstDay = now.withDayOfMonth(1).getDayOfWeek().getValue(); // 해당 월의 시작 요일
			
			MyCalendar mc = new MyCalendar(month, lastDate, firstDay);
			session.setAttribute("myCalendar", mc);
			
			return mav;
		}
		
		mav.addObject("url", "/");
		mav.setViewName("alert");
		return mav;
	}
}
