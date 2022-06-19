package com.spring.dm.ctrl;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.IMyPageService;

@Controller
public class MyPageCtrl {
	
	@Autowired
	IMyPageService myPageService;
	
	@RequestMapping("cstCheck")
	public String cstCheck(String mbrCode,String err, Model model) throws Exception {

		return myPageService.idOutputSv(mbrCode,err, model);
	}
	
	@RequestMapping("cstInfoCheck")
	public String cstInfoCheck(MemberDto memberDto, Model model) throws Exception {

		return myPageService.mbrInfoCheckSv(memberDto, model);
	}
	
	
	
	@RequestMapping("cstInfoInquiry")
	public String cstInfoInquiry(String mbrCode, Model model) throws Exception {

		return myPageService.mbrInfoSv(mbrCode, model);
	}
	
	@RequestMapping("breakawayDone")
	public String breakawayDone(String mbrCode,HttpSession session, Model model) throws Exception {

		return myPageService.mbrLeaveSv(mbrCode,session, model);
	}
	
	@RequestMapping("cstInfoUpdatePage")
	public String cstInfoUpdatePage(String mbrCode, Model model) throws Exception {

		return myPageService.mbrDefaultInfoSv(mbrCode, model);
	}
	
	
	@RequestMapping("cstInfoUpdate")
	public String cstInfoUpdate(MemberDto memberDto, Model model) throws Exception {

		return myPageService.mbrInfoModifySv(memberDto, model);
	}
	
	@RequestMapping("orderInfo")
	public String orderInfo(String mbrCode, String startDate, String endDate, Model model) throws Exception {

		return myPageService.mbrOrderListSv(mbrCode, startDate, endDate, model);
	}
	
	@RequestMapping("cancelRequest")
	public String cancelRequest(String orderCode,String mbrCode, Model model) throws Exception {

		return myPageService.orderCancelSv(orderCode, mbrCode, model);
	}
	
	@RequestMapping("deliveryInquiry")
	public String deliveryInquiry(String orderCode, Model model) throws Exception {

		return myPageService.deliveryInfoSv(orderCode, model);
	}

	@RequestMapping("detailOrderContent")
	public String detailOrderContent(String orderCode,String orderContent, Model model) throws Exception {

		return myPageService.mbrOrderDetailSv(orderCode,orderContent, model);
	}
}
































