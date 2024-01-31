package com.jang.biz.service;

import java.util.List;

import com.jang.biz.model.Control;
import com.jang.biz.model.Diary;
import com.jang.biz.model.Plant;
import com.jang.biz.model.PlantImageVO;
import com.jang.biz.model.Registration;
import com.jang.biz.model.SearchVO;

public interface SmartPotService {
	
	List<Plant> getSearchList(SearchVO searchVO);
	
	List<Plant> getPlantList(String category);
	
	Plant getPlantInfo(int pno);
	
	void addRegistration(Registration reg);
	
	int addControl(Control control);
	
	Registration getRegistration(String memeberid,String name);
	
	Plant getCategoryInfo(String kind);
	
	List<Diary> getDiaryList(String memberid,String name);
	
	List<Diary> getContentsList(String memberid,String name,String regdate);
	
	List<Registration> getRegistrationList(String memberid);
	
	int DeletePlant(int rno); 
	
	int updateControl(int cno);
	
	Control temphumidataSave(String temperature, String humidity);
	Control gettemphumidata();
	int leddataSave(String memberid, String name, String contents);

	Registration getimg(int rno);
	/* 지정 상품 이미지 정보 얻기 */
	public List<PlantImageVO> getAttachInfo(int rno);
	
	int updateLedTime(int led);
	
	Plant getPlantNameInfo(String kind);
	
	Control getControlInfo();
	Registration dbgetrno(int rno);
	Diary getlastDay(String memberid,String name);
	List<Diary> getlastContents(String memberid,String name);
}
