package com.somplace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somplace.domain.Meeting;
import com.somplace.service.MeetingService;

@Controller
public class MeetingController {

	private MeetingService meetingService;

	@Autowired
	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/meeting/list")
	public String handleRequest(ModelMap model) throws Exception {
		List<Meeting> meetingList = meetingService.getMeetingList();
		model.put("meetingList", meetingList);
		return "meetingList";
	}
}
