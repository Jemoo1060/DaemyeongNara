package com.spring.dm.dto;

public class BbDto {
	private char bbiCode;
	private String bbNum;
	private String mbrCode;
	private String prdCode;
	private String bbTitl;
	private String bbCn;
	private int bbRdcnt;
	private String bbRegistDate;
	private String bbPwd;
	private char bbOthbcAt;
	
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
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public String getBbTitl() {
		return bbTitl;
	}
	public void setBbTitl(String bbTitl) {
		this.bbTitl = bbTitl;
	}
	public String getBbCn() {
		return bbCn;
	}
	public void setBbCn(String bbCn) {
		this.bbCn = bbCn;
	}
	public int getBbRdcnt() {
		return bbRdcnt;
	}
	public void setBbRdcnt(int bbRdcnt) {
		this.bbRdcnt = bbRdcnt;
	}
	public String getBbRegistDate() {
		return bbRegistDate;
	}
	public void setBbRegistDate(String bbRegistDate) {
		this.bbRegistDate = bbRegistDate;
	}
	public String getBbPwd() {
		return bbPwd;
	}
	public void setBbPwd(String bbPwd) {
		this.bbPwd = bbPwd;
	}
	public char getBbOthbcAt() {
		return bbOthbcAt;
	}
	public void setBbOthbcAt(char bbOthbcAt) {
		this.bbOthbcAt = bbOthbcAt;
	}
	@Override
	public String toString() {
		return "BbDto [bbiCode=" + bbiCode + ", bbNum=" + bbNum + ", mbrCode=" + mbrCode + ", prdCode=" + prdCode
				+ ", bbTitl=" + bbTitl + ", bbCn=" + bbCn + ", bbRdcnt=" + bbRdcnt + ", bbRegistDate=" + bbRegistDate
				+ ", bbPwd=" + bbPwd + ", bbOthbcAt=" + bbOthbcAt + "]";
	}
	
	
	
}
