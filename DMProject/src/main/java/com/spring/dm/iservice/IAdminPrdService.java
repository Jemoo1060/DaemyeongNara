package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.ProductDto;
import com.spring.dm.dto.ProductImageDto;

public interface IAdminPrdService {
	String adPrdAddSv(ProductDto productDto, ProductImageDto productImageDto, Model model) throws Exception;
	String adPrdInfoSv(String prdCode, Model model) throws Exception;
	String adPrdImgAddSv(ProductImageDto productImageDto, Model model) throws Exception;
	String adPrdImgRemoveSv(ProductImageDto productImageDto, Model model) throws Exception;
	String adPrdModifySv(ProductDto productDto, Model model) throws Exception;
	String adPrdRemoveSv(String prdCode, Model model) throws Exception;
	String adPrdListSv(String pageNo, String cutPageNo,String err, Model model) throws Exception;
	String adPclListSv(String pageNo, String cutPageNo,String err, String pclCode, Model model) throws Exception;
}
