package com.somplace.controller.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.somplace.domain.Member;
import com.somplace.service.MemberMeetingService;

@Controller
@RequestMapping("/meeting/like")
@SessionAttributes("memberSession")
public class LikeMeetingController {
	@Autowired
	private MemberMeetingService memberMeetingService;
	
	@PostMapping
	@ResponseBody
	public int heartMeeting(@RequestParam("checkedById") int checkedById,
		@ModelAttribute("memberSession") Member memberSession) {
		String memberId =  memberSession.getMemberId();
		int apply;
		int heart;
		
		if (memberSession.getApplyMeetingIdList().contains(checkedById) == false) {// 신청x
			if (memberMeetingService.findApplyMemberIdList(checkedById).contains(memberSession.getMemberId())) {// 회원일때
				apply = 0;
				if (memberSession.getLikeMeetingIdList().contains(checkedById) == false) {// 찜하기x
					heart = 0;
				}
				else {//찜하기o
					heart = 1;
				}
			}
			else {// 비회원일때
				if (memberSession.getLikeMeetingIdList().contains(checkedById) == false) {// 찜하기x
					apply = -1;
					heart = -1;
				}
				else {//찜하기o
					apply = -1;
					heart = memberMeetingService.getHeart(memberId, checkedById);
				}
			}
		}
		else {// 신청o
			apply = 1;
			heart = memberMeetingService.getHeart(memberId, checkedById);
		}
		
		
		if (apply == -1 && heart == -1) {// 모임 찜하기 (insert)
			memberSession.getLikeMeetingIdList().add(checkedById); // 찜한리스트에 추가
			return memberMeetingService.insertMemberMeeting(1, memberId, checkedById);
		}
		else if (apply == 1 && heart == 0) {// 모임 찜하기 (update)
			memberSession.getLikeMeetingIdList().add(checkedById); // 찜한리스트에 추가
			return memberMeetingService.updateMemberMeeting(apply, 0, memberId, checkedById, 1);
		}
		else if (apply != -1 && heart == 1){// 모임 찜하기 취소 (update)
			memberSession.getLikeMeetingIdList().remove(memberSession.getLikeMeetingIdList().indexOf(checkedById)); // 찜한리스트에서 삭제
			memberMeetingService.updateMemberMeeting(apply, 1, memberId, checkedById, 1);
			return -1;
		}
		else if (apply == -1 && heart == 1){// 모임 찜하기 취소 (delete)
			memberSession.getLikeMeetingIdList().remove(memberSession.getLikeMeetingIdList().indexOf(checkedById)); // 찜한리스트에서 삭제
			memberMeetingService.deleteMemberMeeting(memberId, checkedById);
			return -1;
		}

		return 0;
	}
	
}	
