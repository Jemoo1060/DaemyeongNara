package com.spring.dm.dao;

import com.spring.dm.dto.ProductImageDto;

public interface IProductImageDao {
	
	ProductImageDto prdImgSltone(ProductImageDto productImageDto);
	
	void prdImgInsert(ProductImageDto productImageDto);
	
	void prdImgDelete(ProductImageDto productImageDto);
	
}
