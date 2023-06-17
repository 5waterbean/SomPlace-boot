package com.somplace.controller.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.service.MeetingService;

@Controller

public class DeleteMeetingController {

	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping("/meeting/delete")
	public ModelAndView deleteMeeting(@RequestParam("meetingId") int meetingId) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/info");
		mav.addObject("checkedById", meetingId);
		meetingService.deleteMeeting(meetingId);
		return mav;
	}
}
