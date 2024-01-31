package com.jang.biz.service;

import java.util.List;

import com.jang.biz.model.AttachImageVO;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.PlantImageVO;

public interface AttachService {
	
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int kno);
	
	public List<MemberImageVO> getAttachList2(int cno);
	
	public List<PlantImageVO> getAttachList3(int rno);

}
