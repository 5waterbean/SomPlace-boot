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
public class SortMeetingController {
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private IrregularService irregularService;
	
	@RequestMapping("/meeting/sort/all")
	public ModelAndView sortAll(@RequestParam(value="sortWith", defaultValue="order") String sortWith,
			@RequestParam(value="category", defaultValue="all") String category,
			@RequestParam(value="key", defaultValue="") String key, 
			@RequestParam(value="meetingType", defaultValue="all") String meetingType) {
		ModelAndView mav = new ModelAndView("meeting/list");
				
		mav.addObject("checkedCategory", category);
		mav.addObject("checkedKey", key);
		mav.addObject("meetingType", meetingType);
		
		if (meetingType.equals("all")) { //전체 눌렀을때
			mav.addObject("checkedAll", true);
			if (key.equals("")) { //key가 없을때(검색어가 없을때)
				if (category.equals("all")) {
					List<Meeting> sortAllList = meetingService.sortAll(sortWith);
					mav.addObject("meetingList", sortAllList);
				} else {
					List<Meeting> sortCategoryList = meetingService.sortCategory(category, sortWith);
					mav.addObject("meetingList", sortCategoryList);
				}
			}
			else { //key가 있을때(검색 했을때)
				if (category.equals("all")) { 
					if (sortWith.equals("order")) {//전체(키워드) 검색, 최신순
						List<Meeting> searchAllList = meetingService.searchAllByKey(key);
						mav.addObject("meetingList", searchAllList);
					}
					else {//전체(키워드) 검색, 인기순
						List<Meeting> sortAllByKeyHeartList = meetingService.sortAllByKeyHeart(key);
						mav.addObject("meetingList", sortAllByKeyHeartList);
					}
					
				}
				else { 
					if (sortWith.equals("order")) {//카테고리별(키워드) 검색, 최신순
						List<Meeting> searchCategoryList = meetingService.searchCategoryByKey(key, category);
						mav.addObject("meetingList", searchCategoryList);
					}
					else {//카테고리별(키워드) 검색, 인기순
						List<Meeting> sortCategoryByKeyHeartList = meetingService.sortCategoryByKeyHeart(key, category);
						mav.addObject("meetingList", sortCategoryByKeyHeartList);
					}
				}
			}
		}
		else if (meetingType.equals("irregular")) { //일시적 눌렀을때
			mav.addObject("checkedIrregular", true);
			if (key.equals("")) { //key가 없을때(검색어가 없을때)
				if (category.equals("all")) {
					List<Irregular> sortIrregularList = irregularService.sortIrregular(sortWith); //일시적모임 정렬
					mav.addObject("meetingList", sortIrregularList);
				} else {
					List<Irregular> sortIrregularCategoryList = irregularService.sortIrregularCategory(category, sortWith); //일시적모임 카테고리별 정렬
					mav.addObject("meetingList", sortIrregularCategoryList);
				}
			}
			else { //key가 있을때(검색 했을때)
				if (category.equals("all")) { 
					if (sortWith.equals("order")) {//일시적모임(키워드) 검색, 최신순
						List<Irregular> sortIrregularByKeyOrderList = irregularService.searchIrregularByKeyOrder(key);
						mav.addObject("meetingList", sortIrregularByKeyOrderList);
					}
					else {//일시적모임(키워드) 검색, 인기순
						List<Irregular> searchIrregularByKeyHeartList = irregularService.sortIrregularByKeyHeart(key);
						mav.addObject("meetingList", searchIrregularByKeyHeartList);
					}
					
				}
				else { 
					if (sortWith.equals("order")) {//일시적모임 카테고리별(키워드) 검색, 최신순
						List<Irregular> sortIrregularCategoryByOrderList = irregularService.searchIrregularCategoryByKeyOrder(key, category);
						mav.addObject("meetingList", sortIrregularCategoryByOrderList);
					}
					else {//일시적모임 카테고리별(키워드) 검색, 인기순
						List<Irregular> searchIrregularCategoryByHeartList = irregularService.sortIrregularCategoryByKeyHeart(key, category);
						mav.addObject("meetingList", searchIrregularCategoryByHeartList);
					}
				}
			}
			
		}
		else { //정기적 눌렀을때
			mav.addObject("checkedRegular", true);
		}
		
		
		if (sortWith.equals("order")) { // 최신순 정렬 표시
			mav.addObject("checkedOrder", true);
		}
		else { // 인기순 정렬 표시
			mav.addObject("checkedHeart", true);
		}
		
		return mav;
	}
}
