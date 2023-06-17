package com.somplace.controller.irregular;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.StringTokenizer;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.command.IrregularCommand;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;

@Controller
@RequestMapping("/meeting/irregular/create")
public class CreateIrregularController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private IrregularService irregularService;
	
	// 모임 만들기 클릭 -> 일시적 모임 생성 폼 이동 (GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularCreate";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	@PostMapping
	public ModelAndView createIrregular(@Valid @ModelAttribute("meetingCommand") IrregularCommand meetingCommand,
									  BindingResult result) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/sort/all");
		
		if (result.hasErrors()) { //오류시
			mav = new ModelAndView("meeting/irregular/irregularCreate");
		} else {
			// meetingDate 형식 변환
			String meetingDate = meetingCommand.getIrregularMeetingDate();
			StringTokenizer itr = new StringTokenizer(meetingDate, "-");
			meetingDate = itr.nextToken().trim() + "/" + itr.nextToken().trim() + "/" + itr.nextToken().trim();
			String meetingTime = meetingCommand.getIrregularMeetingTime();
			String meetingDay = meetingDate + " " + meetingTime;
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
			LocalDateTime localDateTime = LocalDateTime.parse(meetingDay, formatter);
			Timestamp ts = Timestamp.valueOf(localDateTime);
			meetingCommand.setIrregularMeetingDay(ts);
	
			meetingService.createMeeting(meetingCommand);
			int meetingId = meetingService.getMeetingId(meetingCommand);
			meetingCommand.setMeetingId(meetingId);
			irregularService.createIrregular(meetingCommand);
		}
		
		return mav;
	}
}