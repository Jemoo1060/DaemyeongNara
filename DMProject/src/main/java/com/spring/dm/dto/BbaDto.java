package com.spring.dm.dto;

public class BbaDto {
	private String answerNum;
	private char bbiCode;
	private String bbNum;
	private String mbrCode;
	private String answerDate;
	private String answerCn;
	
	public String getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(String answerNum) {
		this.answerNum = answerNum;
	}
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
	public String getMbrCode() {
		return mbrCode;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getAnswerCn() {
		return answerCn;
	}
	public void setAnswerCn(String answerCn) {
		this.answerCn = answerCn;
	}
	@Override
	public String toString() {
		return "BbaDto [answerNum=" + answerNum + ", bbiCode=" + bbiCode + ", bbNum=" + bbNum + ", mbrCode=" + mbrCode
				+ ", answerDate=" + answerDate + ", answerCn=" + answerCn + "]";
	}
	
	
	
	
	
}
