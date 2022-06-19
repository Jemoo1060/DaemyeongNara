package com.spring.dm.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.iservice.ISchoolZoneService;

@Controller
public class SchoolZoneCtrl {

	@Autowired
	ISchoolZoneService schoolZoneService;
	
	private String viewName;
	
	private static final Logger logger = LoggerFactory.getLogger(MbrJoinCtrl.class);
	
	@RequestMapping("goSchoolZone")
	public String goSchoolZone(Model model) throws Exception {
		logger.info("goSchoolZone called ========");
		viewName =  schoolZoneService.noticeOutputSv(model);
		return viewName;
	}
}
