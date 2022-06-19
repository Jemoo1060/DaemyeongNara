package com.spring.dm.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.DeliveryDto;
import com.spring.dm.dto.OrderDto;
import com.spring.dm.iservice.IPaymentService;

@Controller
public class PaymentCtrl {
	
	@Autowired
	IPaymentService paymentService;
	
	private String viewName;
	
	@RequestMapping("payment")
	public String payment(OrderDto orderDto, DeliveryDto deliveryDto,String directPrdCode, String directQy, Model model) throws Exception{
		
		viewName = paymentService.paymentSv(orderDto, deliveryDto,directPrdCode, directQy, model);
		
		return viewName;
	}

}
