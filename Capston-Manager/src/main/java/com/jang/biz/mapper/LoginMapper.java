package com.jang.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jang.biz.model.AttachImageVO;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.UserVO;

@Mapper
public interface LoginMapper {
	
	UserVO findUser(UserVO userVO);
	
	UserVO getUser(String memberid);
	
	int updateUser(UserVO userVO);
	
	int insertUser(UserVO userVO);
	
	
	UserVO findId(@Param("name") String name, @Param("email") String email);
	UserVO findPass(@Param("memberid") String memberid, @Param("email") String email);
	int updatePass(UserVO userVO);
	
	/* 이미지 등록 */
	public void imageEnroll(MemberImageVO vo);
	
	// 회원 탈퇴
	public void memberDelete(UserVO UserVO);
	
	/* 지정 회원 이미지 전체 삭제*/
	int deleteImageAll(int cno);
	int deletememberinq(String memberid); //회원탈퇴시 문의삭제
	
	/* 지정 회원 이미지 정보 얻기 */
	public List<MemberImageVO> getMemberInfo(int cno);
	
	/* 어제자 날짜 이미지 리스트 */
	public List<MemberImageVO> checkFileList();
	
	UserVO getUserInfo(int cno);
	
	int UpdateJoincnt();
}
