package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dm.dto.MemberDto;

public interface IMemberTaskDao {
	
	MemberDto idInfoCheck(String mbrId);
	
	ArrayList<MemberDto> allMbrSltmul(HashMap<String, Object> hm);
	
	int allMbrPaging();
	
	ArrayList<MemberDto> mbrGradeSltmul(HashMap<String, Object> hm);

	int mbrGradePaging(String mbrGrade);
}
