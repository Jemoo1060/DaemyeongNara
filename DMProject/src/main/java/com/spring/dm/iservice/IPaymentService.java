package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.DeliveryDto;
import com.spring.dm.dto.OrderDto;

public interface IPaymentService {
	
	String paymentSv(OrderDto orderDto, DeliveryDto deliveryDto, String directPrdCode, String directQy, Model model) throws Exception;
	
}
