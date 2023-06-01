package com.somplace.controller.irregular;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Member;
import com.somplace.service.IrregularService;

@Controller
@RequestMapping("/meeting/irregular/info")
@SessionAttributes("memberSession")
public class InfoIrregularController {
	private IrregularService irregularService;
	
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	// 모임 리스트에서 일시적 모임 클릭 -> 일시적 모임 상세정보페이지로 이동 (GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularInfo";
	}
	
	//
	@PostMapping
	public ModelAndView infoIrregular(@ModelAttribute("meetingId") int meetingId) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		Irregular irregular = irregularService.getIrregularById(meetingId);
		mav.addObject("irregular", irregular);
		return mav;
	}
}
