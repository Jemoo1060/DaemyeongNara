package com.spring.dm.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.CartDto;
import com.spring.dm.iservice.IDetailPrdService;

@Controller
public class DetailPrdCtrl {
	
	@Autowired
	IDetailPrdService detailPrdService;
	
	
	@RequestMapping("detailPrd")
	public String detailPrdInfo (@ModelAttribute("prdCode")String prdCode , Model model) throws Exception {
		String viewName ="";
		
		viewName = detailPrdService.detailPrdInfoSv(prdCode, model);
		
		return viewName;
	}
	
	@RequestMapping("cartAdd")
	public String cartAdd (@ModelAttribute("prdCode") String prdCode,String pclCode, String mbrCode, CartDto cartDto, Model model) throws Exception {
		String viewName ="";
		
		viewName = detailPrdService.cartAddSv(pclCode, cartDto, model);
		
		return viewName;
	}
	
}
