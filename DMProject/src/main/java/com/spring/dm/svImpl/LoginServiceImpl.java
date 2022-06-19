package com.spring.dm.svImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMemberTaskDao;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.ILoginService;

@Transactional
@Service("loginService")
public class LoginServiceImpl implements ILoginService {
	
	@Autowired
	private IMemberTaskDao mtd;

	@Override
	public String loginCheckSv(MemberDto memberDto, Model model, HttpSession session) throws Exception {
		String id = memberDto.getMbrId();
		String pw = memberDto.getMbrPwd();
		
		MemberDto sltMemberDto = mtd.idInfoCheck(id); 
		
		if(sltMemberDto == null) {
			model.addAttribute("ERR", "존재하지 않는 아이디입니다.");
			return "login";	
		}
		
		if("0000".equals(sltMemberDto.getMbrGrade())) {
			model.addAttribute("ERR", "탈퇴된 계정입니다.");
			return "login";
		}
		
		if(sltMemberDto.getMbrPwd().equals(pw)) {
			String code = sltMemberDto.getMbrCode();
			String grade = sltMemberDto.getMbrGrade();
			session.setAttribute("mbrId", id);
			session.setAttribute("mbrCode", code);
			session.setAttribute("mbrGrade", grade);
			
			return "redirect:/main";
		}
		
		model.addAttribute("ERR", "잘못된 비밀번호입니다.");
		return "login";
	}
}
