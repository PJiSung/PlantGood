package com.jang.biz.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jang.biz.model.Control;
import com.jang.biz.model.Diary;
import com.jang.biz.model.Plant;
import com.jang.biz.model.PlantImageVO;
import com.jang.biz.model.Registration;
import com.jang.biz.model.SearchVO;
import com.jang.biz.service.AttachService;
import com.jang.biz.service.SmartPotService;
import com.jang.biz.servlet.send;
import com.jang.biz.servlet.sendmn;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/smartpot")
public class SmartPotController {
	
	@Autowired
	private SmartPotService smartpotService;
	
	@Autowired
	private AttachService attachService;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model, HttpSession session) throws Exception {

		return "/smartpot/Control";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {
		
		String memberid = (String) session.getAttribute("memberid");
		
		List<Registration> reg = this.smartpotService.getRegistrationList(memberid);
		model.addAttribute("reg",reg);
		
		return "/smartpot/Main";
	}
	
	@RequestMapping(value = "/deleteplant", method = RequestMethod.POST)
	public String deleteplant(Model model, HttpSession session,int rno) throws Exception {
		
		this.smartpotService.DeletePlant(rno);
		
		return "redirect:main";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String main(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session) throws Exception {
		
		List<Plant> plant = this.smartpotService.getSearchList(searchVO);
		model.addAttribute("plant", plant);

		return "/smartpot/Selection";
	}
	
	@RequestMapping(value = "/searchlist", method = RequestMethod.GET)
	public String searchlist(@ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {
		
		List<Plant> plant = this.smartpotService.getSearchList(searchVO);
		model.addAttribute("plant", plant);

		return "/smartpot/SearchList";
	}
	
	@RequestMapping("/plantlist")
	public String plantlist(String category, HttpSession session, Model model) throws Exception {

		List<Plant> plant = this.smartpotService.getPlantList(category);
		model.addAttribute("plant",plant);
		
		return "/smartpot/PlantList";
	}
	
	@RequestMapping("/plantinfo")
	public String plantinfo(int pno, HttpSession session, Model model) throws Exception {

		Plant plant = this.smartpotService.getPlantInfo(pno);
		model.addAttribute("plant",plant);
		
		return "/smartpot/PlantInfo";
	}
	
	@RequestMapping("/ragistration")
	public String ragistration(int pno,HttpSession session, Model model) throws Exception {
		
		Plant plant = this.smartpotService.getPlantInfo(pno);
		model.addAttribute("plant",plant);
		
		return "/smartpot/Registration";
	}
	
	@RequestMapping("/addreg")
	public String addreg(@ModelAttribute("Plant") Registration reg,Plant plant,Control control, HttpSession session, Model model) throws Exception {
		
		smartpotService.addRegistration(reg);
		smartpotService.addControl(control);
		session.setAttribute("category", plant.getCategory());
		session.setAttribute("name", reg.getName());
		
		return "redirect:main";
	}
	
	@RequestMapping("/condition")
	public String condition(@RequestParam(value = "rno", required = false, defaultValue = "0") int rno,
			String kind,Plant plant,Registration reg, HttpSession session, Model model, HttpServletRequest request) throws Exception {
		
		if(reg.getName()!=null) {
		session.setAttribute("name",reg.getName());
		}
		String memberid = (String) session.getAttribute("memberid");
		String name = (String) session.getAttribute("name");
		
		sendmn.rno = ""+rno;
		
		reg = this.smartpotService.getRegistration(memberid,name);
		model.addAttribute("reg", reg);
		
		
		model.addAttribute("reg3", smartpotService.getimg(rno));
		
		session.setAttribute("rno", rno);
		
		if(plant.getCategory()!=null) {
		this.smartpotService.getCategoryInfo(kind);
		session.setAttribute("category", plant.getCategory());
		}
		
		Control thdata = smartpotService.gettemphumidata();
		String[] saveTem = (String[])session.getAttribute("Tem");
		String[] saveHum = (String[])session.getAttribute("Hum");
		String[] Tem = new String[7];
		String[] Hum = new String[7];
		
		
		if(saveTem != null) {
			for(int i=0; i<6; i++) {
				
				saveTem[6] = thdata.getTemperature();
				saveTem[i] = saveTem[i+1];
				
				saveHum[6] = thdata.getHumidity();
				saveHum[i] = saveHum[i+1];
				
				session.setAttribute("Tem", saveTem);
				model.addAttribute("Tem",saveTem);
				
				session.setAttribute("Hum", saveHum);
				model.addAttribute("Hum", saveHum);
			}
		}else {
			for(int i=0; i<6; i++) {
				
				Tem[6] = thdata.getTemperature();	
				Tem[i] = Tem[i+1];
				
				Hum[6] = thdata.getHumidity();
				Hum[i] = Hum[i+1];
				
				session.setAttribute("Tem",Tem);
				model.addAttribute("Tem",Tem);
				
				session.setAttribute("Hum", Hum);
				model.addAttribute("Hum",Hum);
			}
		}
		model.addAttribute("thlist", thdata);
		
		return "/smartpot/PlantCondition";
	}
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, HttpSession session) throws Exception {
		
		String memberid = (String) session.getAttribute("memberid");
		String name = (String) session.getAttribute("name");
		
		Diary diary = this.smartpotService.getlastDay(memberid, name);
		
		session.setAttribute("count", diary.getDay());
			
		Registration reg = this.smartpotService.getRegistration(memberid,name);
		model.addAttribute("reg", reg);
		
		List<Diary> diarylist = this.smartpotService.getDiaryList(memberid, name);
		model.addAttribute("diarylist",diarylist);
		
		int rno = (int) session.getAttribute("rno");
		model.addAttribute("reg3", smartpotService.getimg(rno));
		
		List<Diary> diaryinfo = this.smartpotService.getlastContents(memberid, name);
		model.addAttribute("diaryinfo",diaryinfo);

		return "/smartpot/Diary";
	}
	
	@RequestMapping(value = "/daylist", method = RequestMethod.POST)
	public String daylist(String name, String regdate,Model model, HttpSession session) throws Exception {
		
		String memberid = (String) session.getAttribute("memberid");
		
		System.out.println("ID = "+memberid+" NAME = "+name+" REGDATE = "+regdate);
		
		Registration reg = this.smartpotService.getRegistration(memberid,name);
		model.addAttribute("reg", reg);
		
		List<Diary> diarylist = this.smartpotService.getDiaryList(memberid, name);
		model.addAttribute("diarylist",diarylist);
		
		List<Diary> diaryinfo = this.smartpotService.getContentsList(memberid, name, regdate);
		model.addAttribute("diaryinfo",diaryinfo);
		
		int rno = (int) session.getAttribute("rno");
		model.addAttribute("reg3", smartpotService.getimg(rno));
		
		return "/smartpot/Diary";
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName, HttpServletRequest req) {

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/plantimg/");
		
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
	@GetMapping(value = "/getAttachList3", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlantImageVO>> getAttachList3(int rno) {

		return new ResponseEntity<List<PlantImageVO>>(attachService.getAttachList3(rno), HttpStatus.OK);
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlantImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile, HttpServletRequest req) {

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

				List<PlantImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}
		
		/* 현재 구동중인 서버의 절대경로 */
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/plantimg");

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
		List<PlantImageVO> list = new ArrayList();

		for (MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			PlantImageVO vo = new PlantImageVO();

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
		ResponseEntity<List<PlantImageVO>> result = new ResponseEntity<List<PlantImageVO>>(list, HttpStatus.OK);
		return result;
	}
	
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest req) {

		// logger.info("deleteFile........" + fileName);

		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/plantimg/");
		
		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File(uploadFolder + fileName);

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			// logger.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/temhum", method = RequestMethod.GET)
	public String temhum(Model model, HttpSession session) throws Exception {
		
		Control thdata = smartpotService.gettemphumidata();
		String[] saveTem = (String[])session.getAttribute("Tem");
		String[] saveHum = (String[])session.getAttribute("Hum");
		String[] Tem = new String[7];
		String[] Hum = new String[7];
		
		if(saveTem != null) {
			for(int i=0; i<6; i++) {
				
				saveTem[6] = thdata.getTemperature();
				saveTem[i] = saveTem[i+1];
				
				saveHum[6] = thdata.getHumidity();
				saveHum[i] = saveHum[i+1];
				
				session.setAttribute("Tem", saveTem);
				model.addAttribute("Tem",saveTem);
				
				session.setAttribute("Hum", saveHum);
				model.addAttribute("Hum", saveHum);
			}
		}else {
			for(int i=0; i<6; i++) {
				
				Tem[6] = thdata.getTemperature();	
				Tem[i] = Tem[i+1];
				
				Hum[6] = thdata.getHumidity();
				Hum[i] = Hum[i+1];
				
				session.setAttribute("Tem",Tem);
				model.addAttribute("Tem",Tem);
				
				session.setAttribute("Hum", Hum);
				model.addAttribute("Hum",Hum);
			}
		}
		model.addAttribute("thlist", thdata);
		
		return "/smartpot/temhum";
	}
	
	@RequestMapping(value = "/controlpage", method = RequestMethod.GET)
	public String controlpage( Model model, HttpSession session) throws Exception {
		
		String control = (String) session.getAttribute("control");
		
		if(control != null) {
			model.addAttribute("control", control);
		}
		
		Control controlinfo = smartpotService.getControlInfo();
		model.addAttribute("controlinfo", controlinfo);

		
		int rno = (int) session.getAttribute("rno");
		Registration reg3 = smartpotService.getimg(rno);
		model.addAttribute("reg3", reg3);
		
		Plant plant = smartpotService.getPlantNameInfo(reg3.getKind());
		model.addAttribute("plant", plant);
		
		return "/smartpot/ControlPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.POST, produces = {"application/json"})
	public Map<String, Object> makerepo(@RequestBody Map<String, Object> info, Model model,HttpServletRequest request, HttpSession session) {
		
		//System.out.println("물수위 : " + info.get("suwi"));
		System.out.println("토양수분값 : " + info.get("toyang"));
		System.out.println("temp value:" + info.get("temperature") + " / humi value: " + info.get("humidity"));

		//smartpotService.temphumidataSave(info.get("temperature").toString(), info.get("humidity").toString());
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("result", "success!!");//쓰레기값
		return retVal;
	}

	@RequestMapping(value = "/ajaxtest2", method = RequestMethod.POST, produces = {"application/json"})
	public Map<String, Object> makerepo2(@RequestBody Map<String, Object> info,HttpSession session) {
		System.out.println(info.get("rno"));
		
		int getrno = (int) Integer.parseInt((String) info.get("rno"));
		
		Registration dbrno = smartpotService.dbgetrno(getrno);
		
		String memberid = dbrno.getMemberid();
		String name = dbrno.getName();
		String contents = (String) info.get("ledonoffmsg").toString();
		
		
		smartpotService.leddataSave(memberid, name, contents);


		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		return retVal;
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest3", method = RequestMethod.POST, produces = {"application/json"})
	public Map<String, Object> makerepo3(@RequestBody Map<String, Object> info) {

		int getrno = (int) Integer.parseInt((String) info.get("rno"));
		
		Registration dbrno = smartpotService.dbgetrno(getrno);
		
		String memberid = dbrno.getMemberid();
		String name = dbrno.getName();
		String contents = info.get("pumpmsg").toString();

		smartpotService.leddataSave(memberid, name, contents);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("result", "success!!"); //쓰레기값
		return retVal;
	}
		
	@ResponseBody
	@RequestMapping(value = "/ajaxtest4", method = RequestMethod.POST, produces = {"application/json"})
	public Map<String, Object> makerepo4(@RequestBody Map<String, Object> info, HttpSession session) {
		
		int getrno = (int) Integer.parseInt((String) info.get("rno"));
		
		Registration dbrno = smartpotService.dbgetrno(getrno);
		
		String memberid = dbrno.getMemberid();
		String name = dbrno.getName();
		String contents = info.get("fanmsg").toString();
		
		
		smartpotService.leddataSave(memberid, name, contents);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("result", "success!!"); //쓰레기값
		return retVal;
	}
	
	@RequestMapping(value = "/ControlWhether", method = RequestMethod.GET)
	public String ControlWhether(HttpServletRequest request, String control,HttpSession session) throws Exception {
		
		session.setAttribute("control", control);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/controlpage";
		 }
	}
	
	@RequestMapping(value = "/LedWhether", method = RequestMethod.GET)
	public String LedWhether(HttpServletRequest request, String led,HttpSession session) throws Exception {
		
		session.setAttribute("led", led);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/controlpage";
		 }
	}
	
	@RequestMapping(value = "/PumpWhether", method = RequestMethod.GET)
	public String PumpWhether(HttpServletRequest request, String pump,HttpSession session) throws Exception {
		
		session.setAttribute("pump", pump);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/controlpage";
		 }
	}
}
