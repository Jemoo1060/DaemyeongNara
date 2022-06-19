package com.spring.dm.dao;

import com.spring.dm.dto.OrderDto;

public interface IOrderDao {
	
	OrderDto orderSltone(String orderCode);
	
	void orderInsert(OrderDto orderDto);
	
	void orderUpdate(OrderDto orderDto);

}
