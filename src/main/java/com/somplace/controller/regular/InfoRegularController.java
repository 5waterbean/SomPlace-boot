package com.somplace.controller.regular;

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

import com.somplace.domain.Member;
import com.somplace.domain.Regular;
import com.somplace.domain.Review;
import com.somplace.service.MeetingService;
import com.somplace.service.MemberMeetingService;
import com.somplace.service.MemberService;
import com.somplace.service.RegularService;
import com.somplace.service.ReviewService;

@Controller
@RequestMapping("/meeting/regular/info")
@SessionAttributes("memberSession")
public class InfoRegularController {
	@Autowired
	private RegularService regularService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberMeetingService memberMeetingService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MeetingService meetingService;

	private List<String> mealList = Arrays.asList("한식", "일식", "중식", "양식", "분식", "술");
	private List<String> studyList = Arrays.asList("과제", "학교시험", "취업준비", "자격증");
	private List<String> hobbyList = Arrays.asList("스포츠", "예술", "IT");

	@GetMapping
	public ModelAndView infoRegular(@RequestParam("checkedById") int checkedById,
			@ModelAttribute("memberSession") Member memberSession,
			@RequestParam(value = "apply", defaultValue = "-1") int apply,
			@RequestParam(value = "heart", defaultValue = "-1") int heart,
			@RequestParam(value = "close", defaultValue = "-1") int close) {
		ModelAndView mav = new ModelAndView("meeting/regular/regularInfo");

		// 모집 관련
		if (close == 1) {// 모집 마감하기
			meetingService.closeAndCloseCancelMeeting(checkedById, 1);
		} else if (close == 0) {// 다시 모집하기
			meetingService.closeAndCloseCancelMeeting(checkedById, 0);
		}

		// 정기적모임 조회
		Regular regular = regularService.getRegularById(checkedById);
		mav.addObject("regular", regular);

		// 모임생성자
		Member member = memberService.getMember(regular.getCreatorId());
		mav.addObject("creatorMember", member);

		// meetingInfoDetail
		StringTokenizer detailItr = new StringTokenizer(regular.getMeetingInfoDetail(), ",");
		List<String> detailList = new ArrayList<String>();
		while (detailItr.hasMoreElements()) {
			detailList.add(detailItr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);

		// etcDetail
		if (regular.getMeetingInfo().equals("식사")) {
			if (!mealList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		} else if (regular.getMeetingInfo().equals("스터디")) {
			if (!studyList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		} else {
			if (!hobbyList.contains(detailList.get(detailList.size() - 1))) {
				mav.addObject("detailValue", detailList.get(detailList.size() - 1));
			}
		}

		// regularDay
		StringTokenizer dayItr = new StringTokenizer(regular.getMeetingDay(), ",");
		List<String> meetingdayList = new ArrayList<String>();
		while (dayItr.hasMoreElements()) {
			meetingdayList.add(dayItr.nextToken().trim());
		}
		mav.addObject("meetingdayList", meetingdayList);

		// regularTime
		StringTokenizer timeItr = new StringTokenizer(regular.getMeetingTime(), ",");
		List<String> meetingTimeList = new ArrayList<String>();
		while (timeItr.hasMoreElements()) {
			meetingTimeList.add(timeItr.nextToken().trim());
		}
		mav.addObject("meetingTimeList", meetingTimeList);

		// 회원 목록 조회
		List<String> joinMemberIdList = memberMeetingService.findJoinMemberIdList(checkedById);
		List<Member> joinMemberList = new ArrayList<Member>();
		for (String joinMemberId : joinMemberIdList) {
			joinMemberList.add(memberService.getMember(joinMemberId));
		}
		mav.addObject("joinMemberList", joinMemberList);
		mav.addObject("joinMemberIdList", joinMemberIdList);
		
		// 후기 작성 부분
		List<Review> reviewList = reviewService.getReviewById(checkedById);
		mav.addObject("reviewList", reviewList);
		
		List<String> reviewMemberIdList = new ArrayList<String>();		
		for (Review review : reviewList) {
			reviewMemberIdList.add(review.getId());
		}		
		mav.addObject("reviewMemberIdList", reviewMemberIdList);
		
		// 신청자 목록 조회
		List<String> applyMemberIdList = memberMeetingService.findApplyMemberIdList(checkedById);
		List<Member> applyMemberList = new ArrayList<Member>();
		for (String applyMemberId : applyMemberIdList) {
			applyMemberList.add(memberService.getMember(applyMemberId));
		}
		mav.addObject("applyMemberList", applyMemberList);
		mav.addObject("applyMemberIdList", applyMemberIdList);

		// apply 값 넘기기
		mav.addObject("apply", apply);
		// heart 값 넘기기
		mav.addObject("heart", heart);

		return mav;
	}
}