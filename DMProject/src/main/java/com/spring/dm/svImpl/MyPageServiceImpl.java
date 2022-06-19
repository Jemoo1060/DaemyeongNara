package com.spring.dm.svImpl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMemberDao;
import com.spring.dm.dao.IMemberTaskDao;
import com.spring.dm.dao.IOrderDao;
import com.spring.dm.dao.IOrderTaskDao;
import com.spring.dm.dto.DeliveryDto;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.dto.OrderDetailDto;
import com.spring.dm.dto.OrderDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.iservice.IMyPageService;

@Service("myPageService")
public class MyPageServiceImpl implements IMyPageService {
	
	@Autowired
	IMemberDao memberDao;
	@Autowired
	IOrderTaskDao orderTaskDao;
	@Autowired
	IOrderDao orderDao;
	@Autowired
	IMemberTaskDao memberTaskDao;
	
	@Override
	public String idOutputSv(String mbrCode,String err, Model model) throws Exception {

		MemberDto memberDto = memberDao.mbrSltone(mbrCode);
		
		if(memberDto == null) {
			model.addAttribute("ERR", "존재하지 않는 아이디입니다.");
			return "redirect:goLogin";	
		}
		
		String id = memberDto.getMbrId();
		model.addAttribute("id", id);
		model.addAttribute("err", err);
		return "cstCheck";
	}
	
	@Override
	public String mbrInfoCheckSv(MemberDto memberDto, Model model) throws Exception {
		
		MemberDto mbrChkDto = memberTaskDao.idInfoCheck(memberDto.getMbrId());
		
		if(mbrChkDto == null) {
			model.addAttribute("err", "존재하지 않는 아이디입니다.");
			return "redirect:goLogin";	
		}
		
		if(memberDto.getMbrPwd().equals(mbrChkDto.getMbrPwd())) {

			return "redirect:/cstInfoInquiry?mbrCode="+ mbrChkDto.getMbrCode();
			
		}
		
		model.addAttribute("err", "잘못된 비밀번호입니다.");
		
		return "redirect:/cstCheck?mbrCode="+ mbrChkDto.getMbrCode();
	}
	

	@Override
	public String mbrInfoSv(String mbrCode, Model model) throws Exception {

		MemberDto memberDto = memberDao.mbrSltone(mbrCode);
		
		if(memberDto == null) {
			model.addAttribute("err", "존재하지 않는 회원입니다.");
			return "redirect:goLogin";
		}
			
		String schulGradeClass = "해당 없음";
		
		String classCheck = memberDto.getSchulGradeClass();
		if(classCheck != null){
			String[] schclass = classCheck.split("0");
			schulGradeClass = schclass[1]+"학년 " +  schclass[2] + "반";
		}

		model.addAttribute("schulGradeClass", schulGradeClass);
		model.addAttribute("memberDto",memberDto);
		
		return "cstInfoInquiry";
	}
	
	@Override
	public String mbrDefaultInfoSv(String mbrCode, Model model) throws Exception {
		
		MemberDto memberDto = memberDao.mbrSltone(mbrCode);
		
		if(memberDto == null) {
			model.addAttribute("err", "존재하지 않는 회원입니다.");
			return "redirect:goLogin";
		}

		model.addAttribute("memberDto",memberDto);
	
		return "cstInfoUpdate";
	}

	@Override
	@Transactional
	public String mbrInfoModifySv(MemberDto memberDto, Model model) throws Exception {
		
		MemberDto mbrUpdateDto = memberDao.mbrSltone(memberDto.getMbrCode());
		
		if(mbrUpdateDto == null) {
			model.addAttribute("err", "존재하지 않는 회원입니다.");
			return "redirect:goLogin";
		}
		mbrUpdateDto.setMbrEmail(memberDto.getMbrEmail());
		mbrUpdateDto.setMbrTelNo(memberDto.getMbrTelNo());
		mbrUpdateDto.setMbrPwd(memberDto.getMbrPwd());
		mbrUpdateDto.setMbrGrade(memberDto.getMbrGrade());
		mbrUpdateDto.setSchulGradeClass(memberDto.getSchulGradeClass());
		
		memberDao.mbrUpdate(mbrUpdateDto);
		
		return "redirect:cstInfoInquiry?mbrCode=" + mbrUpdateDto.getMbrCode();
	}

	@Override
	@Transactional
	public String mbrLeaveSv(String mbrCode,HttpSession session, Model model) throws Exception {
      
		MemberDto memberDto = memberDao.mbrSltone(mbrCode); 
      
		if(memberDto == null ) {
			model.addAttribute("err", "존재하지 않은 회원입니다.");
			return "redirect:goLogin";
		}
  
		memberDto.setMbrName("retired");
		memberDto.setMbrBrthdy("00000000");
		memberDto.setMbrSex('0');
		memberDto.setMbrEmail("retired");
		memberDto.setMbrTelNo("00000000000");
		memberDto.setMbrGrade("0000");
		memberDto.setSbscrbDate("00000000");
		memberDto.setSchulGradeClass("0000");
  
		memberDao.mbrUpdate(memberDto);;
		session.removeAttribute("mbrCode");
		session.removeAttribute("mbrId");
  
		return "breakawayDone";
	}

	@Override
	public String mbrOrderListSv(String mbrCode, String startDate, String endDate, Model model) throws Exception {
		
		HashMap<String, Object> hm = new HashMap<>();
		LocalDate now = LocalDate.now();
		String startDtSql;
		String endDtSql;
		
		if(startDate == null) {
			LocalDate earlier = now.minusMonths(2);
			startDate = earlier.toString();
		}
		
		if(endDate == null) {
			endDate = now.toString();
		}
		
		String[] start = startDate.split("-");
		startDtSql = start[0] + start[1] + start[2]; 	
		String[] end = endDate.split("-");
		endDtSql = end[0] + end[1] + end[2]; 
		
		hm.put("mbrCode", mbrCode);
		hm.put("startDate", startDtSql);
		hm.put("endDate", endDtSql);
		
		ArrayList<OrderDto> list =  orderTaskDao.dateOrderSltmul(hm);
		ArrayList<HashMap<String, Object>> infoList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			ArrayList<HashMap<String, Object>> orderInfoList = orderTaskDao.orderInfoSltmul(list.get(i).getOrderCode());
			ArrayList<OrderDetailDto> orderDeList = new ArrayList<>();
			ArrayList<ProductDto> prdList = new ArrayList<>();
			ArrayList<ProductImageDto> prdImgList = new ArrayList<>();
			for(int j = 0; j < orderInfoList.size(); j++){
				HashMap<String, Object> orderInfohm = orderInfoList.get(j);
				OrderDetailDto orderDetailDto = (OrderDetailDto)orderInfohm.get("orderDetail");
				ProductDto productDto = (ProductDto)orderInfohm.get("product");
				ProductImageDto productImageDto = (ProductImageDto)orderInfohm.get("productImage");
				orderDeList.add(orderDetailDto);
				prdList.add(productDto);
				prdImgList.add(productImageDto);
			}
			
			String imgUrl = prdImgList.get(0).getPrdImageUrl();
			String content = "";
			if(prdList.size() > 2) {
				for(int k = 0; k < 2; k++) {
					content += prdList.get(k).getPrdName() + " ";
				}
				content += "....";
			} else {
				for(int l = 0; l < prdList.size(); l++) {
					content += prdList.get(l).getPrdName() + " ";
				}
			}
			
			int totalQy = 0;
			for(int count = 0; count < orderDeList.size(); count++) {
				totalQy += orderDeList.get(count).getDetailOrderQy();
			}
			
			HashMap<String, Object> infoHm = new HashMap<String, Object>();
			infoHm.put("imgUrl", imgUrl);
			infoHm.put("content", content);
			infoHm.put("totalQy", totalQy);
			infoList.add(infoHm);
		}
			
		model.addAttribute("currentTime", now);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("list", list);
		model.addAttribute("infoList", infoList);
		return "orderInfo";
	}

	@Override
	@Transactional
	public String orderCancelSv(String orderCode, String mbrCode, Model model) throws Exception {
		
		OrderDto orderDto = orderDao.orderSltone(orderCode);
		
		if(orderDto == null) {
			model.addAttribute("err", "존재하지 않은 주문입니다.");
			return "redirect:orderInfo?mbrCode="+ mbrCode;
		}
		
		orderDto.setProgrsSttus("0505");
		
		orderDao.orderUpdate(orderDto);

		return "cancelRequest";
	}

	@Override
	public String mbrOrderDetailSv(String orderCode,String orderContent, Model model) throws Exception {
		
		HashMap<String, Object> hm =  orderTaskDao.deliveryInfo(orderCode);
		OrderDto orderDto = (OrderDto)hm.get("order");
		DeliveryDto deliveryDto = (DeliveryDto)hm.get("delivery");
		
		MemberDto memberDto = memberDao.mbrSltone(orderDto.getMbrCode());
		
		ArrayList<HashMap<String, Object>> list = orderTaskDao.orderPrdSltmul(orderCode);
		
		ArrayList<ProductDto> prdList = new ArrayList<>();
		ArrayList<OrderDetailDto> oDList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> oPhm = list.get(i);
			ProductDto productDto =(ProductDto)oPhm.get("product");
			OrderDetailDto orderDetailDto = (OrderDetailDto)oPhm.get("orderDetail");
			prdList.add(productDto);
			oDList.add(orderDetailDto);
		}
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("orderContent", orderContent);
		model.addAttribute("deliveryDto", deliveryDto);
		model.addAttribute("prdList", prdList);
		model.addAttribute("oDList", oDList);

		return "detailOrderContent";
	}

	@Override
	public String deliveryInfoSv(String orderCode, Model model) throws Exception {
		
		HashMap<String, Object> hm =  orderTaskDao.deliveryInfo(orderCode);
		OrderDto orderDto = (OrderDto)hm.get("order");
		DeliveryDto deliveryDto = (DeliveryDto)hm.get("delivery");
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("deliveryDto", deliveryDto);

		return "deliveryInquiry";
	}

}

