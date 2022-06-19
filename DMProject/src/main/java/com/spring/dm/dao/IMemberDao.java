package com.spring.dm.dao;

import com.spring.dm.dto.MemberDto;

public interface IMemberDao {
	
	MemberDto mbrSltone(String mbrCode);
	
	void mbrInsert(MemberDto memberDto);
	
	void mbrUpdate(MemberDto memberDto);
	
	void mbrDelete(String mbrCode);

}
