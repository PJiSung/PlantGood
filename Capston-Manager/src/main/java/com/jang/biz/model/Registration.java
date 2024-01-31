package com.jang.biz.model;

import java.util.List;

public class Registration {
	private int rno;
	private String memberid;
	private String kind;
	private String name;
	private String regdate;
	private String day;
	private List<PlantImageVO> imageList;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public List<PlantImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<PlantImageVO> imageList) {
		this.imageList = imageList;
	}
	@Override
	public String toString() {
		return "Registration [rno=" + rno + ", memberid=" + memberid + ", kind=" + kind + ", name=" + name
				+ ", regdate=" + regdate + ", day=" + day + ", imageList=" + imageList + "]";
	}
	
	
}
