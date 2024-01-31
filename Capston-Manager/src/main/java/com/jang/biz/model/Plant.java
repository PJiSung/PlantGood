package com.jang.biz.model;

public class Plant {
	
	private int pno;
	private String contents;
	private String category;
	private String kind;
	private String temmax;
	private String temmin;
	private String image;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}


	public String getTemmax() {
		return temmax;
	}
	public void setTemmax(String temmax) {
		this.temmax = temmax;
	}
	public String getTemmin() {
		return temmin;
	}
	public void setTemmin(String temmin) {
		this.temmin = temmin;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
