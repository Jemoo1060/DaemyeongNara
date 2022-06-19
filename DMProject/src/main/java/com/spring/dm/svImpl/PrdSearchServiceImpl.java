package com.spring.dm.svImpl;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.dm.dao.IProductImageTaskDao;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.iservice.IPrdSearchService;

@Service("prdSearchService")
public class PrdSearchServiceImpl implements IPrdSearchService {

	@Autowired
	IProductImageTaskDao productImageTaskDao;

	@Override
	public String prdSearchSv(String mbrCode, String pageNo, String cutPageNo, String prdName, Model model) throws Exception {
		
		String subPrdName = "%"+prdName+"%";
	
		
		int nPageNo;  // 클릭할때
		int nCutPageNo; // 1,6,11
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 6;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("STARTROW", startRow);
		hm.put("MAXROWS", maxRows);
		hm.put("prdName", subPrdName);
		
		ArrayList<HashMap<String, Object>> list = productImageTaskDao.prdNameSearchPaging(hm);
		
		ArrayList<ProductDto> prdList = new ArrayList<>();
		ArrayList<ProductImageDto> prdImgList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hmm = list.get(i);
			ProductDto productDto = (ProductDto)hmm.get("product");
			ProductImageDto productImageDto = (ProductImageDto)hmm.get("productImage");
			prdList.add(productDto);
			prdImgList.add(productImageDto);	
		}
		
		if(list.size() == 0) {
			model.addAttribute("prdNameErr", "제품이 존재하지 않습니다.");
			
			return "redirect:/main";
		}
		
		int total = productImageTaskDao.prdNameSearchCount(subPrdName);
		
		int maxPage = (total%MAX_ROWS == 0)? total/MAX_ROWS : total/MAX_ROWS+1;
		
		model.addAttribute("prdList", prdList);
		model.addAttribute("prdImgList", prdImgList);
		model.addAttribute("PRD",prdList.get(0));
		model.addAttribute("IMAGE",prdImgList.get(0));
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo",nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("prdName",prdName);
		
		return "prdSearchList";
	}

}
