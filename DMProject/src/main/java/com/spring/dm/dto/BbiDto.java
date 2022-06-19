package com.spring.dm.dto;

public class BbiDto {
	private char bbiCode;
	private String bbNum;
	private String bbImageCode;
	private String bbImageUrl;
	
	public char getBbiCode() {
		return bbiCode;
	}
	public void setBbiCode(char bbiCode) {
		this.bbiCode = bbiCode;
	}
	public String getBbNum() {
		return bbNum;
	}
	public void setBbNum(String bbNum) {
		this.bbNum = bbNum;
	}
	public String getBbImageCode() {
		return bbImageCode;
	}
	public void setBbImageCode(String bbImageCode) {
		this.bbImageCode = bbImageCode;
	}
	public String getBbImageUrl() {
		return bbImageUrl;
	}
	public void setBbImageUrl(String bbImageUrl) {
		this.bbImageUrl = bbImageUrl;
	}
	@Override
	public String toString() {
		return "BbiDto [bbiCode=" + bbiCode + ", bbNum=" + bbNum + ", bbImageCode=" + bbImageCode + ", bbImageUrl="
				+ bbImageUrl + "]";
	}
}
