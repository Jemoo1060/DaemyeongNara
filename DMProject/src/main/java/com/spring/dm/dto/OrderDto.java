package com.spring.dm.dto;

public class OrderDto {
	private String orderCode;
	private String mbrCode;
	private String dlvyCode;
	private String orderDate;
	private String setleMth;
	private String recptMth;
	private String progrsSttus;
	private String waybilNum;
	private String hdrlName;
	private String demand;
	private int totalPc;
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getMbrCode() {
		return mbrCode;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public String getDlvyCode() {
		return dlvyCode;
	}
	public void setDlvyCode(String dlvyCode) {
		this.dlvyCode = dlvyCode;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getSetleMth() {
		return setleMth;
	}
	public void setSetleMth(String setleMth) {
		this.setleMth = setleMth;
	}
	public String getRecptMth() {
		return recptMth;
	}
	public void setRecptMth(String recptMth) {
		this.recptMth = recptMth;
	}
	public String getProgrsSttus() {
		return progrsSttus;
	}
	public void setProgrsSttus(String progrsSttus) {
		this.progrsSttus = progrsSttus;
	}
	public String getWaybilNum() {
		return waybilNum;
	}
	public void setWaybilNum(String waybilNum) {
		this.waybilNum = waybilNum;
	}
	public String getHdrlName() {
		return hdrlName;
	}
	public void setHdrlName(String hdrlName) {
		this.hdrlName = hdrlName;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public int getTotalPc() {
		return totalPc;
	}
	public void setTotalPc(int totalPc) {
		this.totalPc = totalPc;
	}
	
	
	@Override
	public String toString() {
		return "OrderDto [orderCode=" + orderCode + ", mbrCode=" + mbrCode + ", dlvyCode=" + dlvyCode + ", orderDate="
				+ orderDate + ", setleMth=" + setleMth + ", recptMth=" + recptMth + ", progrsSttus=" + progrsSttus
				+ ", waybilNum=" + waybilNum + ", hdrlName=" + hdrlName + ", demand=" + demand + ", totalPc=" + totalPc
				+ "]";
	}
	
	
	
	
}
