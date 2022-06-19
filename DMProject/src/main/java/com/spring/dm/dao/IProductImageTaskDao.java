package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dm.dto.ProductImageDto;

public interface IProductImageTaskDao {
	ArrayList<ProductImageDto> bestPrdImgGet();
	
	int prdNameSearchCount(String prdName); //
	
	ArrayList<HashMap<String, Object>> prdNameSearchPaging(HashMap<String, Object> hm); //
	
	ArrayList<HashMap<String, Object>> hotNewPrdSltmul(String prdSe);
	
}
