package com.jang.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.biz.mapper.AttachMapper;
import com.jang.biz.model.AttachImageVO;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.PlantImageVO;

@Service(value="attachService")
public class AttachServiceImpl implements AttachService {
	
	@Autowired
	private AttachMapper attachMapper;

	@Override
	public List<AttachImageVO> getAttachList(int kno) {
		// TODO Auto-generated method stub
		return this.attachMapper.getAttachList(kno);
	}

	@Override
	public List<MemberImageVO> getAttachList2(int cno) {
		// TODO Auto-generated method stub
		return this.attachMapper.getAttachList2(cno);
	}

	@Override
	public List<PlantImageVO> getAttachList3(int rno) {
		// TODO Auto-generated method stub
		return this.attachMapper.getAttachList3(rno);
	}
	
	

}
