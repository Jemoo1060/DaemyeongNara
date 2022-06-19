package com.spring.dm.svImpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMemberDao;
import com.spring.dm.dao.IMemberTaskDao;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.IAdminMbrService;

@Service("adminMbrService")
public class AdminMbrServiceImpl implements IAdminMbrService {

	@Autowired
	private IMemberDao memberDao;
	
	@Autowired
	private IMemberTaskDao memberTaskDao;
	
	@Override
	public String adMbrListSv(String pageNo, String cutPageNo, String err, Model model) throws Exception {
		int nPageNo;
		int nCutPageNo;
		int mbrGradeBool = 1;
		
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
		
		ArrayList<MemberDto> al = memberTaskDao.allMbrSltmul(hm);
		
		int maxMbr = memberTaskDao.allMbrPaging();
		int maxPage = (maxMbr%MAX_ROWS == 0)?maxMbr/MAX_ROWS : maxMbr/MAX_ROWS+1; 
		
		ArrayList<String> alGrade = new ArrayList<String>();
		String grade = "";
		
		for(int i = 0; i < al.size(); i++) {
			MemberDto memberDto = al.get(i);
			
			String mbrGrade = memberDto.getMbrGrade();
					
			switch(mbrGrade) {
			case "0101":
				grade = "관리자";
				break;
			case "0102":
				grade = "일반회원";
				break;
			case "0103":
				grade = "학교회원";
				break;
			case "0104":
				grade = "교사";
				break;
			}
			
			alGrade.add(grade);
		}
		
		model.addAttribute("mbrGradeBool", mbrGradeBool);
		model.addAttribute("alGrade", alGrade);
		model.addAttribute("mbrAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminMbrManage";
	}
	
	@Override
	public String adMbrDetailSv(String mbrCode, Model model) throws Exception {
		MemberDto memberDto = memberDao.mbrSltone(mbrCode);
		
		if(memberDto == null) {
			return "redirect:/mbrManage";
		}
		
		model.addAttribute("memberDto", memberDto);
		
		return "mbrUpdate";		
	}
	
	@Override
	public String adMbrModifySv(MemberDto memberDto, Model model) throws Exception {
		String mbrCode = memberDto.getMbrCode();
		String mbrPwd = memberDto.getMbrPwd();
		String schulGradeClass = memberDto.getSchulGradeClass();
		String mbrGrade = memberDto.getMbrGrade();
		
		MemberDto sltMemberDto = memberDao.mbrSltone(mbrCode);

		if(sltMemberDto == null) {
			model.addAttribute("ERR", "수정할 회원이 없습니다.");
			return "redirect:/mbrManage";
		}
		
		sltMemberDto.setMbrPwd(mbrPwd);
		sltMemberDto.setSchulGradeClass(schulGradeClass);
		sltMemberDto.setMbrGrade(mbrGrade);
		
		memberDao.mbrUpdate(sltMemberDto);
		
		return "redirect:/mbrManage";
	}
	
	@Override
	public String adMbrListGradeSv(String pageNo, String cutPageNo, String err, String mbrGrade, Model model) throws Exception {
		int nPageNo;
		int nCutPageNo;
		int mbrGradeBool = 2;
		
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
		hm.put("mbrGrade", mbrGrade);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		ArrayList<MemberDto> al = memberTaskDao.mbrGradeSltmul(hm);
		
		int maxGrade = memberTaskDao.mbrGradePaging(mbrGrade);
		
		int maxPage = (maxGrade%MAX_ROWS == 0)?maxGrade/MAX_ROWS : maxGrade/MAX_ROWS+1;
		
		
		ArrayList<String> alGrade = new ArrayList<String>();
		String grade = "";
		
		for(int i = 0; i < al.size(); i++) {
			MemberDto memberDto = al.get(i);
			
			String mg = memberDto.getMbrGrade();
					
			switch(mg) {
			case "0101":
				grade = "관리자";
				break;
			case "0102":
				grade = "일반회원";
				break;
			case "0103":
				grade = "학교회원";
				break;
			case "0104":
				grade = "교사";
				break;
			}
			
			alGrade.add(grade);
		}
		
		model.addAttribute("mbrGradeBool", mbrGradeBool);
		model.addAttribute("alGrade", alGrade);
		model.addAttribute("mbrAl", al);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		return "adminMbrManage";
	}
}
