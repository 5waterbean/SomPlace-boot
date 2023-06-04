package com.somplace.controller.irregular;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Member;
import com.somplace.service.IrregularService;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;

@Controller
@RequestMapping("/meeting/irregular/info")
@SessionAttributes("memberSession")
public class InfoIrregularController {
	@Autowired
	private IrregularService irregularService;
	@Autowired
	private MemberMeetingService memberMeetingService;
	@Autowired
	private MemberService memberService;
	
	private List<String> mealList = Arrays.asList("한식", "일식", "양식", "중식", "술", "분식");
	private List<String> studyList = Arrays.asList("과제", "학교시험", "취업준비", "자격증");
	private List<String> hobbyList = Arrays.asList("스포츠", "예술", "IT");
	
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	@GetMapping
	public ModelAndView infoIrregular(@RequestParam("checkedById") int checkedById) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		Irregular irregular = irregularService.getIrregularById(checkedById);
		mav.addObject("irregular", irregular);
		
		StringTokenizer itr;
		itr = new StringTokenizer(irregular.getMeetingDate().toString(), " ");
		String meetingDay = itr.nextToken();
		mav.addObject("meetingDay", meetingDay);
		
		String meetingTime = itr.nextToken();
		itr = new StringTokenizer(meetingTime, ":");
		meetingTime = itr.nextToken() + ":" + itr.nextToken();
		mav.addObject("meetingTime", meetingTime);
		
		itr = new StringTokenizer(irregular.getMeetingInfoDetail(), ",");
		List<String> detailList = new ArrayList<String>();
		while (itr.hasMoreTokens()) {
			detailList.add(itr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);
		
		if (irregular.getMeetingInfo().equals("식사")) {
			if (!mealList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		}
		else if (irregular.getMeetingInfo().equals("스터디")) {
			if (!studyList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		}
		else {
			if (!hobbyList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		}
		
		List<String> joinMemberIdList = memberMeetingService.findJoinMemberIdList(checkedById);
		List<Member> joinMemberList = new ArrayList<Member>();
		for (String joinMemberId : joinMemberIdList) {
			joinMemberList.add(memberService.getMember(joinMemberId));
		}
		mav.addObject("joinMemberList", joinMemberList);
		
		List<String> applyMemberIdList = memberMeetingService.findApplyMemberIdList(checkedById);
		List<Member> applyMemberList = new ArrayList<Member>();
		for (String applyMemberId : applyMemberIdList) {
			applyMemberList.add(memberService.getMember(applyMemberId));
		}
		mav.addObject("applyMemberList", applyMemberList);
		
		return mav;
	}
}
