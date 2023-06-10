package com.somplace.controller.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.service.MemberMeetingService;

@Controller
@RequestMapping("/meeting/join")
@SessionAttributes("memberSession")
public class JoinMeetingController {
	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@GetMapping
	public ModelAndView joinMeeting(@RequestParam("checkedById") int checkedById,
										@RequestParam(value="checkedApply", defaultValue="-1") int checkedApply,
										@RequestParam(value="apply", defaultValue="-1") int apply,
										@RequestParam(value="heart", defaultValue="-1") int heart,
										@RequestParam(value="applyMemberId", defaultValue="null") String applyMemberId,
										@RequestParam(value="inOrOut", defaultValue="-1") int inOrOut,
										@ModelAttribute("memberSession") Member memberSession) {
		String memberId = memberSession.getMemberId();
		ModelAndView mav = new ModelAndView("redirect:/meeting/info");
		mav.addObject("checkedById", checkedById);
		
		// 모임 신청 (찜하기 안했을 경우)
		if (checkedApply == 1) {
			if (apply != -1) { // 신청이 되어있는 상태면 apply값 가져오기 (jsp에서 1로 하면 안됨, update할 때 필요)
				apply = memberMeetingService.getApply(memberId, checkedById);
			}
			mav.addObject("apply", apply);
			
			if (heart == 0 && apply == -1) {
				heart = -1;
			}
			
			if (heart == -1) { // insert
				memberMeetingService.insertMemberMeeting(0, memberId, checkedById);
			} else { // update
				// heart값 조회
				heart = memberMeetingService.getHeart(memberId, checkedById);
				mav.addObject("heart", heart);
				
				memberMeetingService.updateMemberMeeting(apply, heart, memberId, checkedById, 0);
			}
			memberSession.getApplyMeetingIdList().add(checkedById); // 신청리스트에 추가
		}
		
		// 모임 신청 취소 
		if (checkedApply == 0) {
			if (heart == 0 || heart == -1) { // 찜하기 x
				memberMeetingService.deleteMemberMeeting(memberId, checkedById);
			}
			else if (heart == 1) { // 찜하기 o
				memberMeetingService.updateMemberMeeting(1, heart, memberId, checkedById , 0);
			}
			memberSession.getApplyMeetingIdList().remove(memberSession.getApplyMeetingIdList().indexOf(checkedById)); // 신청리스트에서 삭제
		}
		
		// 신청수락
		if (inOrOut == 1) {
			memberMeetingService.updateMemberMeeting(1, heart, applyMemberId, checkedById , -1);
		}
		else if (inOrOut == 0) {
			memberMeetingService.deleteMemberMeeting(applyMemberId, checkedById);
		}
		mav.addObject("heart", heart);
		mav.addObject("apply", apply);
		return mav;
	}
}
