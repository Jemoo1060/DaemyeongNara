package com.spring.dm.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.CartDto;
import com.spring.dm.iservice.IOrderService;

@Controller
public class OrderCtrl {
	
	@Autowired
	IOrderService orderService;
	
	private String viewName;
	
	@RequestMapping("directOrder")
	public String directOrder (CartDto cartDto, Model model) throws Exception{

		viewName = orderService.directOrderSv( cartDto, model);
		
		return viewName;
	}
	
	@RequestMapping("cartOrder")
	public String cartOrder (CartDto cartDto, Model model) throws Exception{
		
		viewName = orderService.cartOrderSv(cartDto, model);
		
		return viewName;
	}
	
}
