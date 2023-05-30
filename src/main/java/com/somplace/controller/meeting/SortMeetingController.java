package com.somplace.controller.meeting;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public ModelAndView sortAll(@RequestParam(value="sortWith", defaultValue="order") String sortWith,
			@RequestParam(value="category", defaultValue="all") String category) {
				
		List<Meeting> sortAllList = meetingService.sortAll(sortWith);
		List<Meeting> sortCategoryList = meetingService.sortCategory(category, sortWith);
		
		ModelAndView mav = new ModelAndView("meeting/list");
				
		mav.addObject("checkedCategory", category);
		
		if (category.equals("all")) {
			mav.addObject("meetingList", sortAllList);
		} else {
			mav.addObject("meetingList", sortCategoryList);
		}
		
		if (sortWith.equals("order")) { // 최신순 정렬
			mav.addObject("checkedOrder", true);
		}
		else { // 인기순 정렬
			mav.addObject("checkedHeart", true);
		}
		
		return mav;
	}
}
