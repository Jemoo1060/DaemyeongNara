package com.spring.dm.dao;

import com.spring.dm.dto.BbDto;

public interface IBbDao {
	
	BbDto bbSltone(BbDto bbDto);
	
	void bbInsert(BbDto bbDto);
	
	void bbUpdate(BbDto bbDto);
	
	void bbDelete(BbDto bbDto);
	
}
