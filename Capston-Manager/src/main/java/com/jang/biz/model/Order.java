package com.jang.biz.model;

import java.util.List;

public class Order {
	private int ono;
	private String colno;
	private String regdate;
	private int orderno;
	private String kitname;
	private String name;
	private String payment;
	private int kitprice;
	private String orderstate;
	private String waybilno;
	private int totalcnt;
	private String senddate;
	private String sendername;
	private String bankname;
	private String memberid;
	private int kitstock;
	private String totalcost;
	private int orderstock;
	private int kno;
	private int neworcnt;
	private int ordercnt;
	private int count;
	private int totalprice;
	private String regdate1;
	private String regdate2;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(int ordercnt) {
		this.ordercnt = ordercnt;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getColno() {
		return colno;
	}
	public void setColno(String colno) {
		this.colno = colno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getKitname() {
		return kitname;
	}
	public void setKitname(String kitname) {
		this.kitname = kitname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getKitprice() {
		return kitprice;
	}
	public void setKitprice(int kitprice) {
		this.kitprice = kitprice;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public String getWaybilno() {
		return waybilno;
	}
	public void setWaybilno(String waybilno) {
		this.waybilno = waybilno;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getSendername() {
		return sendername;
	}
	public void setSendername(String sendername) {
		this.sendername = sendername;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getKitstock() {
		return kitstock;
	}
	public void setKitstock(int kitstock) {
		this.kitstock = kitstock;
	}
	public String getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(String totalcost) {
		this.totalcost = totalcost;
	}
	public int getOrderstock() {
		return orderstock;
	}
	public void setOrderstock(int orderstock) {
		this.orderstock = orderstock;
	}
	public List<AttachImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	public int getNeworcnt() {
		return neworcnt;
	}
	public void setNeworcnt(int neworcnt) {
		this.neworcnt = neworcnt;
	}
	public String getRegdate1() {
		return regdate1;
	}
	public void setRegdate1(String regdate1) {
		this.regdate1 = regdate1;
	}
	public String getRegdate2() {
		return regdate2;
	}
	public void setRegdate2(String regdate2) {
		this.regdate2 = regdate2;
	}
	
}
