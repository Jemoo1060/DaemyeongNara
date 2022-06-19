package com.spring.dm.ctrl;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.ILoginService;

@Controller
public class LoginCtrl {
	
	@Autowired
	private ILoginService loginService;
	
	private String viewName;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCtrl.class);

	@RequestMapping("goLogin")
	public String goLogin() throws Exception {
		logger.info("goLogin called ========");
		viewName = "login";		
		return viewName;
	}
	
	@RequestMapping("loginCheck")
	public String loginCheck(MemberDto memberDto, Model model, HttpSession session) throws Exception {
		logger.info("loginCheck called ========");
		viewName = loginService.loginCheckSv(memberDto, model, session);
		session.setAttribute("memberDto", memberDto);
		return viewName;
	}
	
	@RequestMapping("goJoin")
	public String goJoin() throws Exception {
		logger.info("goJoin called ========");
		viewName = "join";
		return viewName;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		logger.info("logout called ========");
		session.invalidate();
		viewName = "redirect:/main";
		return viewName;
	}
}
