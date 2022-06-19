package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.CartDto;


public interface IOrderService {
	
	String directOrderSv(CartDto cartDto, Model model) throws Exception;
	
	String cartOrderSv(CartDto cartDto, Model model) throws Exception;
	
}
