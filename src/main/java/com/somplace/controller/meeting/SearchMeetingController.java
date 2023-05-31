package com.somplace.controller.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.Irregular;
import com.somplace.domain.Meeting;
import com.somplace.service.IrregularService;
import com.somplace.service.MeetingService;

@Controller
public class SearchMeetingController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private IrregularService irregularService;
	
	@RequestMapping("/meeting/search")
	public ModelAndView sortAll(@RequestParam(value="sortWith", defaultValue="order") String sortWith,
			@RequestParam(value="category", defaultValue="all") String category,
			@RequestParam(value="key") String key,
			@RequestParam(value="meetingType", defaultValue="all") String meetingType) {
				
		ModelAndView mav = new ModelAndView("meeting/list");
				
		mav.addObject("checkedCategory", category);
		mav.addObject("meetingType", meetingType);
		
		if (meetingType.equals("all")) { //전체 눌렀을때
			mav.addObject("checkedAll", true);
			if (category.equals("all")) {
				List<Meeting> searchAllList = meetingService.searchAllByKey(key);
				mav.addObject("meetingList", searchAllList);
			} 
			else {
				List<Meeting> searchCategoryList = meetingService.searchCategoryByKey(key, category);
				mav.addObject("meetingList", searchCategoryList);
			}
		}
		else if (meetingType.equals("irregular")) { //일시적 눌렀을때
			mav.addObject("checkedIrregular", true);
			if (category.equals("all")) {
				List<Irregular> searchIrregularByKeyOrderList = irregularService.searchIrregularByKeyOrder(key);
				mav.addObject("meetingList", searchIrregularByKeyOrderList);
			} 
			else {
				List<Irregular> searchIrregularCategoryByKeyOrderList = irregularService.searchIrregularCategoryByKeyOrder(key, category);
				mav.addObject("meetingList", searchIrregularCategoryByKeyOrderList);
			}
		}
		else { //정기적 눌렀을때
			mav.addObject("checkedReuglar", true);
		}
		
		
		if (sortWith.equals("order")) { // 최신순 정렬 표시
			mav.addObject("checkedOrder", true);
		}
		else { // 인기순 정렬 표시
			mav.addObject("checkedHeart", true);
		}

		mav.addObject("checkedKey", key);
		
		return mav;
	}
}
