package com.somplace.controller.regular;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.somplace.domain.Regular;
import com.somplace.domain.command.MeetingCommand;
import com.somplace.service.RegularService;

@Controller
public class CreateRegualrController {
	private RegularService regularService;
	
	@Autowired
	public void setRegularService (RegularService regularService) {
		this.regularService = regularService;
	}
	
	// 일시적 모임 생성 폼 -> 정기적 모임 생성 폼 이동 (GET)
	@GetMapping("/meeting/regular/create")
	public String form() {
		return "/meeting/regular/regularInfo.jsp";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	@PostMapping("/meeting/regular/create")
	public String test(MeetingCommand meetingCommand) throws Exception {
		Regular regular = new Regular();
		
		regularService.createRegular(regular);
		return "/meeting/test";
	}
}
