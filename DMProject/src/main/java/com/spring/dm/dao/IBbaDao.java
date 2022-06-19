package com.spring.dm.dao;

import com.spring.dm.dto.BbaDto;


public interface IBbaDao {
	BbaDto answerSltone(String answerNum);
	
	void answerInsert(BbaDto bbaDto);
	
	void answerUpdate(BbaDto bbaDto);
	
	void answerDelete(String answerNum);
}
