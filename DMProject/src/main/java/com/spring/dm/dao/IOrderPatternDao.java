package com.spring.dm.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface IOrderPatternDao {
	
	ArrayList<HashMap<String, Object>> prdDirectOrder(String prdCode);
	
	ArrayList<HashMap<String, Object>> cartOrderSltmul(String mbrCode);

}
