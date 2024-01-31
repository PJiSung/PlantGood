package com.jang.biz.model;

import java.util.List;

import javax.validation.constraints.NotEmpty;

public class UserVO {
	
	  private int cno;
	  @NotEmpty(message="id가 입력되지 않았습니다.!")
	  private String memberid;
	  @NotEmpty(message="닉네임이 입력되지 않았습니다.!")
	  private String nickname;
	  @NotEmpty(message="패스워드가 입력되지 않았습니다.!")
	  private String passwd;
	  //private String pass2;
	  @NotEmpty(message="이름이 입력되지 않았습니다.!")
	  private String name;
	  @NotEmpty(message="생년월일이 입력되지 않았습니다.!")
	  private String birthday;
	  @NotEmpty(message="email이 입력되지 않았습니다.")
	  private String email;
	  @NotEmpty(message="전화번호가 입력되지 않았습니다.!")
	  private String phone;
	  @NotEmpty(message="우편번호가 입력되지 않았습니다.!")
	  private  String zip;
	  @NotEmpty(message="주소가 입력되지 않았습니다.!")
	  private  String addr1;
	  @NotEmpty(message="상세주소가 입력되지 않았습니다.!")
	  private String addr2;
	  private String regdate;
	  private char del_yn;
	  private int adminck;
	  private List<MemberImageVO> imageList;
	  
	  
	@Override
	public String toString() {
		return "UserVO [cno=" + cno + ", memberid=" + memberid + ", nickname=" + nickname + ", passwd=" + passwd
				+ ", name=" + name + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", zip=" + zip
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", regdate=" + regdate + ", del_yn=" + del_yn + ", adminck="
				+ adminck + ", imageList=" + imageList + "]";
	}
	public List<MemberImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<MemberImageVO> imageList) {
		this.imageList = imageList;
	}
	public int getAdminck() {
		return adminck;
	}
	public void setAdminck(int adminck) {
		this.adminck = adminck;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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

	  
	  
	  
}
