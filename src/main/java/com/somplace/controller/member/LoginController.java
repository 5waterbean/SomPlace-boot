package com.somplace.controller.member;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;
import com.somplace.service.RegularService;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private IrregularService irregularService;
	
	@Autowired
	private RegularService regularService;
	
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
			List<Integer> joinMeetingIdList = memberMeetingService.getMyJoinMeetingId(memberId);
			member.setLikeMeetingIdList(memberMeetingService.getMyLikeMeetingId(memberId));
			member.setApplyMeetingIdList(memberMeetingService.getMyApplyMeetingId(memberId));
			member.setJoinMeetingIdList(joinMeetingIdList);		
			session.setAttribute("memberSession", member);
			
			LocalDate now = LocalDate.now();
			MyCalendar mc = new MyCalendar();
			mc.setMonth(now.getMonthValue()); // 이번 달
			mc.setToday(now.getDayOfMonth()); // 오늘
			mc.setLastDate(now.lengthOfMonth()); // 해당 월의 마지막 날짜 ex)28, 30, 31
			mc.setFirstDay(now.withDayOfMonth(1).getDayOfWeek().getValue()); // 해당 월의 시작 요일
			
			// 내가 속한 모임아이디 리스트 + 내가 생성한 모임아이디 리스트
			List<Integer> myMeetingIdList = new ArrayList<Integer>();
			myMeetingIdList.addAll(joinMeetingIdList);
			myMeetingIdList.addAll(meetingService.getMadeMeetingId(memberId));
			if(myMeetingIdList.size() != 0) {
				mc.setMyJoinIrregularList(irregularService.getMyJoinIrregularList(myMeetingIdList));
				mc.setMyJoinRegularList(regularService.getMyJoinRegularList(myMeetingIdList));
			}
			session.setAttribute("myCalendar", mc);
			
			mav.setViewName("redirect:/meeting/sort/all");
			return mav;
		}
		
		mav.addObject("url", "/");
		mav.setViewName("alert");
		return mav;
	}
}
