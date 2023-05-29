package com.somplace.controller.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Meeting;
import com.somplace.domain.Member;
import com.somplace.service.MeetingService;

@Controller
public class SortMeetingController {
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping("/meeting/sort/all")
	public ModelAndView sortAll(@RequestParam(value="sortWith", defaultValue="order") String sortWith) {
		List<Meeting> sortAllList = meetingService.sortAll(sortWith);
		
		ModelAndView mav = new ModelAndView("meeting/list");
		mav.addObject("sortList", sortAllList);
		
		if (sortWith.equals("order")) {
			mav.addObject("checkedOrder", true);
		}
		else {
			mav.addObject("checkedHeart", true);
		}
		
		return mav;
	}
}
