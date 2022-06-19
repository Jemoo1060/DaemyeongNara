package com.spring.dm.svImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.ICartDao;
import com.spring.dm.dao.IPrdImgGetDao;
import com.spring.dm.dto.CartDto;
import com.spring.dm.iservice.IDetailPrdService;

@Service("detailPrdService")
public class DetailPrdServiceImpl implements IDetailPrdService{
	
	@Autowired
	ICartDao cartDao;
	
	@Autowired
	IPrdImgGetDao prdImgGetDao;
	
	
	@Override
	public String detailPrdInfoSv(String prdCode, Model model) throws Exception{ // 상세상품정보 출력하기
		
		String imgUrl = prdImgGetDao.prdImgGet(prdCode);
		
		if(imgUrl == null) {
			model.addAttribute("ERR", "해당상품 이미지가 존재하지 않습니다.");

			return "prdDetail";
		}
		model.addAttribute("prdCode", prdCode);
		model.addAttribute("IMGURL", imgUrl);
		
		return "prdDetail";
			
		
	}
	
	@Override
	@Transactional
	public String cartAddSv(String pclCode, CartDto cartDto, Model model) throws Exception{ // 장바구니에 담기
		
		CartDto sltCartDto = cartDao.cartSltone(cartDto);
		
		
		if(sltCartDto != null) {
			model.addAttribute("ERR", "해당상품이 담겨져있습니다.");
			return "redirect:/prdList?mbrCode="+cartDto.getMbrCode()+"&pclCode="+pclCode;
		}
		else {
			
			cartDto.setQy(1); // 고정값
			cartDao.cartInsert(cartDto);
			model.addAttribute("cart", cartDto);
			
			return "redirect:/cartList?mbrCode=" + cartDto.getMbrCode();
		}
		
	}
		
}
