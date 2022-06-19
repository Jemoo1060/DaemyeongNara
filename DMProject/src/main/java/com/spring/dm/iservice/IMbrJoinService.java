package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.MemberDto;

public interface IMbrJoinService {
	String mbrJoinSv(MemberDto memberDto, Model model) throws Exception;
	String idDuplCheckSv(String mbrId, Model model) throws Exception;
}
