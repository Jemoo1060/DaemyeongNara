package com.spring.dm.dto;

public class CartDto {
	private String mbrCode;
	private String prdCode;
	private int qy;
	
	public String getMbrCode() {
		return mbrCode;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public int getQy() {
		return qy;
	}
	public void setQy(int qy) {
		this.qy = qy;
	}
	@Override
	public String toString() {
		return "CartDto [mbrCode=" + mbrCode + ", prdCode=" + prdCode + ", qy=" + qy + "]";
	}
}
