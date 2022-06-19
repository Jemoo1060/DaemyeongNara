package com.spring.dm.dao;

import com.spring.dm.dto.BbiDto;

public interface IBbiDao {
	
	BbiDto bbImgSltone(BbiDto bbiDto);
	
	void bbImgInsert(BbiDto bbiDto);
	
	void bbImgUpdate(BbiDto bbiDto);
	
	void bbImgDelete(BbiDto bbiDto);
}
