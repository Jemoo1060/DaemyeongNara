package com.spring.dm.svImpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.dm.dao.ICartDao;
import com.spring.dm.dao.IMemberDao;
import com.spring.dm.dao.IOrderPatternDao;
import com.spring.dm.dto.CartDto;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.iservice.IOrderService;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
	
	@Autowired
	IMemberDao memberDao;
	
	@Autowired
	ICartDao cartDao;
	
	@Autowired
	IOrderPatternDao orderPatternDao;
	
	@Override
	public String directOrderSv(CartDto cartDto, Model model) throws Exception {
		
		ArrayList<HashMap<String, Object>> list = orderPatternDao.prdDirectOrder(cartDto.getPrdCode());
		
		ArrayList<ProductDto> prdList = new ArrayList<>();
		ArrayList<ProductImageDto> prdImgList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hm = list.get(i);
			ProductDto productDto = (ProductDto)hm.get("product");
			ProductImageDto productImageDto = (ProductImageDto)hm.get("productImage");
			prdList.add(productDto);
			prdImgList.add(productImageDto);	
		}
		
		
		if(list.size() == 0) {
			model.addAttribute("ERR", "주문 정보가 존재하지 않습니다.");	
			return "order";
		}
		
		int total = prdList.get(0).getPrdPc() * cartDto.getQy();
	
		
		MemberDto memberDto = memberDao.mbrSltone(cartDto.getMbrCode());
		
		
		model.addAttribute("total", total);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("prdList", prdList);
		model.addAttribute("prdImgList", prdImgList);
		model.addAttribute("qy", cartDto.getQy());
			
		return "order";
		
	}
	
	@Override
	public String cartOrderSv(CartDto cartDto, Model model) throws Exception {  
			
		ArrayList<HashMap<String, Object>> list = orderPatternDao.cartOrderSltmul(cartDto.getMbrCode());
		
		ArrayList<CartDto> cartList = new ArrayList<>();
		ArrayList<ProductDto> prdList = new ArrayList<>();
		ArrayList<ProductImageDto> prdImgList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hm = list.get(i);
			cartDto = (CartDto)hm.get("cart");
			ProductDto productDto = (ProductDto)hm.get("product");
			ProductImageDto productImageDto = (ProductImageDto)hm.get("productImage");
			cartList.add(cartDto);
			prdList.add(productDto);
			prdImgList.add(productImageDto);	
		}
		
		
		if(list.size() == 0) {
			model.addAttribute("ERR", "장바구니 주문정보가 존재하지 않습니다.");
			
			return "order";
		}
		
		int total = 0;
		
		for(int i = 0 ; i < prdList.size() ; i++) {
			int cal = prdList.get(i).getPrdPc() * cartList.get(i).getQy();
			total += cal;
		}
		
		MemberDto memberDto = (MemberDto)list.get(0).get("member");
		
		model.addAttribute("total", total);
		model.addAttribute("memberDto", memberDto);	
		model.addAttribute("cartList", cartList);
		model.addAttribute("prdList", prdList);
		model.addAttribute("prdImgList", prdImgList);
			
		return "order";		
		
	}

}
