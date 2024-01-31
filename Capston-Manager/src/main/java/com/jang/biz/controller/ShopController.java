package com.jang.biz.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import com.jang.biz.service.AttachService;
import com.jang.biz.service.ShopService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private AttachService attachService;

	@Autowired
	private ShopService shopService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) throws Exception {

		List<Kit> kit = shopService.getGoodsList();
		model.addAttribute("kitList", kit);

		return "/shop/main";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String main2(Model model) throws Exception {

		return "/shop/orderDetails2";
	}

	@RequestMapping("/goodsDetail")
	public String kitinfo(@RequestParam(value = "kno", required = false, defaultValue = "0") int kno,
			HttpSession session, @Valid Kit kit1, Model model) throws Exception {
		model.addAttribute("kit", shopService.getGoodsInfo(kno));
		return "/shop/goodsDetail";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {

		return "/shop/mypage";
	}

	@RequestMapping(value = "/inquirylist", method = RequestMethod.GET)
	public String inquirylist(Model model, HttpSession session) throws Exception {
		String memberid = (String) session.getAttribute("memberid");
		List<Inquiry> inq = shopService.getInquiryList(memberid);
		model.addAttribute("inqList", inq);

		return "shop/inquirylist";
	}

	@RequestMapping("/inqinfo")
	public String inqinfo(@RequestParam(value = "ino", required = false, defaultValue = "0") int ino,
			HttpSession session, Model model) throws Exception {

		session.setAttribute("managerid", "관리자");

		Inquiry inq = shopService.getInquiryInfo(ino);

		List<ReplyVO> reply = shopService.getReplyList(ino);
		List<AttFileVO> fileList = shopService.getFileList(ino);

		model.addAttribute("inq", inq);
		model.addAttribute("replyList", reply);
		model.addAttribute("fileList", fileList);

		return "/shop/inqinfo";
	}

	@RequestMapping(value = "/filedown")
	@ResponseBody
	public byte[] downProcess(HttpServletResponse response, @RequestParam String fileName, HttpServletRequest req) throws IOException {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/attfile/");
		
		File file = new File(uploadFolder + fileName);
		byte[] bytes = FileCopyUtils.copyToByteArray(file); // SPRING 5.0 이상

		String fn = new String(file.getName().getBytes(), "iso_8859_1");

		response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
		response.setContentLength(bytes.length);

		return bytes;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWrite() {

		return "/shop/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWriteProc(@ModelAttribute("Inquiry") Inquiry inquiry, MultipartHttpServletRequest mrequest, HttpServletRequest req) {

		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources/attfile/");
		
		shopService.writeArticle(inquiry);
		shopService.UpdateInquirycnt();

		int ino = inquiry.getIno();

		AttFileVO fileVO = new AttFileVO();
		List<MultipartFile> fileList = mrequest.getFiles("filelist");

		for (MultipartFile mf : fileList) {
			if (!mf.isEmpty()) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				fileVO.setIno(ino);
				fileVO.setOfilename(originFileName);
				fileVO.setSfilename(originFileName); // 디스크에 파일 저장시 동일 파일명 발생대비:현재 처리 안함
				fileVO.setFilesize(fileSize);

				shopService.insertFile(fileVO);// 테이블에 파일 정보 저장

				String safeFile = uploadPath + originFileName; // 디스크에 파일 저장

				try {
					mf.transferTo(new File(safeFile)); // 디스크에 파일 저장

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:inquirylist";
	}

	

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName, HttpServletRequest req) {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/img/");
		
		File file = new File(uploadFolder + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}

	/* 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int kno) {

		return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(kno), HttpStatus.OK);

	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile, HttpServletRequest req) {

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		} // for

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/img");

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();

		for (MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 (이름중복파일 업로드시 오류방지) */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {

				multipartFile.transferTo(saveFile);

				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}

			list.add(vo);

		}

		for (int i = 0; i < uploadFile.length; i++) {

		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		return result;
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {
		
		session.setAttribute("memberid", "1"); //삭제
		
		String memberid = (String) session.getAttribute("memberid");
		
		String single = (String) session.getAttribute("single");
		
		Customer customer = this.shopService.getCustomerInfo(memberid);
		model.addAttribute("customer", customer);
		
		if(single=="n") {
		List<Basket> basketN = shopService.getBasketListN(memberid);
		model.addAttribute("basket", basketN);
		}else {
		List<Basket> basketY = shopService.getBasketListY(memberid);
		model.addAttribute("basket", basketY);
		}
		
		List<Kit> kit = shopService.getGoodsList();
		model.addAttribute("kit", kit);

		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);
		
		List<Account> account = this.shopService.getAccountList();
		model.addAttribute("account",account);

		return "/shop/Order";
	}

	@RequestMapping(value = "/addSave", method = RequestMethod.POST)
	public String add(@Valid Reciever reciever, Orderer orderer,Kit kit, BindingResult result,
			Processing processing,int totalcost, HttpSession session) throws Exception {
		
		String memberid = (String) session.getAttribute("memberid");
		
		shopService.addReciever(reciever);
		shopService.addOrderer(orderer);
		shopService.addProcessing(processing);
		shopService.UpdateOrdercnt();
		shopService.UpdateTake(totalcost);
		shopService.deleteAllBasket(memberid);
		System.out.println("addsave");
		return "redirect:ordercom";
	}
	
	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(Order order, BindingResult result,HttpServletRequest request) throws Exception {
		System.out.println("addorder");
		shopService.addOrder(order);

		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/order";
		 }
	}
	
	@RequestMapping(value = "/updatekit", method = RequestMethod.GET)
	public String updatekit(Kit kit, BindingResult result,HttpServletRequest request) throws Exception {
		System.out.print("updatekit");
		shopService.UpdateKit(kit);

		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/order";
		 }
	}
	
	
	@RequestMapping(value = "/ordercom", method = RequestMethod.GET)
	public String ordercom(Model model, HttpSession session) throws Exception {
		
		Reciever LastReceiver = this.shopService.LastReciever();
		model.addAttribute("receiver",LastReceiver);
		
		Order LastOrder = this.shopService.LastOrder();
		model.addAttribute("order",LastOrder);
		
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("del", delivery);
		
		List<Account> account = this.shopService.getAccountList();
		model.addAttribute("account",account);

		return "/shop/OrderCom";
	}
	
	
	
	@RequestMapping(value = "/historySearch", method = RequestMethod.GET)
	public String historySearch(Model model, HttpSession session, DateSearch datesearch) throws Exception {
		
		session.setAttribute("memberid", "1"); //삭제
		
		String memberid = (String) session.getAttribute("memberid");
		List<Order> order = this.shopService.getOrderSearchList(datesearch);
		model.addAttribute("order", order);
		List<Reciever> reciever = this.shopService.getRecieverSearchList(datesearch);
		model.addAttribute("reciever", reciever);
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);
		

		return "/shop/OrderHistory";
	}

	@RequestMapping(value = "/history1W", method = RequestMethod.GET)
	public String history1W(Model model, HttpSession session) throws Exception {
		
		session.setAttribute("memberid", "1"); //삭제
		
		String memberid = (String) session.getAttribute("memberid");
		List<Order> order = this.shopService.getOrder1WList(memberid);
		model.addAttribute("order", order);
		List<Reciever> reciever = this.shopService.getReciever1WList(memberid);
		model.addAttribute("reciever", reciever);
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);
		

		return "/shop/OrderHistory";
	}

	@RequestMapping(value = "/history1M", method = RequestMethod.GET)
	public String history1M(Model model, HttpSession session) throws Exception {
		String memberid = (String) session.getAttribute("memberid");
		List<Order> order = this.shopService.getOrder1MList(memberid);
		model.addAttribute("order", order);
		List<Reciever> reciever = this.shopService.getReciever1MList(memberid);
		model.addAttribute("reciever", reciever);
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);

		return "/shop/OrderHistory";
	}

	@RequestMapping(value = "/history3M", method = RequestMethod.GET)
	public String history3M(Model model, HttpSession session) throws Exception {
		String memberid = (String) session.getAttribute("memberid");
		List<Order> order = this.shopService.getOrder3MList(memberid);
		model.addAttribute("order", order);
		List<Reciever> reciever = this.shopService.getReciever3MList(memberid);
		model.addAttribute("reciever", reciever);
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);

		return "/shop/OrderHistory";
	}

	@RequestMapping(value = "/history6M", method = RequestMethod.GET)
	public String history6M(Model model, HttpSession session) throws Exception {
		String memberid = (String) session.getAttribute("memberid");
		List<Order> order = this.shopService.getOrder6MList(memberid);
		model.addAttribute("order", order);
		List<Reciever> reciever = this.shopService.getReciever6MList(memberid);
		model.addAttribute("reciever", reciever);
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);

		return "/shop/OrderHistory";
	}

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String details(Model model, HttpSession session, int orderno) throws Exception {
		
		List<Order> order = this.shopService.getOrderInfo(orderno);
		model.addAttribute("order", order);

		Orderer orderer = this.shopService.getOrdererInfo(orderno);
		model.addAttribute("orderer", orderer);

		Reciever reciever = this.shopService.getRecieverInfo(orderno);
		model.addAttribute("reciever", reciever);

		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);
		
		return "/shop/OrderDetails";
	}
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String test(Model model, HttpSession session) throws Exception {
		
		session.setAttribute("memberid", "1"); //삭제
		
		String memberid = (String) session.getAttribute("memberid");
		
		List<Basket> basket = shopService.getBasketListN(memberid);
		model.addAttribute("basket", basket);
		
		List<Kit> kit = shopService.getGoodsList();
		model.addAttribute("kitList", kit);
		
		Delivery delivery = this.shopService.getCostInfo();
		model.addAttribute("delivery", delivery);
		

		return "/shop/Basket";
	}
	
	@RequestMapping(value = "/addbasket", method = RequestMethod.GET)
	public String addBasket(Basket basket, HttpServletRequest request) throws Exception {
		
		this.shopService.addBasketN(basket);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/details";
		 }
	}
	
	@RequestMapping(value = "/addbasketY", method = RequestMethod.GET)
	public String addBasketN(Basket basket, HttpServletRequest request, HttpSession session) throws Exception {
		
		this.shopService.addBasketY(basket);
		
		session.setAttribute("single", "y");
		
		return "redirect:order";
	}
	
	@RequestMapping(value = "/deletebasket", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, String bno) {

		this.shopService.deleteBasket(bno);
		return "redirect:basket";
	}
	
	@RequestMapping(value = "/orderbasket", method = RequestMethod.GET)
	public String orderbasket(HttpServletRequest request, Basket basket, HttpSession session) {
		this.shopService.updateBasket(basket);
		session.setAttribute("single", "n");
		return "redirect:order";
	}

}
