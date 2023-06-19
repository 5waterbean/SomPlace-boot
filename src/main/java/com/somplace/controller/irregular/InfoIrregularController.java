package com.somplace.controller.irregular;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Member;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;
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
	@Autowired
	private MeetingService meetingService;
	
	// 식사 리스트
	private List<String> mealList = Arrays.asList("한식", "일식", "양식", "중식", "술", "분식");
	// 스터디 리스트
	private List<String> studyList = Arrays.asList("과제", "학교시험", "취업준비", "자격증");
	// 취미 리스트
	private List<String> hobbyList = Arrays.asList("스포츠", "예술", "IT");
	
	@GetMapping
	public ModelAndView infoIrregular(@RequestParam("checkedById") int checkedById,
										@RequestParam(value="apply", defaultValue="-1") int apply,
										@RequestParam(value="heart", defaultValue="-1") int heart,
										@RequestParam(value="close", defaultValue="-1") int close,
										@ModelAttribute("memberSession") Member memberSession) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		// 모집 관련
		if (close == 1) {// 모집 마감하기
			meetingService.closeAndCloseCancelMeeting(checkedById, 1);
		}
		else if (close == 0) {// 다시 모집하기
			meetingService.closeAndCloseCancelMeeting(checkedById, 0);
		}
		
		// 일시적모임 조회
		Irregular irregular = irregularService.getIrregularById(checkedById);
		
		// 회원수 == 최대인원 일때 자동 마감
		if (irregular.getNumOfPeople() == irregular.getMaxPeople()) {
			meetingService.closeAndCloseCancelMeeting(checkedById, 1);
		}
		else if (irregular.getNumOfPeople() < irregular.getMaxPeople() && close != 1){
			meetingService.closeAndCloseCancelMeeting(checkedById, 0);
		}
		irregular = irregularService.getIrregularById(checkedById);
		mav.addObject("irregular", irregular);
			
		// 모임생성자
		Member member = memberService.getMember(irregular.getCreatorId());
		mav.addObject("creatorMember", member);

		// meetingDate
		StringTokenizer itr;
		itr = new StringTokenizer(irregular.getMeetingDate().toString(), " ");
		String meetingDay = itr.nextToken();
		mav.addObject("meetingDay", meetingDay);
		String meetingTime = itr.nextToken();
		itr = new StringTokenizer(meetingTime, ":");
		meetingTime = itr.nextToken() + ":" + itr.nextToken();
		mav.addObject("meetingTime", meetingTime);
		
		// meetingInfoDetail
		itr = new StringTokenizer(irregular.getMeetingInfoDetail(), ",");
		List<String> detailList = new ArrayList<String>();
		while (itr.hasMoreTokens()) {
			detailList.add(itr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);
		
		// etcDetail
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
		
		// 회원 목록 조회
		List<String> joinMemberIdList = memberMeetingService.findJoinMemberIdList(checkedById);
		mav.addObject("joinMemberIdList", joinMemberIdList);
		List<Member> joinMemberList = new ArrayList<Member>();
		for (String joinMemberId : joinMemberIdList) {
			joinMemberList.add(memberService.getMember(joinMemberId));
		}
		mav.addObject("joinMemberList", joinMemberList);
		
		// 신청자 목록 조회
		List<String> applyMemberIdList = memberMeetingService.findApplyMemberIdList(checkedById);
		mav.addObject("applyMemberIdList", applyMemberIdList);
		List<Member> applyMemberList = new ArrayList<Member>();
		for (String applyMemberId : applyMemberIdList) {
			applyMemberList.add(memberService.getMember(applyMemberId));
		}
		mav.addObject("applyMemberList", applyMemberList);
		
		// apply값 넘기기
		mav.addObject("apply", apply);
		// heart값 넘기기
		mav.addObject("heart", heart);
		
		return mav;
	}
}
