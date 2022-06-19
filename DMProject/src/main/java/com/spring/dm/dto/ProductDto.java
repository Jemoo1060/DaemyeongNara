package com.spring.dm.dto;

public class ProductDto {
	private String prdCode;
	private String pclCode;
	private String prdName;
	private int prdPc;
	private int prdInvntry;
	private String prdCn;
	private String prdRegistDate;
	private char prdRecomendAt;
	private int prdRecomendCnt;
	private String prdSe;
	
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public String getPclCode() {
		return pclCode;
	}
	public void setPclCode(String pclCode) {
		this.pclCode = pclCode;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getPrdPc() {
		return prdPc;
	}
	public void setPrdPc(int prdPc) {
		this.prdPc = prdPc;
	}
	public String getPrdCn() {
		return prdCn;
	}
	public void setPrdCn(String prdCn) {
		this.prdCn = prdCn;
	}
	public String getPrdRegistDate() {
		return prdRegistDate;
	}
	public void setPrdRegistDate(String prdRegistDate) {
		this.prdRegistDate = prdRegistDate;
	}
	public char getPrdRecomendAt() {
		return prdRecomendAt;
	}
	public void setPrdRecomendAt(char prdRecomendAt) {
		this.prdRecomendAt = prdRecomendAt;
	}
	public int getPrdRecomendCnt() {
		return prdRecomendCnt;
	}
	public void setPrdRecomendCnt(int prdRecomendCnt) {
		this.prdRecomendCnt = prdRecomendCnt;
	}
	public String getPrdSe() {
		return prdSe;
	}
	public void setPrdSe(String prdSe) {
		this.prdSe = prdSe;
	}
	public int getPrdInvntry() {
		return prdInvntry;
	}
	public void setPrdInvntry(int prdInvntry) {
		this.prdInvntry = prdInvntry;
	}
	@Override
	public String toString() {
		return "ProductDto [prdCode=" + prdCode + ", pclCode=" + pclCode + ", prdName=" + prdName + ", prdPc=" + prdPc
				+ ", prdInvntry=" + prdInvntry + ", prdCn=" + prdCn + ", prdRegistDate=" + prdRegistDate
				+ ", prdRecomendAt=" + prdRecomendAt + ", prdRecomendCnt=" + prdRecomendCnt + ", prdSe=" + prdSe + "]";
	}

	
	

}
