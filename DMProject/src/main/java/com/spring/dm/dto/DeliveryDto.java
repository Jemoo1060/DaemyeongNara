package com.spring.dm.dto;

public class DeliveryDto {
	private String dlvyCode;
	private String recptName;
	private String dlvyCttpc;
	private String dlvyZip;
	private String dlvyDetailAdres;
	private OrderDto orderDto;
	
	public OrderDto getOrderDto() {
		return orderDto;
	}
	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}
	
	public String getDlvyCode() {
		return dlvyCode;
	}
	public void setDlvyCode(String dlvyCode) {
		this.dlvyCode = dlvyCode;
	}
	public String getRecptName() {
		return recptName;
	}
	public void setRecptName(String recptName) {
		this.recptName = recptName;
	}
	public String getDlvyCttpc() {
		return dlvyCttpc;
	}
	public void setDlvyCttpc(String dlvyCttpc) {
		this.dlvyCttpc = dlvyCttpc;
	}
	public String getDlvyZip() {
		return dlvyZip;
	}
	public void setDlvyZip(String dlvyZip) {
		this.dlvyZip = dlvyZip;
	}
	public String getDlvyDetailAdres() {
		return dlvyDetailAdres;
	}
	public void setDlvyDetailAdres(String dlvyDetailAdres) {
		this.dlvyDetailAdres = dlvyDetailAdres;
	}
	
	@Override
	public String toString() {
		return "DeliveryDto [dlvyCode=" + dlvyCode + ", recptName=" + recptName + ", dlvyCttpc=" + dlvyCttpc
				+ ", dlvyZip=" + dlvyZip + ", dlvyDetailAdres=" + dlvyDetailAdres + "]";
	}
	
	
	
}
