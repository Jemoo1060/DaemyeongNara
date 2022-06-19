package com.spring.dm.iservice;


import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.dm.dto.MemberDto;

public interface IMyPageService {
	
	String idOutputSv(String mbrCode,String err, Model model) throws Exception;
	
	String mbrInfoCheckSv(MemberDto memberDto, Model model) throws Exception;
	
	String mbrInfoSv(String mbrCode, Model model) throws Exception;
	
	String mbrDefaultInfoSv(String mbrCode, Model model) throws Exception;
	
	String mbrInfoModifySv(MemberDto memberDto, Model model) throws Exception;
	
	String mbrLeaveSv(String mbrCode,HttpSession session, Model model) throws Exception;
	
	String mbrOrderListSv(String mbrCode, String startDate, String endDate, Model model) throws Exception;
	
	String orderCancelSv(String orderCode,String mbrCode, Model model) throws Exception;
	
	String mbrOrderDetailSv(String orderCode,String orderContent, Model model) throws Exception;
	
	String deliveryInfoSv(String orderCode, Model model) throws Exception;
}
