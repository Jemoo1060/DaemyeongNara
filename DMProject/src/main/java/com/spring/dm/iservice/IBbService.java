package com.spring.dm.iservice;


import org.springframework.ui.Model;

import com.spring.dm.dto.BbDto;
import com.spring.dm.dto.BbaDto;
import com.spring.dm.dto.BbiDto;

public interface IBbService {
	
	String bbListOutputSv(String bbiCode, String pageNo, String cutPageNo,String err, Model model) throws Exception;
	
	String bbTitleSearchSv(String bbiCode, String bbTitl,String pageNo, String cutPageNo, Model model) throws Exception;
	
	String bbPrdListSv(String bbiCode,String prdCode, String chk,String pageNo, String cutPageNo, Model model) throws Exception;
	
	String bbInputPageSv(String bbiCode, String prdCode, Model model) throws Exception;
		
	String bbInputSv(BbDto bbDto, BbiDto bbiDto,String prdName, Model model) throws Exception;
	
	String bbPwdChk(BbDto bbDto,String writerId, String pageNo, String cutPageNo, Model model) throws Exception;
	
	String bbOneOutputSv(BbDto bbDto,String writerId,String chk,String pageNo, String cutPageNo, Model model) throws Exception;
	
	String answerInputSv(BbaDto bbaDto,BbDto bbdto,String writerId,String chk, Model model) throws Exception;
	
	String answerUpdateSv(BbaDto bbaDto,BbDto bbdto,String writerId,String chk, Model model) throws Exception;
	
	String answerDeleteSv(String answerNum,BbDto bbdto,String writerId,String chk, Model model) throws Exception;
	
	String bbDefaultInfoSv(BbDto bbDto,String pageNo, String cutPageNo, Model model) throws Exception;
	
	String bbModifySv(BbDto bbDto, BbiDto bbiDto, String writerId, String pageNo, String cutPageNo, Model model) throws Exception;
	
	String bbImgReMoveSv(BbiDto bbiDto, Model model) throws Exception;
	
	String bbImgAddSv(BbiDto bbiDto, Model model) throws Exception;
	
	String bbRemoveSv(BbDto bbDto, Model model) throws Exception;
	
	String bbPclSearchSv(String prdName, Model model) throws Exception;
}
