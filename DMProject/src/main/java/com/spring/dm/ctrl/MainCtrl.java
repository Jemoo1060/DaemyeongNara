package com.spring.dm.ctrl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.iservice.IMainService;


@Controller
public class MainCtrl {
	
	@Autowired
	IMainService mainService;
	
	
	@RequestMapping("main")
	public String mainhome(String prdNameErr, Model model) throws Exception {
		return mainService.mainPageSv(prdNameErr, model);
	}
	

}





































