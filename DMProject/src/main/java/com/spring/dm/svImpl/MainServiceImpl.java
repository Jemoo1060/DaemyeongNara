package com.spring.dm.svImpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.dm.dao.IProductImageTaskDao;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.iservice.IMainService;

@Service("mainService")
public class MainServiceImpl implements IMainService {
	
	@Autowired
	IProductImageTaskDao productImageTaskDao;

	@Override
	public String mainPageSv(String prdNameErr,Model model) throws Exception {
		
		ArrayList<ProductImageDto> bestPrdList = productImageTaskDao.bestPrdImgGet();
		ArrayList<HashMap<String, Object>> hotList = productImageTaskDao.hotNewPrdSltmul("0203");
		ArrayList<HashMap<String, Object>> newList = productImageTaskDao.hotNewPrdSltmul("0204");
		
		ArrayList<ProductDto> hotPrdList = new ArrayList<>();
		ArrayList<ProductImageDto> hotPrdImgList = new ArrayList<>();
		
		ArrayList<ProductDto> newPrdList = new ArrayList<>();
		ArrayList<ProductImageDto> newPrdImgList = new ArrayList<>();
		
		for(int i = 0; i < hotList.size(); i++) {
			HashMap<String, Object> hm = hotList.get(i);
			ProductDto productDto = (ProductDto)hm.get("product");
			ProductImageDto productImageDto = (ProductImageDto)hm.get("productImage");
			hotPrdList.add(productDto);
			hotPrdImgList.add(productImageDto);
		}
		
		for(int i = 0; i < newList.size(); i++) {
			HashMap<String, Object> hm = newList.get(i);
			ProductDto productDto = (ProductDto)hm.get("product");
			ProductImageDto productImageDto = (ProductImageDto)hm.get("productImage");
			newPrdList.add(productDto);
			newPrdImgList.add(productImageDto);
		}
		
		System.out.println(hotPrdList);
		

		model.addAttribute("prdNameErr", prdNameErr);	
		model.addAttribute("bestPrdList", bestPrdList);
		model.addAttribute("hotPrdList", hotPrdList);
		model.addAttribute("hotPrdImgList", hotPrdImgList);
		model.addAttribute("newPrdList", newPrdList);
		model.addAttribute("newPrdImgList", newPrdImgList);

		return "main";
	}
}