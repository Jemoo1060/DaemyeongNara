package com.spring.dm.dto;

public class ProductImageDto {
	private String prdCode;
	private String prdImageCode;
	private String prdImageUrl;
	
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public String getPrdImageCode() {
		return prdImageCode;
	}
	public void setPrdImageCode(String prdImageCode) {
		this.prdImageCode = prdImageCode;
	}
	public String getPrdImageUrl() {
		return prdImageUrl;
	}
	public void setPrdImageUrl(String prdImageUrl) {
		this.prdImageUrl = prdImageUrl;
	}
	@Override
	public String toString() {
		return "ProductImageDto [prdCode=" + prdCode + ", prdImageCode=" + prdImageCode + ", prdImageUrl=" + prdImageUrl
				+ "]";
	}
	
	

}
