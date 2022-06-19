package com.spring.dm.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.ProductDto;
import com.spring.dm.iservice.ICategoryService;
import com.spring.dm.iservice.IPrdSearchService;

@Controller
public class CategoryCtrl {
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IPrdSearchService prdSearchService;
	
	private String viewName;
	
	@RequestMapping("prdList")
	public String pclOutput(String mbrCode, String pageNo, String cutPageNo, String pclCode,String ERR, Model model) throws Exception{
		
		viewName = categoryService.pclOutputSv(mbrCode, pageNo, cutPageNo, pclCode,ERR, model);
		
		return viewName;
	}
	
	@RequestMapping("prdSearch")
	public String prdSearch(String mbrCode, String pageNo, String cutPageNo, String prdName, Model model) throws Exception{
		
		viewName = prdSearchService.prdSearchSv(mbrCode, pageNo, cutPageNo, prdName, model);
		
		return viewName;
	}
	

	@RequestMapping("prdRecommand")
	public String prdRecommand(ProductDto productDto, Model model) throws Exception{
		
		viewName = categoryService.prdRecommandSv(productDto, model);
		
		return viewName;
	}
}
