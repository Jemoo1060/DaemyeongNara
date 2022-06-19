package com.spring.dm.svImpl;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.ICartDao;
import com.spring.dm.dao.ICartTaskDao;
import com.spring.dm.dao.IProductDao;
import com.spring.dm.dto.CartDto;
import com.spring.dm.dto.CartListDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.iservice.ICartService;

@Service("cartService")
public class CartServiceImpl implements ICartService{ // 장바구니 내역출력
	
	@Autowired
	ICartDao cartDao;
	
	@Autowired
	ICartTaskDao cartTaskDao;
	
	@Autowired
	IProductDao prdDao;
	
	@Override
	public String cartListSv(String mbrCode, Model model) throws Exception{ 
		
		
		ArrayList<CartListDto> list = cartTaskDao.mbrCartSltmul(mbrCode);
		
		if(list.size() == 0) {
			model.addAttribute("ERR", "장바구니에 상품이 없습니다.");
			
			return "cart";
		}
		
		int total = 0;
		
		for(int i = 0 ; i < list.size() ; i++) {
			int cal = list.get(i).getPrdPc() * list.get(i).getQy();
			total += cal;
		}
	
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		
		return "cart";
		
		
	}
	
	/*@Override
	@Transactional
	public String cartPrdQuantitySv(CartDto cartDto, Model model) throws Exception{ // 장바구니 제품 수량 증감
			
		cartDto = cartDao.cartSltone(cartDto);
		
		if(cartDto == null) {
			model.addAttribute("ERR", "해당 상품이 존재하지 않습니다.");
			return "redirect:/cartList";
		}
		else {
			
			cartDao.cartUpdate(cartDto);
			
			model.addAttribute("QY", cartDto);
			
			return "redirect:/cartList"+ cartDto.getMbrCode();
		}
				
	}*/
	
	public String cartQyPlusSv(CartDto cartDto, Model model) throws Exception{
		
		cartDto = cartDao.cartSltone(cartDto);
		
		if(cartDto == null) {
			model.addAttribute("ERR", "해당 상품이 존재하지 않습니다.");
			return "error";
		}
		else {
			
			int qy = cartDto.getQy() + 1;
			
			ProductDto prd = prdDao.prdSltOne(cartDto.getPrdCode());
			System.out.println(prd.getPrdInvntry());
			if(qy > prd.getPrdInvntry()) {
				qy = prd.getPrdInvntry()-1 ;
				return "redirect:/cartList?mbrCode=" + cartDto.getMbrCode();
			}
			
			cartDto.setQy(qy);
			
			cartDao.cartUpdate(cartDto);
			
			return "redirect:/cartList?mbrCode=" + cartDto.getMbrCode();
		}
	}
	
	public String cartQyMinusSv(CartDto cartDto, Model model) throws Exception{
		
		cartDto = cartDao.cartSltone(cartDto);
		
		if(cartDto == null) {
			model.addAttribute("ERR", "해당 상품이 존재하지 않습니다.");
			return "error";
		}
		else {
			
			int qy = cartDto.getQy() - 1;
			
			if(qy < 1) {
				qy = 1;
				return "redirect:/cartList?mbrCode=" + cartDto.getMbrCode();
			}
			cartDto.setQy(qy);
			
			cartDao.cartUpdate(cartDto);
			
			return "redirect:/cartList?mbrCode=" + cartDto.getMbrCode();
		}
	}
	
	/*@Override
	@Transactional
	public String cartPrdDelSv(CartDto cartDto, Model model) throws Exception{ // 장바구니 내역 선택 삭제
		
		CartDto cartSlt = cartDao.cartSltone(cartDto);
		
		if(cartSlt == null) {
			model.addAttribute("ERR", "해당 상품이 존재하지 않습니다.");
			return "cart";
		}
		else {
			cartDao.cartDelete(cartDto);
			
			model.addAttribute("CART", cartDto);
			
			return "redirect:/cartList" + cartDto.getMbrCode();
		}
		
	}*/
	
	@Override
	@Transactional
	public String cartTotalPrdDelSv(String mbrCode) throws Exception { // 전체삭제
		
		cartTaskDao.cartPrdTotalDelete(mbrCode);
		
		
		return "redirect:/cartList?mbrCode=" + mbrCode;
	}
	
}
