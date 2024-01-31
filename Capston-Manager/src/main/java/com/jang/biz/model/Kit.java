package com.jang.biz.model;

import java.util.List;

public class Kit {

	private int kno;
	private String kitname;
	private int kitprice;
	private String stkitprice;
	private int kitstock;
	private String kitcontents;
	private String regdate;
	private char del_yn;
	private int stock;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getStkitprice() {
		return stkitprice;
	}
	public void setStkitprice(String stkitprice) {
		this.stkitprice = stkitprice;
	}
	public List<AttachImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public String getKitname() {
		return kitname;
	}
	public void setKitname(String kitname) {
		this.kitname = kitname;
	}
	public int getKitprice() {
		return kitprice;
	}
	public void setKitprice(int kitprice) {
		this.kitprice = kitprice;
	}
	public int getKitstock() {
		return kitstock;
	}
	public void setKitstock(int kitstock) {
		this.kitstock = kitstock;
	}
	public String getKitcontents() {
		return kitcontents;
	}
	public void setKitcontents(String kitcontents) {
		this.kitcontents = kitcontents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	@Override
	public String toString() {
		return "Kit [kno=" + kno + ", kitname=" + kitname + ", kitprice=" + kitprice + ", stkitprice=" + stkitprice
				+ ", kitstock=" + kitstock + ", kitcontents=" + kitcontents + ", regdate=" + regdate + ", del_yn="
				+ del_yn + ", imageList=" + imageList + "]";
	}
	
	
	
	
	
	
}
