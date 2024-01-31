package com.jang.biz.model;

public class Processing {
	private int pno;
	private String ono;
	private String reception;
	private String paymentcom;
	private String deliverycom;
	private String cancel;
	private int orderno;
	private int cancelorcnt;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getReception() {
		return reception;
	}
	public void setReception(String reception) {
		this.reception = reception;
	}
	public String getPaymentcom() {
		return paymentcom;
	}
	public void setPaymentcom(String paymentcom) {
		this.paymentcom = paymentcom;
	}
	public String getDeliverycom() {
		return deliverycom;
	}
	public void setDeliverycom(String deliverycom) {
		this.deliverycom = deliverycom;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public int getCancelorcnt() {
		return cancelorcnt;
	}
	public void setCancelorcnt(int cancelorcnt) {
		this.cancelorcnt = cancelorcnt;
	}
	
}
