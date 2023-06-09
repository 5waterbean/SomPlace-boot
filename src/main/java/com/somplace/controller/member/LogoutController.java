package com.somplace.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberSession");
		session.invalidate();
		return "redirect:/";
	}
}
