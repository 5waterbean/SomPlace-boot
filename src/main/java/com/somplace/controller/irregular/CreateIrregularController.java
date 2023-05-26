package com.somplace.controller.irregular;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somplace.service.IrregularService;

@Controller
@RequestMapping("/meeting/irregular")
public class CreateIrregularController {
	private IrregularService irregularService;
	
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	@GetMapping("/create/form")
	public String form() {
		return "meeting/irregular/irregularCreate";
	}
}
