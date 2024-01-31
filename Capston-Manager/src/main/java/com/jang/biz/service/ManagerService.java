package com.jang.biz.service;

import java.util.List;

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

public interface ManagerService {
	
	int addMain();
	
	Order NewOrdercnt();
	
	Processing CancelOrdercnt();
	
	Inquiry ReplyWaiting();
	
	List<Manager> getMainList(); //관리자메인

	List<Manager> get7orderList(); //7일합계

	List<Manager> get7takeList();

	List<Manager> get7visitcntList();

	List<Manager> get7joincntList();

	List<Manager> get7inquirycntList();

	List<Manager> get30orderList(); //해당달합계

	List<Manager> get30takeList();

	List<Manager> get30visitcntList();

	List<Manager> get30joincntList();

	List<Manager> get30inquirycntList();
	
	int deletePlant(String pno);
	
	Plant plantcnt();
	
	List<Plant> getPlantList(SearchVO searchVO);
	
	StringBuffer getPlantPageUrl(SearchVO searchVO);
	
	int AddPlant(Plant plant);
	
	Plant getPlant(String pno);
	
	List<Plant> getPlant2(String pno);

	List<Customer> getCustomerList(SearchVO searchVO); //고객관리 리스트
	
	List<Order> getOrderList(SearchVO searchVO); //일반고객 리스트
	
	StringBuffer getCustomerPageUrl(SearchVO searchVO); //고객관리 테이블 페이지수
	
	StringBuffer getOrderPageUrl(SearchVO searchVO); //일반고객 테이블 페이지수
	
	int deleteCustomer(String cno); //고객 삭제
	
	List<Customer> totalcnt(); //전체고객 수
	
	List<Customer> generalcnt(); //일반고객 수
	
	List<Customer> managercnt(); //관리자 수
	
	Customer getCustomerInfo(int cno); //고객정보
	
	int updateCustomer(Customer customer); //고객정보 수정
	
	Inquiry postcnt(int cno); //활동 정보 수 문의수만 했음 나머지 추후 추가
	
	Order cusordercnt(int cno);
	
	List<Order> ordercnt(); //전체 주문수
	
	int deleteOrder(String ono); //주문 삭제
	
	Order getOrderInfo(int ono); //주문정보
	
	Orderer getOrdererInfo(int ono); //주문자 정보
	
	Processing getProcessingInfo(int ono); //처리시간 정보
	
	Reciever getRecieverInfo(int ono); //수취인 정보
	
	int updateOrder(Order order); //주문정보 수정
	
	int updateReciever(Reciever reciever); //수취인정보 수정
	
	List<Account> getAccountList(); //계좌정보
	
	List<Delivery> getDeliveryList(); //배송정보
	
	int deleteAccount(int ano); //계좌삭제
	
	int updateAccount(Account account); //계좌 수정
	
	int addAccount(Account account); //계좌 추가
	
	int updateDelivery(Delivery delivery); //배송정보 수정
	
	int updatePaymentcom(Processing processing); //결제완료 시간 수정
	
	int updateDeliverycom(Processing processing); //배송완료 시간 수정
	
	int updateCancel(Processing processing); //주문취소 시간 수정
	
	int updateOrderstate(Order order); //처리상태 수정
	
	int deleteOrderer(String ono);
	
	int deleteProcessing(String pno);
	
	int deleteReciever(String rno);
	
	/* 상품등록 */
	List<Kit> getKitList();   //상품 목록
	Kit getKitInfo(int kno);  //상품 정보
	void addKit(Kit kit);	  //상품 등록
	int updateKit(Kit kit);	  //상품 수정
	int deleteKit(int kno);	  //상품 삭제

	
	/*상품문의*/
	List<Inquiry> getInquiryList(SearchVO searchVO);//문의 목록 조회
	Inquiry getInquiryInfo(int ino);//문의 내용보기
	int deleteinq(int ino);
	int deleteinqreply(int ino);
	
	List<ReplyVO> getReplyList(int ino);//댓글 목록 조회
	ReplyVO getReply(int rno);//댓글 조회
	int writeReply(ReplyVO reply);//댓글 쓰기
	int incrementReplyCnt(int ino);
	
	
	List<AttFileVO> getFileList(int ino);//첨부파일 목록 조회
	String getFileName(int fno);//첨부파일 이름 조회
	
	StringBuffer getPageUrl( SearchVO searchVO);        
	
	/* 이미지 등록 */
	//public void imageEnroll(AttachImageVO vo);
	
	/* 이미지 데이터 반환 */
	//public List<AttachImageVO> getAttachList(int kno);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int kno);
}
