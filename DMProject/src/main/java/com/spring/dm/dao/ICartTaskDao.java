package com.spring.dm.dao;

import java.util.ArrayList;

import com.spring.dm.dto.CartDto;
import com.spring.dm.dto.CartListDto;

public interface ICartTaskDao {

	ArrayList<CartListDto> mbrCartSltmul(String mbrCode);
	
	void cartPrdTotalDelete(String mbrCode);
	
	ArrayList<CartDto> cartSltmul(String mbrCode);
	
}
