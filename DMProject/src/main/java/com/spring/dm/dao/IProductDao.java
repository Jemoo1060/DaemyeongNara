package com.spring.dm.dao;

import com.spring.dm.dto.ProductDto;

public interface IProductDao {
	
	ProductDto prdSltOne(String prdCode);
	
	void prdInsert(ProductDto productDto);
	
	void prdUpdate(ProductDto productDto);
	
	void prdDelete(String prdCode);
	
}
