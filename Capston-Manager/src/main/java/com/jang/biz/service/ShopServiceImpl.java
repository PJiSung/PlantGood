package com.jang.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.biz.mapper.AttachMapper;
import com.jang.biz.mapper.ManagerMapper;
import com.jang.biz.mapper.ShopMapper;
import com.jang.biz.model.Account;
import com.jang.biz.model.AttFileVO;
import com.jang.biz.model.AttachImageVO;
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

@Service(value = "shopservice")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private ShopMapper shopMapper;

	@Autowired
	private ManagerMapper managerMapper;

	@Override
	public Kit getGoodsInfo(int kno) {

		Kit kit = shopMapper.getGoodsInfo(kno);
		kit.setImageList(managerMapper.getAttachInfo(kno));

		return kit;
	}

	@Override
	public List<Kit> getGoodsList() {

		List<Kit> list = shopMapper.getGoodsList();

		list.forEach(kit -> {

			int kno = kit.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			kit.setImageList(imageList);

		});

		return list;
	}

	@Override
	public int writeArticle(Inquiry inq) {
		// TODO Auto-generated method stub
		return this.shopMapper.writeArticle(inq);
	}

	@Override
	public int insertFile(AttFileVO file) {
		// TODO Auto-generated method stub
		return this.shopMapper.insertFile(file);
	}

	@Override
	public List<Inquiry> getInquiryList(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getInquiryList(memberid);
	}

	@Override
	public Inquiry getInquiryInfo(int ino) {
		// TODO Auto-generated method stub
		return this.shopMapper.getInquiryInfo(ino);
	}

	@Override
	public List<AttFileVO> getFileList(int ino) {
		// TODO Auto-generated method stub
		return this.shopMapper.getFileList(ino);
	}

	@Override
	public String getFileName(int fno) {
		// TODO Auto-generated method stub
		return this.shopMapper.getFileName(fno);
	}

	@Override
	public List<ReplyVO> getReplyList(int ino) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReplyList(ino);
	}

	@Override
	public ReplyVO getReply(int rno) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReply(rno);
	}

	@Override
	public List<UserVO> getCustomerList() {
		// TODO Auto-generated method stub
		return this.shopMapper.getCustomerList();
	}

	@Override
	public Customer getCustomerInfo(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getCustomerInfo(memberid);
	}

	@Override
	public int addReciever(Reciever reciever) {
		// TODO Auto-generated method stub
		return this.shopMapper.addReciever(reciever);
	}

	@Override
	public int addOrderer(Orderer orderer) {
		// TODO Auto-generated method stub
		return this.shopMapper.addOrderer(orderer);
	}

	@Override
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		return this.shopMapper.addOrder(order);
	}

	@Override
	public int addProcessing(Processing processing) {
		// TODO Auto-generated method stub
		return this.shopMapper.addProcessing(processing);
	}

	@Override
	public List<Order> getOrder1WList(String memberid) {

		List<Order> list = shopMapper.getOrder1WList(memberid);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}

	@Override
	public List<Reciever> getReciever1WList(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReciever1WList(memberid);
	}

	@Override
	public List<Order> getOrder1MList(String memberid) {

		List<Order> list = shopMapper.getOrder1MList(memberid);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}
	
	
	
	@Override
	public List<Reciever> getReciever1MList(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReciever1MList(memberid);
	}

	@Override
	public List<Order> getOrder3MList(String memberid) {

		List<Order> list = shopMapper.getOrder3MList(memberid);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}

	@Override
	public List<Reciever> getReciever3MList(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReciever3MList(memberid);
	}

	@Override
	public List<Order> getOrder6MList(String memberid) {

		List<Order> list = shopMapper.getOrder6MList(memberid);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}

	@Override
	public List<Reciever> getReciever6MList(String memberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.getReciever6MList(memberid);
	}
	
	

	@Override
	public List<Order> getOrderSearchList(DateSearch datesearch) {
		// TODO Auto-generated method stub
		List<Order> list = shopMapper.getOrderSearchList(datesearch);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}

	@Override
	public List<Reciever> getRecieverSearchList(DateSearch datesearch) {
		// TODO Auto-generated method stub
		return this.shopMapper.getRecieverSearchList(datesearch);
	}

	@Override
	public Delivery getCostInfo() {
		// TODO Auto-generated method stub
		return this.shopMapper.getCostInfo();
	}

	@Override
	public List<Order> getOrderInfo(int orderno) {
		
		List<Order> list = shopMapper.getOrderInfo(orderno);

		list.forEach(Order -> {

			int kno = Order.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Order.setImageList(imageList);

		});

		return list;
	}

	@Override
	public Orderer getOrdererInfo(int orderno) {
		// TODO Auto-generated method stub
		return this.shopMapper.getOrdererInfo(orderno);
	}

	@Override
	public Reciever getRecieverInfo(int orderno) {
		// TODO Auto-generated method stub
		return this.shopMapper.getRecieverInfo(orderno);
	}

	@Override
	public int UpdateKit(Kit kit) {
		// TODO Auto-generated method stub
		return this.shopMapper.UpdateKit(kit);
	}

	@Override
	public int UpdateOrdercnt() {
		// TODO Auto-generated method stub
		return this.shopMapper.UpdateOrdercnt();
	}

	@Override
	public int UpdateTake(int totalcost) {
		// TODO Auto-generated method stub
		return this.shopMapper.UpdateTake(totalcost);
	}

	@Override
	public int UpdateInquirycnt() {
		// TODO Auto-generated method stub
		return this.shopMapper.UpdateInquirycnt();
	}
	@Override
	public int Visitcnt() {
		// TODO Auto-generated method stub
		return this.shopMapper.Visitcnt();
	}

	@Override
	public List<Account> getAccountList() {
		// TODO Auto-generated method stub
		return this.shopMapper.getAccountList();
	}

	@Override
	public Order LastOrder() {
		// TODO Auto-generated method stub
		return this.shopMapper.LastOrder();
	}

	@Override
	public Reciever LastReciever() {
		// TODO Auto-generated method stub
		return this.shopMapper.LastReciever();
	}

	@Override
	public List<Basket> getBasketListY(String memberid) {

		List<Basket> list = shopMapper.getBasketListY(memberid);

		list.forEach(Basket -> {

			int kno = Basket.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Basket.setImageList(imageList);

		});

		return list;
	}
	
	@Override
	public List<Basket> getBasketListN(String memberid) {
		
		List<Basket> list = shopMapper.getBasketListN(memberid);

		list.forEach(Basket -> {

			int kno = Basket.getKno();

			List<AttachImageVO> imageList = attachMapper.getAttachList(kno);

			Basket.setImageList(imageList);

		});

		return list;
	}

	@Override
	public int addBasketY(Basket basket) {
		// TODO Auto-generated method stub
		return this.shopMapper.addBasketY(basket);
	}
	@Override
	public int addBasketN(Basket basket) {
		// TODO Auto-generated method stub
		return this.shopMapper.addBasketN(basket);
	}

	@Override
	public int deleteBasket(String bno) {
		// TODO Auto-generated method stub
		return this.shopMapper.deleteBasket(bno);
	}

	@Override
	public int updateBasket(Basket basket) {
		// TODO Auto-generated method stub
		return this.shopMapper.updateBasket(basket);
	}

	@Override
	public int deleteAllBasket(String memeberid) {
		// TODO Auto-generated method stub
		return this.shopMapper.deleteAllBasket(memeberid);
	}
	

}
