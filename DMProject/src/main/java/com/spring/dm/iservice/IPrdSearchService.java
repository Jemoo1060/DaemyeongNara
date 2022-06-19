package com.spring.dm.iservice;

import org.springframework.ui.Model;

public interface IPrdSearchService {
	
	String prdSearchSv(String mbrCode, String pageNo, String cutPageNo, String prdName, Model model) throws Exception;

}
