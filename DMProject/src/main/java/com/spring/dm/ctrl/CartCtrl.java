package com.spring.dm.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.CartDto;
import com.spring.dm.iservice.ICartService;

@Controller
public class CartCtrl {
	
	@Autowired
	private ICartService cartService;
	


	@RequestMapping("cartList")
	public String cartList(String mbrCode, Model model) throws Exception {
		String viewName = "";
		
		viewName = cartService.cartListSv(mbrCode, model);
		 
		return viewName;
		
	}
	
	@RequestMapping("cartPrdQuantity")
	public String cartPrdQuantity (String check, CartDto cartDto, Model model) throws Exception {
		
		 String viewName = "";
		if("plus".equals(check)) {

			System.out.println(check);
			viewName = cartService.cartQyPlusSv(cartDto, model);
		}
		else if("minus".equals(check)) {
			viewName = cartService.cartQyMinusSv(cartDto, model);
			
		}
		
		return viewName;
		
	}
	
	/*@RequestMapping("cartPrdDel") // 선택삭제
	public String cartPrdDel(@RequestParam(value = "chbox[]")  List<String> chArr, CartDto cartDto, Model model) throws Exception {
		String viewName = "";
		
		viewName = cartService.cartPrdDelSv(cartDto, model);
		 
		return viewName; 
	}*/
	
	@RequestMapping("cartTotalPrdDel") // 전체삭제
	public String cartTotalPrdDel(String mbrCode) throws Exception {
		String viewName = "";
		
		viewName = cartService.cartTotalPrdDelSv(mbrCode);
		 
		return viewName; 
	}

}
