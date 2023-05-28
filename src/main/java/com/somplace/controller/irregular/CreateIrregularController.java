package com.somplace.controller.irregular;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
//import java.util.Date;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.command.MeetingCommand;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;

@Controller
@RequestMapping("/meeting/irregular/create")
public class CreateIrregularController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private IrregularService irregularService;
	
	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	// 모임 만들기 클릭 -> 일시적 모임 생성 폼 이동 (GET)
	
//	@RequestMapping(method = RequestMethod.GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularCreate";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	
//	@RequestMapping(method = RequestMethod.POST)
	@PostMapping("")
	public ModelAndView createIrregular(@ModelAttribute("meetingCommand") MeetingCommand meetingCommand,
									BindResult bindingResult) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		String meetingDate = meetingCommand.getIrregularMeetingDate();
		StringTokenizer itr = new StringTokenizer(meetingDate, "-");
		meetingDate = itr.nextToken().trim() + "/" + itr.nextToken().trim() + "/" + itr.nextToken().trim();
		String meetingTime = meetingCommand.getIrregularMeetingTime().toString();
		
		String meetingDay = meetingDate + " " + meetingTime;
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm", Locale.US);
//		LocalDate date = LocalDate.parse(meetingDate, formatter);
//		meetingCommand.setIrregularMeetingDay(meetingDay);
//		meetingService = new MeetingService();
		meetingService.createMeeting(meetingCommand);
//		irregularService = new IrregularService();
		irregularService.createIrregular(meetingCommand);
		
		return mav;
	}
}
