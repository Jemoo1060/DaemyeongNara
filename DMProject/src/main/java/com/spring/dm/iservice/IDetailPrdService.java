package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.CartDto;

public interface IDetailPrdService {
	
	String detailPrdInfoSv(String prdCode, Model model) throws Exception;
	
	String cartAddSv(String pclCode, CartDto cartDto, Model model) throws Exception;
	
}
