package com.jang.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.jang.biz.model.Account;
import com.jang.biz.model.AttFileVO;
import com.jang.biz.model.Basket;
import com.jang.biz.model.Customer;
import com.jang.biz.model.DateSearch;
import com.jang.biz.model.Delivery;
import com.jang.biz.model.Inquiry;
import com.jang.biz.model.Kit;
import com.jang.biz.model.Order;
import com.jang.biz.model.Orderer;
import com.jang.biz.model.Processing;
import com.jang.biz.model.Reciever;
import com.jang.biz.model.ReplyVO;
import com.jang.biz.model.UserVO;

@Mapper
public interface ShopMapper {
	
	List<Kit> getGoodsList(); //메인 상품리스트
	Kit getGoodsInfo(int kno); //메인 상품상세

	int writeArticle(Inquiry inq); // 1:1문의 글쓰기
	
	int insertFile(AttFileVO file); // 1:1 첨부파일 추가
	
	List<Inquiry> getInquiryList(String memberid);
	Inquiry getInquiryInfo(int ino);//문의 내용보기
	List<ReplyVO> getReplyList(int ino);//댓글 목록 조회
	ReplyVO getReply(int rno);//댓글 조회
	List<AttFileVO> getFileList(int ino);//첨부파일 목록 조회
	String getFileName(int fno);//첨부파일 이름 조회
	
	List<UserVO> getCustomerList();

	Customer getCustomerInfo(String memberid);
	int addReciever(Reciever reciever);
	int addOrderer(Orderer orderer);
	int addOrder(Order order);
	int addProcessing(Processing processing);
	List<Order> getOrder1WList(String memberid);
	List<Reciever> getReciever1WList(String memberid);
	List<Order> getOrder1MList(String memberid);
	List<Reciever> getReciever1MList(String memberid);
	List<Order> getOrder3MList(String memberid);
	List<Reciever> getReciever3MList(String memberid);
	List<Order> getOrder6MList(String memberid);
	List<Reciever> getReciever6MList(String memberid);
	
	List<Order> getOrderSearchList(DateSearch datesearch);
	List<Reciever> getRecieverSearchList(DateSearch datesearch);
	
	Delivery getCostInfo();
	Order LastOrder();
	Reciever LastReciever();
	List<Order> getOrderInfo(int orderno);
	Orderer getOrdererInfo(int orderno);
	Reciever getRecieverInfo(int orderno);
	int UpdateKit(Kit kit);
	int UpdateOrdercnt();
	int UpdateTake(int totalcost);
	int UpdateInquirycnt();
	int Visitcnt();
	List<Account> getAccountList();
	List<Basket> getBasketListY(String memberid);
	List<Basket> getBasketListN(String memberid);
	int addBasketY(Basket basket);
	int addBasketN(Basket basket);
	int deleteBasket(String bno);
	int updateBasket(Basket basket);
	int deleteAllBasket(String memeberid);
	
}
