package com.somplace.controller.regular;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Regular;
import com.somplace.service.RegularService;

@Controller
@RequestMapping("/meeting/regular/info")
public class InfoRegularController {
	@Autowired
	private RegularService regularService;
	
	public void setIrregularService(RegularService regularService) {
		this.regularService = regularService;
	}
	
	@GetMapping
	public ModelAndView infoIrregular(@RequestParam("checkedById") int checkedById) {
		ModelAndView mav = new ModelAndView("meeting/regular/regularInfo");
		Regular regular = regularService.getRegularById(checkedById);
		mav.addObject("regular", regular);
		return mav;
	}
}
