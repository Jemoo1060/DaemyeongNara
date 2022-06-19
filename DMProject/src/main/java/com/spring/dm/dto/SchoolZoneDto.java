package com.spring.dm.dto;

public class SchoolZoneDto {
	private String schulCode;
	private String schulMsg;
	
	public String getSchulCode() {
		return schulCode;
	}
	public void setSchulCode(String schulCode) {
		this.schulCode = schulCode;
	}
	public String getSchulMsg() {
		return schulMsg;
	}
	public void setSchulMsg(String schulMsg) {
		this.schulMsg = schulMsg;
	}
	@Override
	public String toString() {
		return "SchoolZoneDto [schulCode=" + schulCode + ", schulMsg=" + schulMsg + "]";
	}
	
	
}
