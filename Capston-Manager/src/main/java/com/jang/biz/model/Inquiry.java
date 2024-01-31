package com.jang.biz.model;

public class Inquiry {
	
	private int ino;
	private String inqstate;
	private String memberid;
	private String title;
	private String kitname;
	private String contents;
	private String regdate;
	private int replycnt=0;
	private int kno;
	private String qnatype;
	private int replywaitcnt;
	private int postcnt;
	
	
	public int getPostcnt() {
		return postcnt;
	}
	public void setPostcnt(int postcnt) {
		this.postcnt = postcnt;
	}
	public String getQnatype() {
		return qnatype;
	}
	public void setQnatype(String qnatype) {
		this.qnatype = qnatype;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public String getInqstate() {
		return inqstate;
	}
	public void setInqstate(String inqstate) {
		this.inqstate = inqstate;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getKitname() {
		return kitname;
	}
	public void setKitname(String kitname) {
		this.kitname = kitname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getReplywaitcnt() {
		return replywaitcnt;
	}
	public void setReplywaitcnt(int replywaitcnt) {
		this.replywaitcnt = replywaitcnt;
	}

}
