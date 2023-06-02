package com.somplace.controller.regular;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Regular;
import com.somplace.domain.command.RegularCommand;
import com.somplace.service.MeetingService;
import com.somplace.service.RegularService;

@Controller
@RequestMapping("/meeting/regular/update")
public class UpdateRegularController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private RegularService regularService;
	
	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}
	public void setRegularService(RegularService regularService) {
		this.regularService = regularService;
	}
	
	// 수정하기 버튼 클릭 -> 일시적 모임 수정페이지로 이동 (GET)
	@GetMapping("/form")
	public ModelAndView form(@RequestParam("checkedById") int checkedById,
			@RequestParam("detailValue") String detailValue) {
		ModelAndView mav = new ModelAndView("/meeting/regular/regularUpdate");
		
		Regular regular = regularService.getRegularById(checkedById);
		mav.addObject("regular", regular);
		
		// meetingInfoDetail
		StringTokenizer detailItr = new StringTokenizer(regular.getMeetingInfoDetail(), ",");
		List<String>detailList = new ArrayList<String>();
		while (detailItr.hasMoreElements()) {
			detailList.add(detailItr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);
		
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
		
		mav.addObject("detailValue", detailValue);
		
		return mav;
	}
	
	// 정기적 모임 수정 (POST)
	@PostMapping
	public ModelAndView updateRegular(@RequestParam("checkedById") int checkedById,
			@ModelAttribute("meetingCommand") RegularCommand meetingCommand,
			BindingResult result) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/regular/info");
		
		if (result.hasErrors()) {
			mav = new ModelAndView("meeting/regular/regularUpdate");
		} else {
			Regular regular = regularService.getRegularById(checkedById);
			mav.addObject("regular", regular);
			
			meetingCommand.setMeetingId(checkedById);
			mav.addObject("checkedById", checkedById);
			
			meetingService.updateMeeting(meetingCommand);
			regularService.updateRegular(meetingCommand);
		}
		return mav;
	}
}
