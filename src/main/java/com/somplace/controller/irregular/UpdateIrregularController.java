package com.somplace.controller.irregular;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.command.IrregularCommand;
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
	public ModelAndView form(@RequestParam("checkedById") int checkedById,
								@RequestParam("detailValue") String detailValue) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularUpdate");
		Irregular irregular = irregularService.getIrregularById(checkedById);
		mav.addObject("irregular", irregular);
		
		StringTokenizer itr;
		itr = new StringTokenizer(irregular.getMeetingDate().toString(), " ");
		String meetingDay = itr.nextToken().trim();
		mav.addObject("meetingDay", meetingDay);
		
		String meetingTime = itr.nextToken().trim();
		itr = new StringTokenizer(meetingTime, ":");
		meetingTime = itr.nextToken() + ":" + itr.nextToken();
		mav.addObject("meetingTime", meetingTime);
		
		itr = new StringTokenizer(irregular.getMeetingInfoDetail(), ",");
		List<String> detailList = new ArrayList<String>();
		while (itr.hasMoreTokens()) {
			detailList.add(itr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);
		
		mav.addObject("detailValue", detailValue);
		
		return mav;
	}
	
	// 일시적 모임 수정 (POST)
	@PostMapping()
	public ModelAndView updateIrregular(@ModelAttribute("meetingCommand") IrregularCommand meetingCommand,
											@RequestParam("checkedById") int checkedById) {
		ModelAndView mav = new ModelAndView("redirect:/meeting/irregular/info");

		String meetingDate = meetingCommand.getIrregularMeetingDate();
		StringTokenizer itr = new StringTokenizer(meetingDate, "-");
		meetingDate = itr.nextToken().trim() + "/" + itr.nextToken().trim() + "/" + itr.nextToken().trim();
		String meetingTime = meetingCommand.getIrregularMeetingTime();
		String meetingDay = meetingDate + " " + meetingTime;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(meetingDay, formatter);
		Timestamp ts = Timestamp.valueOf(localDateTime);
		meetingCommand.setIrregularMeetingDay(ts);
		
		meetingCommand.setMeetingId(checkedById);
		mav.addObject("checkedById", checkedById);
		
		meetingService.updateMeeting(meetingCommand);
		irregularService.updateIrregular(meetingCommand);
		return mav;
	}
}



