package com.spring.dm.dto;

public class OrderDetailDto {
	private String orderCode;
	private String prdCode;
	private int detailOrderQy;
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public int getDetailOrderQy() {
		return detailOrderQy;
	}
	public void setDetailOrderQy(int detailOrderQy) {
		this.detailOrderQy = detailOrderQy;
	}
	
	@Override
	public String toString() {
		return "OrderDetailDto [orderCode=" + orderCode + ", prdCode=" + prdCode + ", detailOrderQy=" + detailOrderQy
				+ "]";
	}
	
	
}
