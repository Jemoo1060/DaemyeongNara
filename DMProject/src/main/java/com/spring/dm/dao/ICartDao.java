package com.spring.dm.dao;

import com.spring.dm.dto.CartDto;

public interface ICartDao {
	
	CartDto cartSltone(CartDto cartDto);
	
	void cartInsert(CartDto cartDto);
	
	void cartUpdate(CartDto cartDto);
	
	void cartDelete(CartDto cartDto);

}
