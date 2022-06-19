package com.spring.dm.dao;

import com.spring.dm.dto.DeliveryDto;

public interface IDeliveryDao {
	
	DeliveryDto deliverySltone(String dlvyCode);
	
	void deliveryInsert(DeliveryDto deliveryDto);
	
}
