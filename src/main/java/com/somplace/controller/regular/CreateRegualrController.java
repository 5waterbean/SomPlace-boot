package com.somplace.controller.regular;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.command.RegularCommand;
import com.somplace.service.MeetingService;
import com.somplace.service.RegularService;

@Controller
@RequestMapping("/meeting/regular/create")
public class CreateRegualrController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private RegularService regularService;
	
	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}
	
	public void setRegularService (RegularService regularService) {
		this.regularService = regularService;
	}
	
	// 일시적 모임 생성 폼 -> 정기적 모임 생성 폼 이동 (GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/regular/regularCreate";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	@PostMapping
	public ModelAndView createRegular(@Valid @ModelAttribute RegularCommand regularCommand, 
			BindingResult result) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/sort/all");
		
		if (result.hasErrors()) {
			mav = new ModelAndView("meeting/regular/regularCreate");
		} else {
			// Meeting 생성
			meetingService.createMeeting(regularCommand);
			
			// meetingId 연결
			int meetingId = meetingService.getMeetingId(regularCommand);
			regularCommand.setMeetingId(meetingId);
			
			// regularMeeting 생성
			regularService.createRegular(regularCommand);			
		}					
		
		return mav;
	}
}
