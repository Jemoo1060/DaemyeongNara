package com.spring.dm.iservice;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.dm.dto.MemberDto;

public interface ILoginService {
	String loginCheckSv(MemberDto memberDto, Model model, HttpSession session) throws Exception;
}
