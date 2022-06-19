package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dm.dto.BbDto;

public interface IBbTaskDao {
	
	ArrayList<HashMap<String, Object>> bbSltmul(HashMap<String, Object> hm);
	
	int bbPaging(String bbiCode);
	
	ArrayList<HashMap<String, Object>> bbTitleSltmul(HashMap<String, Object> hm);
	
	int bbTitlePaging(HashMap<String, Object> hm);
	
	ArrayList<HashMap<String, Object>> bbPrdSltmul(HashMap<String, Object> hm);
	
	int bbPrdPaging(HashMap<String, Object> hm);
	
	HashMap<String, Object> bbInfoPrint(BbDto bbDto);
	
	ArrayList<HashMap<String, Object>> bbaInfoPrint(BbDto bbDto);
	
	void bbRdcntUpdate(BbDto bbDto);
	
	ArrayList<HashMap<String, Object>> prdNameSearch(String prdName);
	
	String bbPwdCheck(BbDto bbDto);
}
