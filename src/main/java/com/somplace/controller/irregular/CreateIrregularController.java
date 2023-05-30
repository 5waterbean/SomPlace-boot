package com.somplace.controller.irregular;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Member;
import com.somplace.domain.command.MeetingCommand;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;

@Controller
@RequestMapping("/meeting/irregular/create")
@SessionAttributes("memberSession")
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
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularCreate";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	@PostMapping
	public ModelAndView createIrregular(@ModelAttribute("meetingCommand") MeetingCommand meetingCommand,
									BindResult bindingResult, @ModelAttribute("memberSession") Member member) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		meetingCommand.setCreatorId(member.getMemberId());
		
		String meetingDate = meetingCommand.getIrregularMeetingDate();
		StringTokenizer itr = new StringTokenizer(meetingDate, "-");
		meetingDate = itr.nextToken().trim() + "/" + itr.nextToken().trim() + "/" + itr.nextToken().trim();
		String meetingTime = meetingCommand.getIrregularMeetingTime();
		String meetingDay = meetingDate + " " + meetingTime;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(meetingDay, formatter);
		Timestamp ts = Timestamp.valueOf(localDateTime);
		Date date = Timestamp.valueOf(localDateTime);
		meetingCommand.setIrregularMeetingDay(ts);

		meetingService.createMeeting(meetingCommand);
		int meetingId = meetingService.getMeetingId(meetingCommand);
		meetingCommand.setMeetingId(meetingId);
		irregularService.createIrregular(meetingCommand);
		
		return mav;
	}
}