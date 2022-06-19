package com.spring.dm.svImpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMemberDao;
import com.spring.dm.dao.IOrderDao;
import com.spring.dm.dao.IOrderTaskDao;
import com.spring.dm.dto.DeliveryDto;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.dto.OrderDetailDto;
import com.spring.dm.dto.OrderDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.iservice.IAdminOrderService;

@Transactional
@Service("adminOrderService")
public class AdminOrderServiceImpl implements IAdminOrderService {

	@Autowired
	private IOrderTaskDao orderTaskDao;
	
	@Autowired
	private IOrderDao orderDao;
	
	@Autowired
	private IMemberDao memberDao;
	
	@Override
	public String adDateOrderSv(String pageNo, String cutPageNo, String err, String startDate, String endDate, Model model) throws Exception {
		String endDate1;
		String startDate1;
		
		int nPageNo;
		int nCutPageNo;
		int mbrGradeBool = 1;
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 3;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		if(startDate == null || endDate == null) {
			startDate1 = "20210101";
			endDate1 = "20291231";
			startDate = "2021-01-01";
			endDate = "2029-12-31";
		} else {
			String[] start = startDate.split("-");
			startDate1 = start[0] + start[1] + start[2];
			
			String[] end = endDate.split("-");
			endDate1 = end[0] + end[1] + end[2];
		}
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startDate", startDate1);
		hm.put("endDate", endDate1);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		HashMap<String, Object> hm1 = new HashMap<String, Object>();
		hm1.put("startDate", startDate1);
		hm1.put("endDate", endDate1);
		
		ArrayList<OrderDto> al = orderTaskDao.adOrderDateSltmul(hm);
		
		int maxOrder = orderTaskDao.orderDateListPaging(hm1);
		int maxPage = (maxOrder%MAX_ROWS == 0)?maxOrder/MAX_ROWS : maxOrder/MAX_ROWS+1; 
		
		ArrayList<String> alState = new ArrayList<String>();
		String sttus = "";
		
		for(int i = 0; i < al.size(); i++) {
			OrderDto orderDto = al.get(i);
			
			String state = orderDto.getProgrsSttus();
					
			switch(state) {
			case "0501":
				sttus = "결제완료";
				break;
			case "0502":
				sttus = "배송준비중";
				break;
			case "0503":
				sttus = "배송중";
				break;
			case "0504":
				sttus = "배송완료";
				break;
			case "0505":
				sttus = "취소대기중";
				break;
			case "0506":
				sttus = "취소완료";
				break;
			}
			
			alState.add(sttus);
		}

		model.addAttribute("mbrGradeBool", mbrGradeBool);
		model.addAttribute("alState", alState);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("orderAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminOrderManage";
	}
	
	@Override
	public String adOrderDetailSv(String orderCode, Model model) throws Exception {
		HashMap<String, Object> hm = orderTaskDao.deliveryInfo(orderCode);
		
		ArrayList<HashMap<String, Object>> al = orderTaskDao.orderPrdSltmul(orderCode);
		
		if(hm == null || al.size() == 0) {
			model.addAttribute("ERR", "주문내역을 불러올 수 없습니다.");
			return "admin_order_manage";
		}
		
		OrderDto orderDto = (OrderDto)hm.get("order");
		DeliveryDto deliveryDto = (DeliveryDto)hm.get("delivery");
		
		ArrayList<OrderDetailDto> alOrderDetailDto = new ArrayList<OrderDetailDto>();
		ArrayList<ProductDto> alProductDto = new ArrayList<ProductDto>();
		
		String mbrCode = orderDto.getMbrCode();
		MemberDto memberDto = memberDao.mbrSltone(mbrCode);
		
		for(int i = 0; i < al.size(); i++) {
			HashMap<String, Object> hm1 = al.get(i);

			alProductDto.add((ProductDto) hm1.get("product"));
			alOrderDetailDto.add((OrderDetailDto)hm1.get("orderDetail"));			
		}
		
		String state = orderDto.getProgrsSttus();
		String sttus = "";
		
		switch(state) {
		case "0501":
			sttus = "결제완료";
			break;
		case "0502":
			sttus = "배송준비중";
			break;
		case "0503":
			sttus = "배송중";
			break;
		case "0504":
			sttus = "배송완료";
			break;
		case "0505":
			sttus = "취소대기중";
			break;
		case "0506":
			sttus = "취소완료";
			break;
		}
		
		model.addAttribute("sttus", sttus);
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("deliveryDto", deliveryDto);
		model.addAttribute("alProductDto", alProductDto);
		model.addAttribute("alOrderDetailDto", alOrderDetailDto);
		model.addAttribute("memberDto", memberDto);
		
		return "adminOrderDetail";
	}
	
	@Override
	public String adOrderCancelSv(String orderCode, Model model) throws Exception {
		OrderDto sltOrderDto = orderDao.orderSltone(orderCode);
		
		if(sltOrderDto == null) {
			model.addAttribute("ERR", "삭제할 주문 내역이 없습니다.");
			return "redirect:/orderManage";
		}
		
		sltOrderDto.setProgrsSttus("0506");
		orderDao.orderUpdate(sltOrderDto);
		
		return "redirect:/orderManage";
	}
	
	@Override
	public String adOrderUpdateSv(OrderDto orderDto, Model model) throws Exception {
		String orderCode = orderDto.getOrderCode();
		String progrsSttus = orderDto.getProgrsSttus();		
		
		OrderDto sltOrderDto = orderDao.orderSltone(orderCode);
		
		if(sltOrderDto == null) {
			model.addAttribute("ERR", "수정할 주문 내역이 없습니다.");
			return "redirect:/orderManage";
		}
		
		sltOrderDto.setProgrsSttus(progrsSttus);
		
		orderDao.orderUpdate(sltOrderDto);
		
		return "redirect:/orderManage";
	}
	
	@Override
	public String adSttusListSv(String pageNo, String cutPageNo, String err, String progrsSttus, Model model) throws Exception {
		int nPageNo;
		int nCutPageNo;
		int mbrGradeBool = 2;
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 3;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		hm.put("progrsSttus", progrsSttus);
		
		ArrayList<OrderDto> al = orderTaskDao.progrsSttusList(hm);
		
		int maxOrder = orderTaskDao.progrsSttusListPaging(progrsSttus);
		int maxPage = (maxOrder%MAX_ROWS == 0)?maxOrder/MAX_ROWS : maxOrder/MAX_ROWS+1;
		
		ArrayList<String> alState = new ArrayList<String>();
		String sttus = "";
		
		for(int i = 0; i < al.size(); i++) {
			OrderDto orderDto = al.get(i);
			
			String state = orderDto.getProgrsSttus();
					
			switch(state) {
			case "0501":
				sttus = "결제완료";
				break;
			case "0502":
				sttus = "배송준비중";
				break;
			case "0503":
				sttus = "배송중";
				break;
			case "0504":
				sttus = "배송완료";
				break;
			case "0505":
				sttus = "취소대기중";
				break;
			case "0506":
				sttus = "취소완료";
				break;
			}
			
			alState.add(sttus);
		}

		model.addAttribute("mbrGradeBool", mbrGradeBool);
		model.addAttribute("alState", alState);
		model.addAttribute("orderAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminOrderManage";
	}
}
