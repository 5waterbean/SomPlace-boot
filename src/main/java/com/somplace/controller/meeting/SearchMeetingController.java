package com.somplace.controller.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Meeting;
import com.somplace.service.MeetingService;

@Controller
public class SearchMeetingController {
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping("/meeting/search")
	public ModelAndView sortAll(@RequestParam(value="sortWith", defaultValue="order") String sortWith,
			@RequestParam(value="category", defaultValue="all") String category,
			@RequestParam(value="key") String key) {
				
		ModelAndView mav = new ModelAndView("meeting/list");
				
		mav.addObject("checkedCategory", category);
		
		if (category.equals("all")) {
			List<Meeting> searchAllList = meetingService.searchAllByKey(key);
			mav.addObject("meetingList", searchAllList);
		} 
		
		else {
			List<Meeting> searchCategoryList = meetingService.searchCategoryByKey(key, category);
			mav.addObject("meetingList", searchCategoryList);
		}
		
		if (sortWith.equals("order")) { // 최신순 정렬
			mav.addObject("checkedOrder", true);
		}
		else { // 인기순 정렬
			mav.addObject("checkedHeart", true);
		}
		mav.addObject("key", key);
		
		return mav;
	}
}
