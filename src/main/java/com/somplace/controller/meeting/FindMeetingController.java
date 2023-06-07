package com.somplace.controller.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.service.IrregularService;

@Controller
public class FindMeetingController {
	@Autowired
	private IrregularService irregularService;
	
	@RequestMapping("/meeting/info")
	public ModelAndView findMeeting(@RequestParam(value="checkedById") int checkedById,
			@RequestParam(value="heart") int heart) {
		ModelAndView mav;
		
		Irregular irregular = irregularService.getIrregularById(checkedById);
		if (irregular == null) {
			mav = new ModelAndView("redirect:/meeting/regular/info");
		} else {
			mav = new ModelAndView("redirect:/meeting/irregular/info");
		}
		mav.addObject("checkedById", checkedById);
		System.out.println("info:"+ heart);
		mav.addObject("heart", heart);
		
		return mav;
	}
}
