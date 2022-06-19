package com.spring.dm.svImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.ICartDao;
import com.spring.dm.dao.ICartTaskDao;
import com.spring.dm.dao.IDeliveryDao;
import com.spring.dm.dao.IMaxDao;
import com.spring.dm.dao.IOrderDao;
import com.spring.dm.dao.IOrderDetailDao;
import com.spring.dm.dto.CartDto;
import com.spring.dm.dto.DeliveryDto;
import com.spring.dm.dto.OrderDetailDto;
import com.spring.dm.dto.OrderDto;
import com.spring.dm.iservice.IPaymentService;

@Service("paymentService")
public class PaymentServiceImpl implements IPaymentService{
	
	@Autowired
	IOrderDao orderDao;
	
	@Autowired 
	IDeliveryDao deliveryDao;
	
	@Autowired
	IOrderDetailDao orderDetailDao;
	
	@Autowired
	ICartTaskDao cartTaskDao;
	
	@Autowired
	ICartDao cartDao;
	
	@Autowired
	IMaxDao maxDao;
	
	
	
	@Override
	@Transactional
	public String paymentSv(OrderDto orderDto, DeliveryDto deliveryDto,String directPrdCode,String directQy, Model model) throws Exception { 
		
		String orderCode = maxDao.maxOrderCode();
		if(orderCode == null) {
			orderCode = "1"; 
		}
		else {
			orderCode = String.valueOf((Integer.parseInt(orderCode)) + 1);
		}
		OrderDto orderSlt = orderDao.orderSltone(orderCode);
		
		String dlvyCode = maxDao.maxDlvyCode();
		if(dlvyCode == null) {
			dlvyCode = "1"; 
		}
		else {
			dlvyCode = String.valueOf((Integer.parseInt(dlvyCode)) + 1);
		}
		DeliveryDto dlvySlt = deliveryDao.deliverySltone(dlvyCode);
		

		
		
		if(orderSlt != null && dlvySlt != null) {
			model.addAttribute("orderERR", "주문정보가 존재합니다.");
			model.addAttribute("dlvyERR", "배송정보가 존재합니다");
			model.addAttribute("cartERR", "카트에 상품이 존재하지 않습니다.");

			return "error";
		}
		
		deliveryDto.setDlvyCode(dlvyCode);	
		deliveryDao.deliveryInsert(deliveryDto);
		
		orderDto.setOrderCode(orderCode);
		orderDto.setDlvyCode(dlvyCode);
		orderDao.orderInsert(orderDto);
		
		ArrayList<CartDto> cartList = cartTaskDao.cartSltmul(orderDto.getMbrCode());
		
		if(cartList.size() != 0) {
			for(int i = 0; i < cartList.size(); i++) {
				OrderDetailDto orderDetailDto = new OrderDetailDto();
				orderDetailDto.setOrderCode(orderCode);
				orderDetailDto.setPrdCode(cartList.get(i).getPrdCode());
				orderDetailDto.setDetailOrderQy(cartList.get(i).getQy());
				OrderDetailDto orderDetailSlt = orderDetailDao.orderDetailSltone(orderDetailDto);
				
				if(orderDetailSlt !=null) {
					model.addAttribute("orderInfoERR", "주문상세정보가 존재합니다");
					return "error";
				}
				orderDetailDao.orderDetailInsert(orderDetailDto);
			}
		} else {
			OrderDetailDto detailDto = new OrderDetailDto();
			detailDto.setOrderCode(orderCode);
			detailDto.setPrdCode(directPrdCode);
			detailDto.setDetailOrderQy(Integer.parseInt(directQy));
			orderDetailDao.orderDetailInsert(detailDto);
			CartDto cartDto = new CartDto();
			cartDto.setMbrCode(orderDto.getMbrCode());
			cartDto.setPrdCode(directPrdCode);
			cartDao.cartDelete(cartDto);
		}

		cartTaskDao.cartPrdTotalDelete(orderDto.getMbrCode());
		
		
		return "payComplete";
			

	}
}
