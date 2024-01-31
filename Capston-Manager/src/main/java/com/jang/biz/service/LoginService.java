package com.jang.biz.service;

import java.util.List;

import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.UserVO;

public interface LoginService {
	
	UserVO findUser(UserVO userVO);
	
	UserVO getUser(String memberid);
	
	int updateUser(UserVO userVO);
	
	void insertUser(UserVO userVO);
	
	UserVO findId(String name, String email);
	UserVO findPass(String memberid, String email);
	int updatePass(UserVO userVO);
	
	public void memberDelete(UserVO UserVO);
	
	/* 지정 회원 이미지 전체 삭제*/
	int deleteImageAll(int cno);
	int deletememberinq(String memberid); //회원탈퇴시 문의삭제
	
	/* 지정 회원 이미지 정보 얻기 */
	public List<MemberImageVO> getMemberInfo(int cno);
	
	UserVO getUserInfo(int cno);
	
	int UpdateJoincnt();
}
