package com.spring.dm.svImpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMaxDao;
import com.spring.dm.dao.IProductDao;
import com.spring.dm.dao.IProductImageDao;
import com.spring.dm.dao.IProductTaskDao;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;
import com.spring.dm.iservice.IAdminPrdService;

@Transactional
@Service("adminPrdService")
public class AdminPrdServiceImpl implements IAdminPrdService {

	@Autowired
	private IProductDao productDao;
	
	@Autowired
	private IProductImageDao productImageDao;
	
	@Autowired
	private IProductTaskDao productTaskDao;
	
	@Autowired
	private IMaxDao maxDao;
	
	
	@Override
	public String adPrdAddSv(ProductDto productDto, ProductImageDto productImageDto, Model model) {
		String prdCode = "";
		
		if(maxDao.maxPrdCode() == null){
			prdCode = "1";
		} else {
			prdCode = String.valueOf((Integer.parseInt(maxDao.maxPrdCode()) + 1));	
		}
		
		ProductDto sltProductDto = productDao.prdSltOne(prdCode);
		
		if(sltProductDto != null) {
			model.addAttribute("ERR", "이미 존재하는 제품입니다.");
			return "admin";
		}
		
		productDto.setPrdCode(prdCode);
		productImageDto.setPrdCode(prdCode);
		
		ProductImageDto sltProductImageDto = productImageDao.prdImgSltone(productImageDto);
		
		if(sltProductImageDto != null) {
			model.addAttribute("ERR", "이미 존재하는 제품이미지입니다.");
			return "admin";
		}
		
		productDao.prdInsert(productDto);
		productImageDao.prdImgInsert(productImageDto);
		
		return "redirect:/prdManage";
	}
	
	@Override
	public String adPrdInfoSv(String prdCode, Model model) {
		ArrayList<HashMap<String, Object>> al = productTaskDao.prdInfoPrint(prdCode);
		
		if(al.size() == 0) {
			model.addAttribute("ERR", "제품이 존재하지 않습니다.");
			return "redirect:/prdManage";
		}
		
		ArrayList<ProductImageDto> alPi = new ArrayList<ProductImageDto>();
		ProductDto productDto = new ProductDto();
		ProductImageDto productImageDto = new ProductImageDto();
		
		for(int i = 0; i < al.size(); i++) {
			HashMap<String, Object> hm = al.get(i);
			productDto = (ProductDto)hm.get("product");
			productImageDto = (ProductImageDto)hm.get("productImage");
	
			alPi.add(productImageDto);
		}

		model.addAttribute("productDto", productDto);
		model.addAttribute("al", alPi);
		
		return "adminPrdModify";
	}
	
	@Override
	public String adPrdImgAddSv(ProductImageDto productImageDto, Model model) {
		ProductImageDto sltProductImageDto = productImageDao.prdImgSltone(productImageDto);
		if(sltProductImageDto != null) {
			model.addAttribute("ERR", "존재하는 제품이미지 입니다.");
			return "noJSON";
		}
		
		productImageDao.prdImgInsert(productImageDto);
		
		return "JSON";
	}
	
	@Override
	public String adPrdImgRemoveSv(ProductImageDto productImageDto, Model model) {
		ProductImageDto sltProductImageDto = productImageDao.prdImgSltone(productImageDto);
		if(sltProductImageDto == null) {
			model.addAttribute("ERR", "제품이미지가 존재하지 않습니다.");
			return "noJSON";
		}
		
		productImageDao.prdImgDelete(productImageDto);
		
		return "JSON";
	}
	
	@Override
	public String adPrdModifySv(ProductDto productDto, Model model) {
		String prdCode = productDto.getPrdCode();
		String prdCn = productDto.getPrdCn();
		String prdSe = productDto.getPrdSe();
		String prdName = productDto.getPrdName();
		String pclCode = productDto.getPclCode();
		int prdInvntry = productDto.getPrdInvntry();
		int prdPc = productDto.getPrdPc();
		
		ProductDto sltProductDto = productDao.prdSltOne(prdCode);
		if(sltProductDto == null) {
			model.addAttribute("ERR", "제품이 존재하지 않습니다.");
			return "redirect:/prdManage";
		}
		
		sltProductDto.setPrdCn(prdCn);
		sltProductDto.setPrdName(prdName);
		sltProductDto.setPclCode(pclCode);
		sltProductDto.setPrdPc(prdPc);
		sltProductDto.setPrdInvntry(prdInvntry);
		sltProductDto.setPrdSe(prdSe);
		
		productDao.prdUpdate(sltProductDto);
		
		return "redirect:/prdManage";
	}
	
	@Override
	public String adPrdRemoveSv(String prdCode, Model model) {
		
		ProductDto sltProductDto = productDao.prdSltOne(prdCode);
		if(sltProductDto == null) {
			model.addAttribute("ERR", "제품이 존재하지 않습니다.");
			return "redirect:/prdManage";
		}
		
		sltProductDto.setPrdSe("0205");
		sltProductDto.setPrdInvntry(0);
		
		productDao.prdUpdate(sltProductDto);
		
		return "redirect:/prdManage";
	}
	
	@Override
	public String adPrdListSv(String pageNo, String cutPageNo,String err, Model model) {
		int nPageNo;
		int nCutPageNo;
		int prdGradeBool = 1;
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 3;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		ArrayList<ProductDto> al = productTaskDao.allPrdSltmul(hm);
		
		int maxPrd = productTaskDao.prdListPaging();
		
		int maxPage = (maxPrd%MAX_ROWS == 0)?maxPrd/MAX_ROWS : maxPrd/MAX_ROWS+1; 
		
		if(al.size() == 0) {
			model.addAttribute("ERR", "제품이 존재하지 않습니다.");
			return "admin_prd_manage";
		}
		
		model.addAttribute("prdGradeBool", prdGradeBool);
		model.addAttribute("prdAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminPrdManage";
	}
	
	@Override
	public String adPclListSv(String pageNo, String cutPageNo,String err, String pclCode, Model model) {
		int nPageNo;
		int nCutPageNo;
		int prdGradeBool = 2;
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 3;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("pclCode", pclCode);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		ArrayList<ProductDto> al = productTaskDao.pclListOutput(hm);
		
		int maxPcl = productTaskDao.pclCodeListPaging(pclCode);
		
		int maxPage = (maxPcl%MAX_ROWS == 0)?maxPcl/MAX_ROWS : maxPcl/MAX_ROWS+1; 
		
		model.addAttribute("prdGradeBool", prdGradeBool);
		model.addAttribute("prdAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminPrdManage";
	}
}
