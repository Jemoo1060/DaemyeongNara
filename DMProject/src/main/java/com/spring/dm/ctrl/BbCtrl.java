package com.spring.dm.ctrl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dm.dto.BbDto;
import com.spring.dm.dto.BbaDto;
import com.spring.dm.dto.BbiDto;
import com.spring.dm.iservice.IBbService;

@Controller
public class BbCtrl {
	
	@Autowired
	IBbService bbService;
	
	@RequestMapping("info_boardList")
	public String infoboardList(String bbiCode, String pageNo, String cutPageNo, String err, Model model) throws Exception {
		
		return bbService.bbListOutputSv(bbiCode,pageNo, cutPageNo, err, model);
	}
	
	@RequestMapping("info_boardSearchList")
	public String infoboardSearchList(String bbiCode,String bbTitl, String pageNo, String cutPageNo, Model model) throws Exception {
		
		return bbService.bbTitleSearchSv(bbiCode, bbTitl, pageNo, cutPageNo, model);
	}
	
	@RequestMapping("info_boardPrdList")
	public String infoboardPrdList(String bbiCode, String prdCode, String chk, String pageNo, String cutPageNo, Model model) throws Exception {
		
		return bbService.bbPrdListSv(bbiCode, prdCode,chk, pageNo, cutPageNo, model);
	}
	
	
	@RequestMapping("bbInputPage")
	public String bbInputPage(String bbiCode, String prdCode, Model model) throws Exception {
		
		return bbService.bbInputPageSv(bbiCode, prdCode, model);
	}
	
	@RequestMapping("bbInput")
	public String bbInput(BbDto bbDto, BbiDto bbiDto,String prdName, Model model) throws Exception {
		
				
		return bbService.bbInputSv(bbDto,bbiDto,prdName, model);
	}
	
	@RequestMapping("bbPwdCheck")
	public String bbPwdCheck(BbDto bbDto, String writerId, String pageNo,  String cutPageNo, Model model) throws Exception {
		
		return bbService.bbPwdChk(bbDto, writerId, pageNo, cutPageNo, model);
	}
	
	@RequestMapping("info_boardContent")
	public String info_boardContent(BbDto bbDto, String writerId,String chk,String pageNo,  String cutPageNo, Model model) throws Exception {
		
		return bbService.bbOneOutputSv(bbDto,writerId, chk ,pageNo,cutPageNo, model);
	}
	
	@RequestMapping("answerInput")
	public String answerInput(BbaDto bbaDto,BbDto bbdto,String writerId,String chk, Model model) throws Exception {
		
		
		return bbService.answerInputSv(bbaDto,bbdto,writerId,chk, model);
	}
	
	@RequestMapping("answerUpdate")
	public String answerUpdate(BbaDto bbaDto,BbDto bbdto,String writerId,String chk, Model model) throws Exception {
		
		
		return bbService.answerUpdateSv(bbaDto, bbdto,writerId,chk, model);
	}
	
	@RequestMapping("answerDelete")
	public String answerDelete(String answerNum,BbDto bbdto,String writerId,String chk, Model model) throws Exception {
		
		
		return bbService.answerDeleteSv(answerNum, bbdto,writerId,chk, model);
	}
	
	@RequestMapping("bbUpdatePage")
	public String bbUpdatePage(BbDto bbDto,String pageNo, String cutPageNo, Model model) throws Exception {
		
		return bbService.bbDefaultInfoSv(bbDto, pageNo, cutPageNo, model);
	}
	
	@RequestMapping("bbUpdate")
	public String bbUpdate(BbDto bbDto,BbiDto bbiDto, String writerId, String pageNo, String cutPageNo, Model model) throws Exception {
		
		return bbService.bbModifySv(bbDto, bbiDto, writerId, pageNo,cutPageNo, model);
	}
	
	@RequestMapping("bbDelete")
	public String bbDelete(BbDto bbDto, Model model) throws Exception {
		
		return bbService.bbRemoveSv(bbDto, model);
	}
	
	

}
