package com.jang.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jang.biz.mapper.ManagerMapper;
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
import com.jang.biz.util.CustomerPage;
import com.jang.biz.util.OrderPage;
import com.jang.biz.util.PageHelper;
import com.jang.biz.util.PlantPage;

@Service(value = "managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	CustomerPage customerpage = new CustomerPage();
	OrderPage orderpage = new OrderPage();
	PageHelper pageHelper = new PageHelper();
	PlantPage plantpage = new PlantPage();
	
	@Override
	public List<Manager> getMainList() {
		// TODO Auto-generated method stub
		return this.managerMapper.getMainList();
	}
	
	@Override
	public Order NewOrdercnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.NewOrdercnt();
	}
	
	@Override
	public Processing CancelOrdercnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.CancelOrdercnt();
	}

	@Override
	public Inquiry ReplyWaiting() {
		// TODO Auto-generated method stub
		return this.managerMapper.ReplyWaiting();
	}

	@Override
	public List<Customer> getCustomerList(SearchVO searchVO) {
		// TODO Auto-generated method stub
	    int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * customerpage.getPageSize() +1 ; //pagesize=10 가정  
	    int endRow   = currentPage * customerpage.getPageSize(); //pagesize=10 

	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);
	    
		return this.managerMapper.getCustomerList(searchVO);
	}
	
	@Override
	public StringBuffer getCustomerPageUrl(SearchVO searchVO) {
		// TODO Auto-generated method stub
		int totalRow = managerMapper.getCustomerTotalRow(searchVO);
		return customerpage.getPageUrl(searchVO, totalRow);
	}
	
	@Override
	public List<Order> getOrderList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * orderpage.getPageSize() +1 ; //pagesize=10 가정  
	    int endRow   = currentPage * orderpage.getPageSize(); //pagesize=10 

	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);
	    
		return this.managerMapper.getOrderList(searchVO);
	}

	@Override
	public StringBuffer getOrderPageUrl(SearchVO searchVO) {
		// TODO Auto-generated method stub
		int totalRow = managerMapper.getOrderTotalRow(searchVO);
		return orderpage.getPageUrl(searchVO, totalRow);
	}
	
	@Override
	public int deleteOrder(String ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteOrder(ono);
	}

	@Override
	public List<Manager> get7orderList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get7orderList();
	}

	@Override
	public List<Manager> get7takeList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get7takeList();
	}

	@Override
	public List<Manager> get7visitcntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get7visitcntList();
	}

	@Override
	public List<Manager> get7joincntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get7joincntList();
	}

	@Override
	public List<Manager> get7inquirycntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get7inquirycntList();
	}

	@Override
	public List<Manager> get30orderList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get30orderList();
	}

	@Override
	public List<Manager> get30takeList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get30takeList();
	}

	@Override
	public List<Manager> get30visitcntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get30visitcntList();
	}

	@Override
	public List<Manager> get30joincntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get30joincntList();
	}

	@Override
	public List<Manager> get30inquirycntList() {
		// TODO Auto-generated method stub
		return this.managerMapper.get30inquirycntList();
	}

	@Override
	public int deleteCustomer(String cno) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteCustomer(cno);
	}

	@Override
	public List<Customer> totalcnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.totalcnt();
	}

	@Override
	public List<Customer> generalcnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.generalcnt();
	}

	@Override
	public List<Customer> managercnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.managercnt();
	}

	@Override
	public Customer getCustomerInfo(int cno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getCustomerInfo(cno);
	}

	@Override
	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateCustomer(customer);
	}
	
	@Override
	public Inquiry postcnt(int cno) {
		// TODO Auto-generated method stub
		return this.managerMapper.postcnt(cno);
	}

	@Override
	public List<Order> ordercnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.ordercnt();
	}

	@Override
	public Order getOrderInfo(int ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.getOrderInfo(ono);
	}

	@Override
	public Orderer getOrdererInfo(int ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.getOrdererInfo(ono);
	}

	@Override
	public Processing getProcessingInfo(int ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.getProcessingInfo(ono);
	}

	@Override
	public Reciever getRecieverInfo(int ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.getRecieverInfo(ono);
	}

	@Override
	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateOrder(order);
	}

	@Override
	public int updateReciever(Reciever reciever) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateReciever(reciever);
	}

	@Override
	public List<Account> getAccountList() {
		// TODO Auto-generated method stub
		return this.managerMapper.getAccountList();
	}

	@Override
	public List<Delivery> getDeliveryList() {
		// TODO Auto-generated method stub
		return this.managerMapper.getDeliveryList();
	}

	@Override
	public int deleteAccount(int ano) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteAccount(ano);
	}

	@Override
	public int updateAccount(Account account) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateAccount(account);
	}

	@Override
	public int addAccount(Account account) {
		// TODO Auto-generated method stub
		return this.managerMapper.addAccount(account);
	}

	@Override
	public int updateDelivery(Delivery delivery) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateDelivery(delivery);
	}

	@Override
	public int updatePaymentcom(Processing processing) {
		// TODO Auto-generated method stub
		return this.managerMapper.updatePaymentcom(processing);
	}

	@Override
	public int updateOrderstate(Order order) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateOrderstate(order);
	}

	@Override
	public int updateDeliverycom(Processing processing) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateDeliverycom(processing);
	}

	@Override
	public int updateCancel(Processing processing) {
		// TODO Auto-generated method stub
		return this.managerMapper.updateCancel(processing);
	}
	

	

	
	
	/*상품*/
	@Override
	public List<Kit> getKitList() {
		// TODO Auto-generated method stub
		return this.managerMapper.getKitList();
	}

	@Override
	public Kit getKitInfo(int kno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getKitInfo(kno);
	}

	@Transactional
	@Override
	public void addKit(Kit kit) {

		managerMapper.addKit(kit);
		
		if(kit.getImageList() == null || kit.getImageList().size() <= 0) {
			return;
		}
		kit.getImageList().forEach(attach ->{
			attach.setKno(kit.getKno());
			managerMapper.imageEnroll(attach);
		});
	}

	@Transactional
	@Override
	public int updateKit(Kit kit) {
		
		int result = managerMapper.updateKit(kit);
		
		if(result == 1 && kit.getImageList() != null && kit.getImageList().size() > 0) {
			managerMapper.deleteImageAll(kit.getKno());
			kit.getImageList().forEach(attach -> {
				attach.setKno(kit.getKno());
				managerMapper.imageEnroll(attach);
			});
		}
		return result;
	}

	@Override
	@Transactional
	public int deleteKit(int kno) {
		managerMapper.deleteImageAll(kno);
		return this.managerMapper.deleteKit(kno);
	}
	
	/*문의*/
	@Override
	public List<Inquiry> getInquiryList(SearchVO searchVO) {
		
		int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * pageHelper.getPageSize() +1 ; //pagesize=10 가정  
	    int endRow   = currentPage * pageHelper.getPageSize(); //pagesize=10 

	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);

		return this.managerMapper.getInquiryList(searchVO);
	}
	
	@Override
	public int deleteinq(int ino) {
		return this.managerMapper.deleteinq(ino);
	}
	@Override
	public int deleteinqreply(int ino) {
		return this.managerMapper.deleteinqreply(ino);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		int totalRow = managerMapper.getTotalRow(searchVO);
		return pageHelper.getPageUrl(searchVO, totalRow);
	}
	
	
	@Override
	public List<ReplyVO> getReplyList(int ino) {
		// TODO Auto-generated method stub
		return this.managerMapper.getReplyList(ino);
	}

	@Override
	public ReplyVO getReply(int rno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getReply(rno);
	}

	@Override
	public int writeReply(ReplyVO reply) {
		int ino = reply.getIno();
		this.managerMapper.incrementReplyCnt(ino);
		return this.managerMapper.writeReply(reply);
	}

	@Override
	public List<AttFileVO> getFileList(int ino) {
		// TODO Auto-generated method stub
		return this.managerMapper.getFileList(ino);
	}

	@Override
	public String getFileName(int fno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getFileName(fno);
	}

	@Override
	public Inquiry getInquiryInfo(int ino) {
		// TODO Auto-generated method stub
		return this.managerMapper.getInquiryInfo(ino);
	}

	@Override
	public int incrementReplyCnt(int ino) {
		// TODO Auto-generated method stub
		return this.managerMapper.incrementReplyCnt(ino);
	}

	@Override
	public List<AttachImageVO> getAttachInfo(int kno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getAttachInfo(kno);
	}

	@Override
	public int addMain() {
		// TODO Auto-generated method stub
		return this.managerMapper.addMain();
	}

	@Override
	public int deleteOrderer(String ono) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteOrderer(ono);
	}

	@Override
	public int deleteProcessing(String pno) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteProcessing(pno);
	}

	@Override
	public int deleteReciever(String rno) {
		// TODO Auto-generated method stub
		return this.managerMapper.deleteReciever(rno);
	}

	@Override
	public Order cusordercnt(int cno) {
		// TODO Auto-generated method stub
		return this.managerMapper.cusordercnt(cno);
	}

	@Override
	public List<Plant> getPlantList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * plantpage.getPageSize() +1 ; //pagesize=10 가정  
	    int endRow   = currentPage * plantpage.getPageSize(); //pagesize=10 

	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);
	    
		return this.managerMapper.getPlantList(searchVO);
	}
	@Override
	public StringBuffer getPlantPageUrl(SearchVO searchVO) {
		// TODO Auto-generated method stub
		int totalRow = managerMapper.getPlantTotalRow(searchVO);
		return plantpage.getPageUrl(searchVO, totalRow);
	}

	@Override
	public Plant plantcnt() {
		// TODO Auto-generated method stub
		return this.managerMapper.plantcnt();
	}

	@Override
	public int AddPlant(Plant plant) {
		// TODO Auto-generated method stub
		return this.managerMapper.AddPlant(plant);
	}

	@Override
	public int deletePlant(String pno) {
		// TODO Auto-generated method stub
		return this.managerMapper.deletePlant(pno);
	}

	@Override
	public Plant getPlant(String pno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getPlant(pno);
	}

	@Override
	public List<Plant> getPlant2(String pno) {
		// TODO Auto-generated method stub
		return this.managerMapper.getPlant2(pno);
	}
	
}
