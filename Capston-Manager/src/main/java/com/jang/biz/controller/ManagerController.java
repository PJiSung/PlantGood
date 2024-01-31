package com.jang.biz.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.biz.model.Account;
import com.jang.biz.model.AttFileVO;
import com.jang.biz.model.AttachImageVO;
import com.jang.biz.model.Customer;
import com.jang.biz.model.Delivery;
import com.jang.biz.model.Inquiry;
import com.jang.biz.model.Kit;
import com.jang.biz.model.Manager;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.Order;
import com.jang.biz.model.Orderer;
import com.jang.biz.model.Plant;
import com.jang.biz.model.Processing;
import com.jang.biz.model.Reciever;
import com.jang.biz.model.ReplyVO;
import com.jang.biz.model.SearchVO;
import com.jang.biz.service.AttachService;
import com.jang.biz.service.ManagerService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/Manager")
public class ManagerController {

	@Autowired
	private AttachService attachService;

	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		List<Manager> main = this.managerService.getMainList();
		model.addAttribute("main", main);
		return "Manager/index";
	}

	@Scheduled(cron = "0 0 0 * * *")
	public void timer() {
		managerService.addMain();
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {

		Order neworcnt = this.managerService.NewOrdercnt();
		model.addAttribute("neworcnt", neworcnt);
		session.setAttribute("notice1", neworcnt.getNeworcnt());

		Processing cancelorcnt = this.managerService.CancelOrdercnt();
		model.addAttribute("cancelorcnt", cancelorcnt);
		session.setAttribute("notice2", cancelorcnt.getCancelorcnt());

		Inquiry replywaitcnt = this.managerService.ReplyWaiting();
		model.addAttribute("replywaitcnt", replywaitcnt);
		session.setAttribute("notice3", replywaitcnt.getReplywaitcnt());

		List<Manager> main = this.managerService.getMainList();
		model.addAttribute("main", main);

		List<Manager> order7 = this.managerService.get7orderList();
		model.addAttribute("order7", order7);

		List<Manager> take7 = this.managerService.get7takeList();
		model.addAttribute("take7", take7);

		List<Manager> visitcnt7 = this.managerService.get7visitcntList();
		model.addAttribute("visitcnt7", visitcnt7);

		List<Manager> joincnt7 = this.managerService.get7joincntList();
		model.addAttribute("joincnt7", joincnt7);

		List<Manager> inquirycnt7 = this.managerService.get7inquirycntList();
		model.addAttribute("inquirycnt7", inquirycnt7);

		List<Manager> order30 = this.managerService.get30orderList();
		model.addAttribute("order30", order30);

		List<Manager> take30 = this.managerService.get30takeList();
		model.addAttribute("take30", take30);

		List<Manager> visitcnt30 = this.managerService.get30visitcntList();
		model.addAttribute("visitcnt30", visitcnt30);

		List<Manager> joincnt30 = this.managerService.get30joincntList();
		model.addAttribute("joincnt30", joincnt30);

		List<Manager> inquirycnt30 = this.managerService.get30inquirycntList();
		model.addAttribute("inquirycnt30", inquirycnt30);

		return "/Manager/Main";
	}
	
	@RequestMapping(value = "/plant", method = RequestMethod.GET)
	public String getMtRoomView(@ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {
		
		List<Plant> plant = this.managerService.getPlantList(searchVO);
		model.addAttribute("plant", plant);

		StringBuffer pageUrl = managerService.getPlantPageUrl(searchVO);
		model.addAttribute("pageHttp", pageUrl);

		Plant totalcnt = this.managerService.plantcnt();
		model.addAttribute("totalcnt", totalcnt);
		
		return "/Manager/Plant";
	}
	
	@RequestMapping(value = "/deleteplant")
	public String deleteplant(HttpServletRequest request) {

		String[] cBox = request.getParameterValues("delete");
		int size = cBox.length;
		for (int i = 0; i < size; i++) {
			Plant plant = managerService.getPlant(cBox[i]);
			String filename = plant.getImage();
			String fileFolder = request.getSession().getServletContext().getRealPath("/").concat("resources/img/Plant/");;
			File filePath= new File(fileFolder+filename);
			if(filePath.delete()) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			 }
			System.out.println(filePath);
			managerService.deletePlant(cBox[i]);
		}
		return "redirect:plant";
	}

	@RequestMapping(value = "/addplant", method = RequestMethod.GET)
	public String addplant(Model model) throws Exception {
		return "/Manager/Plantadd";
	}

	@RequestMapping(value = "/addplant", method = RequestMethod.POST)
	public String plantadd(@ModelAttribute("Plant") Plant plant, Model model, HttpSession session,
			MultipartHttpServletRequest mRequest) throws Exception {

		ServletContext servletContect = mRequest.getSession().getServletContext();
		String webappRoot = servletContect.getRealPath("/");
		String relativeFolder = File.separator + "resources" + File.separator + "img" + File.separator + "Plant" + File.separator;

		List<MultipartFile> fileList = mRequest.getFiles("file_1");

		for (MultipartFile mf : fileList) {
			if (!mf.isEmpty()) {

				String originFileName = mf.getOriginalFilename();

				plant.setImage(originFileName);

				System.out.println("New Pic=" + plant.getImage());
				String safeFile = webappRoot + relativeFolder + originFileName;

				try {
					mf.transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		managerService.AddPlant(plant);
		return "redirect:plant";
	}

	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String customer(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session)
			throws Exception {
		List<Customer> customer = this.managerService.getCustomerList(searchVO);
		model.addAttribute("customer", customer);

		StringBuffer pageUrl = managerService.getCustomerPageUrl(searchVO);
		model.addAttribute("pageHttp", pageUrl);

		List<Customer> totalcnt = this.managerService.totalcnt();
		model.addAttribute("totalcnt", totalcnt);

		List<Customer> generalcnt = this.managerService.generalcnt();
		model.addAttribute("generalcnt", generalcnt);

		List<Customer> managercnt = this.managerService.managercnt();
		model.addAttribute("managercnt", managercnt);

		return "/Manager/Customer";
	}

	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request) {

		String[] cBox = request.getParameterValues("delete");
		int size = cBox.length;
		for (int i = 0; i < size; i++) {
			managerService.deleteCustomer(cBox[i]);
			System.out.print(cBox[0]);
		}
		return "redirect:customer";
	}

	@RequestMapping("/customerinfo")
	public String customerinfo(@RequestParam(value = "cno", required = false, defaultValue = "0") int cno,
			HttpSession session, Model model) throws Exception {

		model.addAttribute("customer", managerService.getCustomerInfo(cno));

		Inquiry postcnt = this.managerService.postcnt(cno);
		model.addAttribute("postcnt", postcnt);

		Order ordercnt = this.managerService.cusordercnt(cno);
		model.addAttribute("ordercnt", ordercnt);

		return "/Manager/CustomerInfo";
	}

	@RequestMapping(value = "/customermodify", method = RequestMethod.POST)
	public String customermodify(@ModelAttribute("customer") Customer customer, MultipartHttpServletRequest request,
			RedirectAttributes rea) {
		managerService.updateCustomer(customer);
		rea.addAttribute("cno", customer.getCno());
		return "redirect:customer";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session)
			throws Exception {

		List<Order> order = this.managerService.getOrderList(searchVO);
		model.addAttribute("order", order);

		StringBuffer pageUrl = managerService.getOrderPageUrl(searchVO);
		model.addAttribute("pageHttp", pageUrl);

		List<Order> ordercnt = this.managerService.ordercnt();
		model.addAttribute("ordercnt", ordercnt);

		return "/Manager/Order";
	}

	@RequestMapping(value = "/deleteorder")
	public String deleteorder(HttpServletRequest request) {

		String[] cBox = request.getParameterValues("delete");
		int size = cBox.length;
		for (int i = 0; i < size; i++) {
			managerService.deleteOrder(cBox[i]);
			managerService.deleteOrderer(cBox[i]);
			managerService.deleteProcessing(cBox[i]);
			managerService.deleteReciever(cBox[i]);
		}
		return "redirect:order";
	}

	@RequestMapping("/orderinfo")
	public String orderinfo(@RequestParam(value = "ono", required = false, defaultValue = "0") int ono,
			HttpSession session, Model model) throws Exception {
		Order order = this.managerService.getOrderInfo(ono);
		model.addAttribute("order", order);

		Orderer orderer = this.managerService.getOrdererInfo(ono);
		model.addAttribute("orderer", orderer);

		Processing processing = this.managerService.getProcessingInfo(ono);
		model.addAttribute("processing", processing);

		Reciever reciever = this.managerService.getRecieverInfo(ono);
		model.addAttribute("reciever", reciever);

		return "/Manager/OrderInfo";
	}

	@RequestMapping(value = "/ordermodify", method = RequestMethod.POST)
	public String ordermodify(@ModelAttribute("order") Order order, Reciever reciever,
			MultipartHttpServletRequest request, RedirectAttributes rea) {
		managerService.updateOrder(order);
		managerService.updateReciever(reciever);
		return "redirect:order";
	}

	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(Model model) throws Exception {
		List<Account> account = this.managerService.getAccountList();
		model.addAttribute("account", account);

		List<Delivery> delivery = this.managerService.getDeliveryList();
		model.addAttribute("delivery", delivery);

		return "Manager/Account";
	}

	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(@RequestParam(value = "ano", required = false) int ano) throws Exception {
		managerService.deleteAccount(ano);
		return "redirect:account";
	}

	@RequestMapping(value = "/accountmodify", method = RequestMethod.POST)
	public String update(@Valid Account account, BindingResult result, RedirectAttributes rea) throws Exception {
		managerService.updateAccount(account);
		return "redirect:account";
	}

	@RequestMapping(value = "/addSave", method = RequestMethod.POST)
	public String add(@Valid Account account, BindingResult result, RedirectAttributes rea) throws Exception {
		managerService.addAccount(account);
		return "redirect:account";
	}

	@RequestMapping(value = "/deliverymodify", method = RequestMethod.POST)
	public String deliverymodify(@ModelAttribute("delivery") Delivery delivery, Reciever reciever,
			MultipartHttpServletRequest request, RedirectAttributes rea) {
		managerService.updateDelivery(delivery);
		return "redirect:account";
	}

	@RequestMapping(value = "/processingmodify", method = RequestMethod.POST)
	public String processingmodify(@Valid Processing processing, Order order, BindingResult result,
			RedirectAttributes rea) throws Exception {
		managerService.updateOrderstate(order);
		System.out.print("실행");
		switch (order.getOrderstate()) {
		case "결제완료":
			managerService.updatePaymentcom(processing);
			break;
		case "배송완료":
			managerService.updateDeliverycom(processing);
			break;
		case "주문취소":
			managerService.updateCancel(processing);
			break;
		}
		return "redirect:order";
	}

	@RequestMapping(value = "/kitmain", method = RequestMethod.GET)
	public String kitmain(Model model) throws Exception {

		List<Kit> kit = managerService.getKitList();
		model.addAttribute("kitList", kit);

		return "/Manager/kitmain";
	}

	@RequestMapping(value = "/kitadd", method = RequestMethod.GET)
	public String kitadd() {
		return "/Manager/kitadd";
	}

	@RequestMapping(value = "/kitadd", method = RequestMethod.POST)
	public String kitaddPOST(@ModelAttribute("Kit") Kit kit) {

		managerService.addKit(kit);

		return "redirect:kitmain";
	}

	@RequestMapping("/kitinfo")
	public String kitinfo(@RequestParam(value = "kno", required = false, defaultValue = "0") int kno,
			HttpSession session, Model model) throws Exception {

		model.addAttribute("kit", managerService.getKitInfo(kno));

		return "/Manager/kitinfo";
	}

	@RequestMapping(value = "/kitmodify", method = RequestMethod.POST)
	public String kitModify(@ModelAttribute("Kit") Kit kit, RedirectAttributes rea) {

		managerService.updateKit(kit);
		rea.addAttribute("kno", kit.getKno());
		return "redirect:kitmain";
	}

	@RequestMapping(value = "/kitdelete")
	public String kitdelete(int kno, HttpServletRequest request) {

		List<AttachImageVO> fileList = managerService.getAttachInfo(kno);

		if (fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo -> {

				String uploadFolder = request.getSession().getServletContext().getRealPath("/").concat("resources/img");

				// 원본 이미지
				Path path = Paths.get(uploadFolder, vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get(uploadFolder, vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
			});
			pathList.forEach(path -> {
				path.toFile().delete();
			});

		}
		managerService.deleteKit(kno);

		return "redirect:kitmain";
	}

	/* 문의 */

	@RequestMapping(value = "/inqmain", method = RequestMethod.GET)
	public String inqmain(@ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {

		List<Inquiry> inq = managerService.getInquiryList(searchVO);
		model.addAttribute("inqList", inq);

		StringBuffer pageUrl = managerService.getPageUrl(searchVO);
		model.addAttribute("pageHttp", pageUrl);

		return "/Manager/inqmain";
	}

	/* 문의 상세보기 */
	@RequestMapping("/inqinfo")
	public String inqinfo(@RequestParam(value = "ino", required = false, defaultValue = "0") int ino,
			@RequestParam(value = "kno", required = false, defaultValue = "0") int kno, HttpSession session,
			Model model) throws Exception {

		session.setAttribute("managerid", "관리자");

		Kit kit = managerService.getKitInfo(kno);
		Inquiry inq = managerService.getInquiryInfo(ino);

		List<ReplyVO> reply = managerService.getReplyList(ino);
		List<AttFileVO> fileList = managerService.getFileList(ino);

		model.addAttribute("inq", inq);
		model.addAttribute("kit", kit);
		model.addAttribute("replyList", reply);
		model.addAttribute("fileList", fileList);

		return "/Manager/inqinfo";
	}

	@RequestMapping(value = "/inqdelete")
	public String inqdelete(int ino, HttpServletRequest request) {

		managerService.deleteinq(ino);
		managerService.deleteinqreply(ino);

		return "redirect:inqmain";
	}

	@RequestMapping("/writeReply")
	public String replyWriteProc(@ModelAttribute("reply") ReplyVO reply, RedirectAttributes rea) {

		if (reply.getContents().isEmpty()) {
			rea.addAttribute("errCode", "1");
		} else {
			managerService.writeReply(reply);
		}

		rea.addAttribute("ino", reply.getIno());

		return "redirect:inqinfo";
	}

	@RequestMapping(value = "/filedown")
	@ResponseBody
	public byte[] downProcess(HttpServletResponse response, @RequestParam String fileName, HttpServletRequest req)
			throws IOException {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/attfile/");

		File file = new File(uploadFolder + fileName);
		byte[] bytes = FileCopyUtils.copyToByteArray(file);

		String fn = new String(file.getName().getBytes(), "iso_8859_1");

		response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
		response.setContentLength(bytes.length);

		return bytes;
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile,
			HttpServletRequest req) {

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
		}

		/* 현재 구동중인 서버의 절대경로 */
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
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);
				// 비율
				double ratio = 1;
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

	@GetMapping("/display2")
	public ResponseEntity<byte[]> getImage2(String fileName, HttpServletRequest req) {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/memberimg/");

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

	/* 상품 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int kno) {

		return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(kno), HttpStatus.OK);

	}

	/* 고객 프로필 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList2", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<MemberImageVO>> getAttachList2(int cno) {

		return new ResponseEntity<List<MemberImageVO>>(attachService.getAttachList2(cno), HttpStatus.OK);

	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest req) {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/img/");

		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File(uploadFolder + fileName);

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		}

		return new ResponseEntity<String>("success", HttpStatus.OK);

	}
}
