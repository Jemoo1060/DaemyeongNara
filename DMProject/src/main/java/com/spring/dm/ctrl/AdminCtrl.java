package com.spring.dm.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.MemberDto;
import com.spring.dm.dto.OrderDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.dto.SchoolZoneDto;
import com.spring.dm.iservice.IAdminMbrService;
import com.spring.dm.iservice.IAdminOrderService;
import com.spring.dm.iservice.IAdminPrdService;
import com.spring.dm.iservice.IAdminSchoolZoneService;

@Controller
public class AdminCtrl {

	@Autowired
	IAdminPrdService adminPrdService;
	
	@Autowired
	IAdminOrderService adminOrderService;
	
	@Autowired
	IAdminMbrService adminMbrService;
	
	@Autowired
	IAdminSchoolZoneService adminSchoolZoneService;
	
	private String viewName;
	
	private static final Logger logger = LoggerFactory.getLogger(MbrJoinCtrl.class);
	
	@RequestMapping("goAdmin")
	public String goAdmin() throws Exception {
		logger.info("goAdmin called ========");
		viewName = "admin";
		return viewName;
	}
	
	@RequestMapping("goPrdAdd")
	public String goPrdAdd(ProductDto productDto, ProductImageDto productImageDto, Model model) throws Exception {
		logger.info("goPrdAdd called ========");
		viewName = "adminPrdAdd";
		return viewName;
	}
	
	@RequestMapping("prdAdd")
	public String prdAdd(ProductDto productDto, ProductImageDto productImageDto, Model model) throws Exception {
		logger.info("prdAdd called ========");
		viewName = adminPrdService.adPrdAddSv(productDto, productImageDto, model);
		return viewName;
	}
	
	@RequestMapping("prdManage")
	public String goPrdManage(String pageNo, String cutPageNo, String err, Model model) throws Exception {
		logger.info("prdManage called ========");
		viewName = adminPrdService.adPrdListSv(pageNo, cutPageNo, err, model);
		return viewName;
	}
	
	@RequestMapping("pclListManage")
	public String pclListManage(@ModelAttribute("pclCode") String pclCode, String pageNo, String cutPageNo, String err, Model model) throws Exception {
		logger.info("pclListManage called ========");
		viewName = adminPrdService.adPclListSv(pageNo, cutPageNo, err, pclCode, model);
		return viewName;
	}
	
	@RequestMapping("goPrdModify")
	public String goPrdModify(@ModelAttribute("prdCode") String prdCode, Model model) throws Exception {
		logger.info("goPrdModify called ========");
		viewName = adminPrdService.adPrdInfoSv(prdCode, model);
		return viewName;
	}
	
	@RequestMapping("prdModify")
	public String prdModify(@ModelAttribute("productDto") ProductDto productDto, Model model) throws Exception {
		logger.info("prdModify called ========");
		viewName = adminPrdService.adPrdModifySv(productDto, model);
		return viewName;
	}
	
	@RequestMapping("prdDelete")
	public String prdDelete(@ModelAttribute("prdCode") String prdCode, Model model) throws Exception {
		logger.info("prdDelete called ========");
		viewName = adminPrdService.adPrdRemoveSv(prdCode, model);
		return viewName;
	}
	
	@RequestMapping("orderManage")
	public String goOrderManage(String pageNo, String cutPageNo, String err, String startDate, String endDate, Model model) throws Exception {
		logger.info("orderManage called ========");
		viewName = adminOrderService.adDateOrderSv(pageNo, cutPageNo, err, startDate, endDate, model);
		return viewName;
	}
	
	@RequestMapping("mbrManage")
	public String goMbrManage(String pageNo, String cutPageNo, String err, Model model) throws Exception {
		logger.info("mbrManage called ========");
		viewName = adminMbrService.adMbrListSv(pageNo, cutPageNo, err, model);
		return viewName;
	}
	
	@RequestMapping("gradeListManage")
	public String gradeListManage(@ModelAttribute("mbrGrade") String mbrGrade, String pageNo, String cutPageNo, String err, Model model) throws Exception {
		logger.info("gradeListManage called ========");
		viewName = adminMbrService.adMbrListGradeSv(pageNo, cutPageNo, err, mbrGrade, model);
		return viewName;
	}
	
	@RequestMapping("schoolZoneManage")
	public String goSchoolZoneManage() throws Exception {
		logger.info("schoolZoneManage called ========");
		viewName = "adminSchoolzone";
		return viewName;
	}
	
	@RequestMapping("orderDetail")
	public String goOrderDetail(@ModelAttribute("orderCode") String orderCode, Model model) throws Exception {
		logger.info("orderDetail called ========");
		viewName = adminOrderService.adOrderDetailSv(orderCode, model);
		return viewName;
	}
	
	@RequestMapping("orderListManage")
	public String orderListManage(@ModelAttribute("progrsSttus") String progrsSttus, String pageNo, String cutPageNo, String err, Model model) throws Exception {
		logger.info("orderListManage called ========");
		viewName = adminOrderService.adSttusListSv(pageNo, cutPageNo, err, progrsSttus, model);
		return viewName;
	}
	
	@RequestMapping("orderCancel")
	public String goOrderCancel(@ModelAttribute("orderCode") String orderCode, Model model) throws Exception {
		logger.info("orderDetail called ========");
		viewName = adminOrderService.adOrderCancelSv(orderCode, model);
		return viewName;
	}
	
	@RequestMapping("updateDetailOrderInfo")
	public String goOrderListFromDetail(@ModelAttribute("orderDto") OrderDto orderDto, Model model) throws Exception {
		logger.info("updateDetailOrderInfo called ========");
		viewName = adminOrderService.adOrderUpdateSv(orderDto, model);
		return viewName;
	}
	
	@RequestMapping("goMbrUpdate")
	public String goMbrUpdate(@ModelAttribute("mbrCode") String mbrCode, Model model) throws Exception {
		logger.info("goMbrUpdate called ========");
		viewName = adminMbrService.adMbrDetailSv(mbrCode, model);
		return viewName;
	}
	
	@RequestMapping("mbrUpdate")
	public String mbrUpdate(@ModelAttribute("memberDto") MemberDto memberDto, Model model) throws Exception {
		logger.info("goMbrUpdate called ========");
		viewName = adminMbrService.adMbrModifySv(memberDto, model);
		return viewName;
	}
	
	@RequestMapping("goReadyInput")
	public String goReadyInput(@ModelAttribute("schulCode") String schulCode, Model model) throws Exception {
		logger.info("goReadyInput called ========");
		viewName = adminSchoolZoneService.adNoticeViewSv(schulCode, model);
		return viewName;
	}
	
	@RequestMapping("updateSchoolZone")
	public String updateSchoolZone(@ModelAttribute("schoolZoneDto") SchoolZoneDto schoolZoneDto, Model model) throws Exception {
		logger.info("updateSchoolZone called ========");
		viewName = adminSchoolZoneService.adNoticeModifySv(schoolZoneDto, model);
		return viewName;
	}
	
	@RequestMapping("removeSchoolZone")
	public String removeSchoolZone(@ModelAttribute("schulCode") String schulCode, Model model) throws Exception {
		logger.info("removeSchoolZone called ========");
		viewName = adminSchoolZoneService.adNoticdRemoveSv(schulCode, model);
		return viewName;
	}
}
