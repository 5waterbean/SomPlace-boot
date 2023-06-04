package com.somplace.controller.regular;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Regular;
import com.somplace.service.RegularService;

@Controller
@RequestMapping("/meeting/regular/info")
public class InfoRegularController {
	@Autowired
	private RegularService regularService;
	
	private List<String> mealList = Arrays.asList("한식", "일식", "중식", "양식", "분식", "술");
	private List<String> studyList = Arrays.asList("과제", "학교시험", "취업준비", "자격증");
	private List<String> hobbyList = Arrays.asList("스포츠", "예술", "IT");
	
	
	public void setIrregularService(RegularService regularService) {
		this.regularService = regularService;
	}
	
	@GetMapping
	public ModelAndView infoRegular(@RequestParam("checkedById") int checkedById) {
		ModelAndView mav = new ModelAndView("meeting/regular/regularInfo");
		
		Regular regular = regularService.getRegularById(checkedById);
		mav.addObject("regular", regular);
		
		// meetingInfoDetail
		StringTokenizer detailItr = new StringTokenizer(regular.getMeetingInfoDetail(), ",");
		List<String>detailList = new ArrayList<String>();
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
		List<String>meetingdayList = new ArrayList<String>();
		while (dayItr.hasMoreElements()) {
			meetingdayList.add(dayItr.nextToken().trim());
		}
		mav.addObject("meetingdayList", meetingdayList);
		
		// regularTime
		StringTokenizer timeItr = new StringTokenizer(regular.getMeetingTime(), ",");
		List<String>meetingTimeList = new ArrayList<String>();
		while (timeItr.hasMoreElements()) {
			meetingTimeList.add(timeItr.nextToken().trim());
		}
		mav.addObject("meetingTimeList", meetingTimeList);
		
		return mav;
	}
}