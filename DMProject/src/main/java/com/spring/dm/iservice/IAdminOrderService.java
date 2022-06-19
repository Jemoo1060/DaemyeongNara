package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.OrderDto;

public interface IAdminOrderService {
	String adDateOrderSv(String pageNo, String cutPageNo, String err, String startDate, String endDate, Model model) throws Exception;
	String adOrderDetailSv(String orderCode, Model model) throws Exception;
	String adOrderCancelSv(String orderCode, Model model) throws Exception;
	String adOrderUpdateSv(OrderDto orderDto, Model model) throws Exception;
	String adSttusListSv(String pageNo, String cutPageNo, String err, String progrsSttus, Model model) throws Exception;
}
