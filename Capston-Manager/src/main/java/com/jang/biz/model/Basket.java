package com.jang.biz.model;

import java.util.List;

public class Basket {
	private int bno;
	private String kitname;
	private String kitprice;
	private String kitstock;
	private String totalprice;
	private String memberid;
	private String single;
	private String stkitprice;
	private String sttotalprice;
	private int kno;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;

	public String getSttotalprice() {
		return sttotalprice;
	}
	public void setSttotalprice(String sttotalprice) {
		this.sttotalprice = sttotalprice;
	}
	public String getStkitprice() {
		return stkitprice;
	}
	public void setStkitprice(String stkitprice) {
		this.stkitprice = stkitprice;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getKitname() {
		return kitname;
	}
	public void setKitname(String kitname) {
		this.kitname = kitname;
	}
	public String getKitprice() {
		return kitprice;
	}
	public void setKitprice(String kitprice) {
		this.kitprice = kitprice;
	}
	public String getKitstock() {
		return kitstock;
	}
	public void setKitstock(String kitstock) {
		this.kitstock = kitstock;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getSingle() {
		return single;
	}
	public void setSingle(String single) {
		this.single = single;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public List<AttachImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
	
}
