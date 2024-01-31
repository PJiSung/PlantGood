package com.jang.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jang.biz.mapper.LoginMapper;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.UserVO;

@Service(value = "loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;

	@Override
	public UserVO findUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.findUser(userVO);
	}

	@Override
	public UserVO getUser(String memberid) {
		// TODO Auto-generated method stub
		return loginMapper.getUser(memberid);
	}

	@Transactional
	@Override
	public int updateUser(UserVO userVO) {
		
		int result = loginMapper.updateUser(userVO);
		
		if(result == 1 && userVO.getImageList() != null && userVO.getImageList().size() > 0) {
			
			loginMapper.deleteImageAll(userVO.getCno());
			
			userVO.getImageList().forEach(attach -> {
				
				attach.setCno(userVO.getCno());
				loginMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
	}

	@Transactional
	@Override
	public void insertUser(UserVO userVO) {

		loginMapper.insertUser(userVO);

		if (userVO.getImageList() == null || userVO.getImageList().size() <= 0) {
			return;
		}

		userVO.getImageList().forEach(attach -> {

			attach.setCno(userVO.getCno());
			loginMapper.imageEnroll(attach);

		});
	}

	@Override
	public UserVO findId(String name, String email) {
		// TODO Auto-generated method stub
		return loginMapper.findId(name, email);
	}

	@Override
	public UserVO findPass(String memberid, String email) {
		// TODO Auto-generated method stub
		return loginMapper.findPass(memberid, email);
	}

	@Override
	public int updatePass(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.updatePass(userVO);
	}

	@Override
	public void memberDelete(UserVO UserVO) {

		loginMapper.memberDelete(UserVO);
	}

	@Override
	public int deleteImageAll(int cno) {
		// TODO Auto-generated method stub
		return this.loginMapper.deleteImageAll(cno);
	}

	@Override
	public List<MemberImageVO> getMemberInfo(int cno) {
		// TODO Auto-generated method stub
		return this.loginMapper.getMemberInfo(cno);
	}

	@Override
	public int deletememberinq(String memberid) {
		// TODO Auto-generated method stub
		return this.loginMapper.deletememberinq(memberid);
	}

	@Override
	public int UpdateJoincnt() {
		// TODO Auto-generated method stub
		return this.loginMapper.UpdateJoincnt();
	}

	@Override
	public UserVO getUserInfo(int cno) {
		// TODO Auto-generated method stub
		return this.loginMapper.getUserInfo(cno);
	}



}
