package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.CartDto;

public interface ICartService {
	
	String cartListSv(String mbrCode, Model model) throws Exception;
	
	//String cartPrdQuantitySv(CartDto cartDto, Model model) throws Exception;
	
	String cartQyPlusSv(CartDto cartDto, Model model) throws Exception;
	
	String cartQyMinusSv(CartDto cartDto, Model model) throws Exception;
	
	//String cartPrdDelSv(CartDto cartDto, Model model) throws Exception;
	
	String cartTotalPrdDelSv(String mbrCode) throws Exception;
}
