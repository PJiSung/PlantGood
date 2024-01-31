package com.jang.biz.model;

public class Delivery {
	private int dno;
	private String company;
	private String link;
	private int cost;
	private String stcost;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getStcost() {
		return stcost;
	}
	public void setStcost(String stcost) {
		this.stcost = stcost;
	}
}
