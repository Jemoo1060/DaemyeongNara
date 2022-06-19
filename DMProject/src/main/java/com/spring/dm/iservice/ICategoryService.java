package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.ProductDto;


public interface ICategoryService {
	
	String pclOutputSv(String mbrCode, String pageNo, String cutPageNo, String pclCode,String ERR, Model model) throws Exception;
	
	String prdRecommandSv(ProductDto productDto, Model model) throws Exception;
	
}
