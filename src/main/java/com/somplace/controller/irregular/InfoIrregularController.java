package com.somplace.controller.irregular;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Member;
import com.somplace.service.IrregularService;

@Controller
@RequestMapping("/meeting/irregular/info")
@SessionAttributes("memberSession")
public class InfoIrregularController {
	@Autowired
	private IrregularService irregularService;
	
	public void setIrregularService(IrregularService irregularService) {
		this.irregularService = irregularService;
	}
	
	@GetMapping
	public ModelAndView infoIrregular(@RequestParam("checkedById") int checkedById) {
		ModelAndView mav = new ModelAndView("meeting/irregular/irregularInfo");
		Irregular irregular = irregularService.getIrregularById(checkedById);
		mav.addObject("irregular", irregular);
		StringTokenizer itr = new StringTokenizer(irregular.getMeetingInfoDetail(), ",");
		List<String> detailList = new ArrayList<String>();
		while (itr.hasMoreTokens()) {
			detailList.add(itr.nextToken().trim());
		}
		mav.addObject("detailList", detailList);
		System.out.println(irregular.getMeetingInfo());
		return mav;
	}
}
