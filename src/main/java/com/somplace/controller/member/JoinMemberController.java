package com.somplace.controller.member;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.somplace.domain.command.MemberCommand;
import com.somplace.service.MemberService;

@Controller
@RequestMapping("/member/join")
public class JoinMemberController {
	
	public static String[] majorList = {"국어국문학전공", "국사학전공", "문예창작전공", "영어전공", "일어일본학전공", 
			"중어중국학전공", "유러피언스터디즈전공", "경영학전공", "국제경영학전공", "문헌정보학전공", 
			"식품영양학전공", "보건관리학전공", "응용화학전공", "화장품학전공", "컴퓨터학전공",
			"정보통계학전공", "체육학전공", "약학과", "회화전공", "디지털공예전공", "큐레이터학전공",
			"피아노전공", "관현악전공", "성악전공", "패션디자인전공", "시각&실내디자인전공", "미디어디자인전공",
			"방송연에전공", "실용음악전공", "무용전공", "모델전공", "커뮤니케이션콘텐츠전공", "문화예술경영전공",
			"글로벌MICE전공", "HCI사이언스전공", "패션마케팅연계전공", "글로벌다문화학연계전공", 
			"빅데이터연계전공", "공공문화예술연계전공", "평생교육연계전공", "공공인재연계전공"};

	@Autowired
	private MemberService memberService;	
	
	@GetMapping()
	public ModelAndView joinForm() {
		return new ModelAndView("member/join", "majorList", majorList);
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public int memberIdCheck(@RequestParam String memberId) {
		return memberService.memberIdCheck(memberId);
	}
	
	@PostMapping()
	public ModelAndView joinMember(@Valid @ModelAttribute MemberCommand memberCommand, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return new ModelAndView("member/join", "majorList", majorList);
		}
		
		int studentNumber = Integer.parseInt(memberCommand.getStudentNumber());
		memberCommand.setStudentNumberIntType(studentNumber);
		memberService.createMember(memberCommand);
		return new ModelAndView("redirect:/");
	}
}
