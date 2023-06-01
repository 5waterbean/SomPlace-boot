package com.somplace.controller.irregular;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.command.MeetingCommand;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;

@Controller
@RequestMapping("/meeting/irregular/update")
public class UpdateIrregularController {
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
	
	// 수정하기 버튼 클릭 -> 일시적 모임 수정페이지로 이동 (GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularUpdate";
	}
	
	// 일시적 모임 수정 (POST)
	@PostMapping()
	public ModelAndView updateIrregular(@ModelAttribute("meetingCommand") MeetingCommand meetingCommand) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/sort/all");

		String meetingDate = meetingCommand.getIrregularMeetingDate();
		StringTokenizer itr = new StringTokenizer(meetingDate, "-");
		meetingDate = itr.nextToken().trim() + "/" + itr.nextToken().trim() + "/" + itr.nextToken().trim();
		String meetingTime = meetingCommand.getIrregularMeetingTime();
		String meetingDay = meetingDate + " " + meetingTime;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(meetingDay, formatter);
		Timestamp ts = Timestamp.valueOf(localDateTime);
		meetingCommand.setIrregularMeetingDay(ts);
		
		meetingService.updateMeeting(meetingCommand);
		irregularService.updateIrregular(meetingCommand);
		return mav;
	}
}



