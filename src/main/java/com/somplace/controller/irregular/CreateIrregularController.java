package com.somplace.controller.irregular;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.service.IrregularService;

@Controller
@RequestMapping("/meeting/irregular/create")
public class CreateIrregularController {
	private IrregularService irregularService;
	
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	// 모임 만들기 클릭 -> 일시적 모임 생성 폼 이동 (GET)
	@GetMapping("/form")
	public String form() {
		return "meeting/irregular/irregularCreate";
	}
	
	// 정기적 모임 생성 폼 제출 (POST)
	@PostMapping("/")
	public String create() {
		return "";
	}
}
