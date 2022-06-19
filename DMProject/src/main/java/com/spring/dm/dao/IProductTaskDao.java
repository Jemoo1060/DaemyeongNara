package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dm.dto.ProductDto;

public interface IProductTaskDao {

	ArrayList<ProductDto> prdNameSearch(String prdName);
	
	ArrayList<ProductDto> allPrdSltmul(HashMap<String, Object> hm);
	
	ArrayList<ProductDto> pclListOutput(HashMap<String, Object> hm);
	
	ArrayList<HashMap<String, Object>> pclListSltmul(String pclCode);
	
	ArrayList<HashMap<String, Object>> prdInfoPrint(String prdCode);
	
	int prdListPaging();
	
	int pclCodeListPaging(String pclCode);
	
	int pclListCount(String pclCode);
	
	ArrayList<HashMap<String, Object>> pclListPaging(HashMap<String, Object> hm);
	
	ArrayList<ProductDto> likeCheck (HashMap<String, Object> hm);
	
	ArrayList<ProductDto> likeCheckCancel (HashMap<String, Object> hm);
}
