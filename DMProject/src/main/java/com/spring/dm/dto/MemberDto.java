package com.spring.dm.dto;

public class MemberDto {
	private String mbrCode;
	private String mbrId;
	private String mbrPwd;
	private String mbrName;
	private String mbrBrthdy;
	private char mbrSex;
	private String mbrEmail;
	private String mbrTelNo;
	private String mbrGrade;
	private String sbscrbDate;
	private String schulGradeClass;
	
	public String getMbrCode() {
		return mbrCode;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrPwd() {
		return mbrPwd;
	}
	public void setMbrPwd(String mbrPwd) {
		this.mbrPwd = mbrPwd;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getMbrBrthdy() {
		return mbrBrthdy;
	}
	public void setMbrBrthdy(String mbrBrthdy) {
		this.mbrBrthdy = mbrBrthdy;
	}
	public char getMbrSex() {
		return mbrSex;
	}
	public void setMbrSex(char mbrSex) {
		this.mbrSex = mbrSex;
	}
	public String getMbrEmail() {
		return mbrEmail;
	}
	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}
	public String getMbrTelNo() {
		return mbrTelNo;
	}
	public void setMbrTelNo(String mbrTelNo) {
		this.mbrTelNo = mbrTelNo;
	}
	public String getMbrGrade() {
		return mbrGrade;
	}
	public void setMbrGrade(String mbrGrade) {
		this.mbrGrade = mbrGrade;
	}
	public String getSbscrbDate() {
		return sbscrbDate;
	}
	public void setSbscrbDate(String sbscrbDate) {
		this.sbscrbDate = sbscrbDate;
	}

	public String getSchulGradeClass() {
		return schulGradeClass;
	}
	public void setSchulGradeClass(String schulGradeClass) {
		this.schulGradeClass = schulGradeClass;
	}
	
	@Override
	public String toString() {
		return "MemberDto [mbrCode=" + mbrCode + ", mbrId=" + mbrId + ", mbrPwd=" + mbrPwd + ", mbrName=" + mbrName
				+ ", mbrBrthdy=" + mbrBrthdy + ", mbrSex=" + mbrSex + ", mbrEmail=" + mbrEmail + ", mbrTelNo="
				+ mbrTelNo + ", mbrGrade=" + mbrGrade + ", sbscrbDate=" + sbscrbDate + ", schulGradeClass="
				+ schulGradeClass + "]";
	}
	
}
