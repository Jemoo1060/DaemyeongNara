package com.spring.dm.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.IMbrJoinService;

@Controller
public class MbrJoinCtrl {
	
	@Autowired
	private IMbrJoinService mbrJoinService;
	
	private String viewName;
	
	private static final Logger logger = LoggerFactory.getLogger(MbrJoinCtrl.class);
	
	@RequestMapping("mbrJoinOk")
	public String mbrJoinOk(MemberDto memberDto, Model model) throws Exception {
		logger.info("mbrJoinOk called ========");
		viewName = mbrJoinService.mbrJoinSv(memberDto, model);
		return viewName;
	}
	
	@RequestMapping(value = "checkId", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck(@ModelAttribute("id") String id, Model model) throws Exception {
		logger.info("idCheck called ========");
		viewName = mbrJoinService.idDuplCheckSv(id, model);		
		return viewName;
	}
}
