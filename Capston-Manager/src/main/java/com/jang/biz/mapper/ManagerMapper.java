package com.jang.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.biz.model.Account;
import com.jang.biz.model.AttFileVO;
import com.jang.biz.model.AttachImageVO;
import com.jang.biz.model.Customer;
import com.jang.biz.model.Delivery;
import com.jang.biz.model.Inquiry;
import com.jang.biz.model.Kit;
import com.jang.biz.model.Manager;
import com.jang.biz.model.Order;
import com.jang.biz.model.Orderer;
import com.jang.biz.model.Plant;
import com.jang.biz.model.Processing;
import com.jang.biz.model.Reciever;
import com.jang.biz.model.ReplyVO;
import com.jang.biz.model.SearchVO;

@Mapper
public interface ManagerMapper {
	int addMain();
	
	Order NewOrdercnt();
	
	Processing CancelOrdercnt();
	
	Inquiry ReplyWaiting();
	
	List<Manager> getMainList();

	List<Manager> get7orderList();

	List<Manager> get7takeList();

	List<Manager> get7visitcntList();

	List<Manager> get7joincntList();

	List<Manager> get7inquirycntList();

	List<Manager> get30orderList();

	List<Manager> get30takeList();

	List<Manager> get30visitcntList();

	List<Manager> get30joincntList();

	List<Manager> get30inquirycntList();
	
	List<Plant> getPlantList(SearchVO searchVO);

	List<Customer> getCustomerList(SearchVO searchVO);
	
	List<Order> getOrderList(SearchVO searchVO);
	
	int getPlantTotalRow(SearchVO searchVO);
	
	Plant plantcnt();
	
	Plant getPlant(String pno);
	
	List<Plant> getPlant2(String pno);
	
	int deletePlant(String pno);
	
	int AddPlant(Plant plant);
	
	int getCustomerTotalRow(SearchVO searchVO);
	
	int getOrderTotalRow(SearchVO searchVO);
	
	List<Customer> totalcnt();
	
	List<Customer> generalcnt();
	
	List<Customer> managercnt();
	
	int deleteCustomer(String cno);
	
	Customer getCustomerInfo(int cno);
	
	int updateCustomer(Customer customer);
	
	Inquiry postcnt(int cno); //게시물 수후수정
	
	Order cusordercnt(int cno);
	
	List<Order> ordercnt();
	
	int deleteOrder(String ono); //주문 삭제
	
	Order getOrderInfo(int ono);
	
	Orderer getOrdererInfo(int ono);
	
	Processing getProcessingInfo(int ono);
	
	Reciever getRecieverInfo(int ono);
	
	int updateOrder(Order order);
	
	int updateReciever(Reciever reciever);
	
	List<Account> getAccountList();
	
	List<Delivery> getDeliveryList();
	
	int deleteAccount(int ano);
	
	int updateAccount(Account account);
	
	int addAccount(Account account);
	
	int updateDelivery(Delivery delivery);
	
	int updatePaymentcom(Processing processing); //결제완료 시간 추가
	
	int updateDeliverycom(Processing processing); //배송완료 시간 수정
	
	int updateCancel(Processing processing); //주문취소 시간 수정
	
	int updateOrderstate(Order order); //처리상태 수정
	
	int deleteOrderer(String ono);
	
	int deleteProcessing(String pno);
	
	int deleteReciever(String rno);
	
	/*-----------상품-----------*/
	List<Kit> getKitList();
	Kit getKitInfo(int kno);
	int addKit(Kit kit);
	int updateKit(Kit kit);
	int deleteKit(int kno);
	
	/*상품문의*/
	List<Inquiry> getInquiryList(SearchVO searchVO); //문의 목록 조회
	Inquiry getInquiryInfo(int ino);				 //문의 내용보기
	int deleteinq(int ino);							 //문의 삭제
	int deleteinqreply(int ino);					 //답글 삭제
	
	List<ReplyVO> getReplyList(int ino); //댓글 목록 조회
	ReplyVO getReply(int rno);			 //댓글 조회
	int writeReply(ReplyVO reply);		 //댓글 쓰기
	int incrementReplyCnt(int ino);		 //답변상태를 위한 답변 카운트
	
	List<AttFileVO> getFileList(int ino); //첨부파일 목록 조회
	String getFileName(int fno);		  //첨부파일 이름 조회
	
	int getTotalRow(SearchVO searchVO);

	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	
	/* 지정 상품 이미지 전체 삭제 */
	int deleteImageAll(int kno);
	
	
	/* 어제자 날짜 이미지 리스트 */
	public List<AttachImageVO> checkFileList();
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int kno);
}
