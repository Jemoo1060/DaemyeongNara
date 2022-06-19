package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dm.dto.OrderDto;

public interface IOrderTaskDao {
	
	ArrayList<OrderDto> dateOrderSltmul(HashMap<String, Object> hm);
	
	ArrayList<HashMap<String, Object>> orderInfoSltmul(String orderCode);
	
	ArrayList<OrderDto> adOrderDateSltmul(HashMap<String, Object> hm);
	
	ArrayList<HashMap<String, Object>> orderPrdSltmul(String orderCode);
	
	HashMap<String, Object> deliveryInfo(String orderCode);

	ArrayList<OrderDto> progrsSttusList(HashMap<String, Object> hm);
	
	int orderDateListPaging(HashMap<String, Object> hm);
	
	int progrsSttusListPaging(String progrsSttus);
}
