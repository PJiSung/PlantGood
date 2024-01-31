package com.jang.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jang.biz.mapper.AttachMapper;
import com.jang.biz.mapper.SmartPotMapper;
import com.jang.biz.model.Control;
import com.jang.biz.model.Diary;
import com.jang.biz.model.Plant;
import com.jang.biz.model.PlantImageVO;
import com.jang.biz.model.Registration;
import com.jang.biz.model.SearchVO;

@Service(value = "smartpot")
public class SmartPotServiceImpl implements SmartPotService {
	
	@Autowired
	private SmartPotMapper smartpotMapper;
	
	@Autowired
	private AttachMapper attachMapper;

	@Override
	public List<Plant> getSearchList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getSearchList(searchVO);
	}

	@Override
	public List<Plant> getPlantList(String category) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getPlantList(category);
	}

	@Override
	public Plant getPlantInfo(int pno) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getPlantInfo(pno);
	}

	@Transactional
	@Override
	public void addRegistration(Registration reg) {
		
		smartpotMapper.addRegistration(reg);
		
		if(reg.getImageList() == null || reg.getImageList().size() <= 0) {
			return;
		}
		reg.getImageList().forEach(attach ->{
			attach.setRno(reg.getRno());
			smartpotMapper.imageEnroll(attach);
		});
	}

	@Override
	public Registration getRegistration(String memeberid, String name) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getRegistration(memeberid, name);
	}

	@Override
	public Plant getCategoryInfo(String kind) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getCategoryInfo(kind);
	}

	@Override
	public List<Diary> getDiaryList(String memberid, String name) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getDiaryList(memberid, name);
	}

	@Override
	public List<Diary> getContentsList(String memberid, String name, String regdate) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getContentsList(memberid, name, regdate);
	}

	@Override
	public List<Registration> getRegistrationList(String memberid) {

		List<Registration> list = smartpotMapper.getRegistrationList(memberid);
		
		list.forEach(reg -> {
			
			int rno = reg.getRno();
			
			List<PlantImageVO> imageList = attachMapper.getAttachList3(rno);
			
			reg.setImageList(imageList);
			
		});
		
		return list;
	}

	

	@Override
	public Control temphumidataSave(String temperature, String humidity) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.temphumidataSave(temperature, humidity);
	}

	@Override
	public Control gettemphumidata() {
		// TODO Auto-generated method stub
		return this.smartpotMapper.gettemphumidata();
	}

	@Override
	public int addControl(Control control) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.addControl(control);
	}

	@Override
	public int DeletePlant(int rno) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.DeletePlant(rno);
	}

	@Override
	public int updateControl(int cno) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.updateControl(cno);
	}

	@Override
	public int leddataSave(String memberid, String name, String contents) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.leddataSave(memberid, name, contents);
	}


	@Override
	public Registration getimg(int rno) {

		Registration reg3 = smartpotMapper.getimg(rno);
		reg3.setImageList(smartpotMapper.getAttachInfo(rno));
		
		return reg3;
	}

	@Override
	public List<PlantImageVO> getAttachInfo(int rno) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getAttachInfo(rno);
	}

	
	@Override
	public int updateLedTime(int led) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.updateLedTime(led);
	}

	@Override
	public Plant getPlantNameInfo(String kind) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getPlantNameInfo(kind);
	}

	@Override
	public Control getControlInfo() {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getControlInfo();
	}

	@Override
	public Registration dbgetrno(int rno) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.dbgetrno(rno);
	}
	@Override
	public Diary getlastDay(String memberid, String name) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getlastDay(memberid, name);
	}

	@Override
	public List<Diary> getlastContents(String memberid, String name) {
		// TODO Auto-generated method stub
		return this.smartpotMapper.getlastContents(memberid, name);
	}
	
	
}
