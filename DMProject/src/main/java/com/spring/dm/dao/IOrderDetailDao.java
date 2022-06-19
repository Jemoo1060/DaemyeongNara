package com.spring.dm.dao;

import com.spring.dm.dto.OrderDetailDto;

public interface IOrderDetailDao {
	
	OrderDetailDto orderDetailSltone(OrderDetailDto orderDetailDto);
	
	void orderDetailInsert(OrderDetailDto orderDetailDto);

}
