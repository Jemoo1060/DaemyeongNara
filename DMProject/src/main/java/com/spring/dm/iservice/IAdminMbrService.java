package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.MemberDto;

public interface IAdminMbrService {
	String adMbrListSv(String pageNo, String cutPageNo, String err, Model model) throws Exception;
	String adMbrDetailSv(String mbrCode, Model model) throws Exception;
	String adMbrListGradeSv(String pageNo, String cutPageNo, String err, String mbrGrade, Model model) throws Exception;
	String adMbrModifySv(MemberDto memberDto, Model model) throws Exception;
}
