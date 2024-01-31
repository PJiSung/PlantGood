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
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.biz.model.Kit;
import com.jang.biz.model.MemberImageVO;
import com.jang.biz.model.UserVO;
import com.jang.biz.service.AttachService;
import com.jang.biz.service.LoginService;
import com.jang.biz.service.ManagerService;
import com.jang.biz.util.AES256Util;

import net.coobird.thumbnailator.Thumbnails;

@Controller @RequestMapping("/member")
public class LoginController {
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginProc(@Valid UserVO userVO, BindingResult result, Model model, HttpSession session, HttpServletRequest request) {
		
		if (result.hasFieldErrors("memberid")||result.hasFieldErrors("passwd"))  {
			model.addAllAttributes(result.getModel());
			return "/member/login";
		}

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		UserVO loginUser = this.loginService.getUser(userVO.getMemberid());

		if(loginUser == null){
			model.addAttribute("memberid", "");
			model.addAttribute("msgCode", "등록되지 않은 아이디입니다..");
			return "/member/login";
		}
		else if(loginUser.getDel_yn() == 'y') {
			model.addAttribute("msgCode", "등록되지 않은 아이디입니다..");
			return "/member/login";
		}
		else if(passwordEncoder.matches(userVO.getPasswd(), loginUser.getPasswd())) {
			model.addAttribute("loginUser", loginUser);
			session.setAttribute("cno", loginUser.getCno());
			session.setAttribute("memberid", loginUser.getMemberid());
			session.setAttribute("userName", loginUser.getName());
			session.setAttribute("adminCk", loginUser.getAdminck());
			
			session.setAttribute("cno", loginUser.getCno());
			return "redirect:/shop/main";
		}
		else {
			model.addAttribute("memberid", "");
			model.addAttribute("msgCode", "패스워드가 일치하지 않습니다.");
			return "/member/login";
		}
	}
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String toUserEntryView( Model model) {
		model.addAttribute("userVO", new UserVO());
		return "/member/joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String onSubmit(@Valid UserVO userVO, BindingResult result, Model model, HttpServletRequest req) throws Exception {
		
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "/member/joinForm";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashPass = passwordEncoder.encode(userVO.getPasswd());
		userVO.setPasswd(hashPass);
		
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/jj/key3.txt");
		
		Path filePath = Paths.get(uploadFolder);
		String key = Files.readString(filePath);
		
		AES256Util aes256 = new AES256Util(key);
		
		String hashBirthday = aes256.aesEncode(userVO.getBirthday());
		userVO.setBirthday(hashBirthday);
		
		loginService.insertUser(userVO);
		loginService.UpdateJoincnt();
		userVO.setPasswd("");
		model.addAttribute("userVO", userVO);
		model.addAttribute("msgCode", "회원가입 완료");
		return "/member/login";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody 
	public String idCheck( HttpServletRequest request){

		String memberid = request.getParameter("memberid");
		JSONObject obj = new JSONObject();
		UserVO loginUser = this.loginService.getUser(memberid);

		if(loginUser != null){
			obj.put("msg", "false");
			return obj.toString();
		}
		else {
			obj.put("msg", "true");
			return obj.toString();
		}
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public String toUserEditView(@RequestParam(value = "cno", required = false, defaultValue = "0") int cno,
			HttpSession session, Model model, HttpServletRequest req) throws Exception {
		
		cno = (int) session.getAttribute("cno"); 
		model.addAttribute("user", loginService.getUserInfo(cno));
		String memberid = session.getAttribute("memberid").toString();
		UserVO loginUser = this.loginService.getUser(memberid);
		
		if(loginUser == null) {
			
			model.addAttribute("memberid", "");
			model.addAttribute("msgCode", "등록되지 않은 아이디입니다.");
			
			return "/member/login";
		}
		else {
			String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/jj/key3.txt");
			Path filePath = Paths.get(uploadFolder);
			String key = Files.readString(filePath);
			AES256Util aes256 = new AES256Util(key);
			String hashBirthday = loginUser.getBirthday();
			String decBirthday = aes256.aesDecode(hashBirthday);
			loginUser.setBirthday(decBirthday);
			model.addAttribute("userVO", loginUser);
			return "/member/editForm";
		}
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public String onEditSave( @Valid @ModelAttribute("UserVO") UserVO userVO,HttpSession session, BindingResult result, Model model, RedirectAttributes rea, HttpServletRequest req) throws Exception {
		
		if (result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "/member/editForm";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashPass = passwordEncoder.encode(userVO.getPasswd());
		userVO.setPasswd(hashPass);
		
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/jj/key3.txt");
		
		Path filePath = Paths.get(uploadFolder);
		String key = Files.readString(filePath);
		
		AES256Util aes256 = new AES256Util(key);
		
		String hashBirthday = aes256.aesEncode(userVO.getBirthday());
		userVO.setBirthday(hashBirthday);
		
		
		if(this.loginService.updateUser(userVO) != 0) {
			rea.addAttribute("cno", userVO.getCno());
			model.addAttribute("user", userVO);
			model.addAttribute("msgCode", "수정 완료.");
			return "/member/login";
		}
		else {
			model.addAttribute("msgCode", "수정 실패.");
			return "/member/editForm";
		}
	}
	
	@RequestMapping(value="/findId", method = RequestMethod.GET)
	public String toFindIdForm(Model model) {
		
		model.addAttribute("userVO", new UserVO());
		return "/member/findIdForm";
	}
	
	@RequestMapping(value="/findId", method = RequestMethod.POST)
	public String findIdSubmit(@Valid UserVO userVO, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("name")||result.hasFieldErrors("email")) {
			model.addAllAttributes(result.getModel());
			return "/member/findIdForm";
		}
		
		UserVO findUser = this.loginService.findId(userVO.getName(), userVO.getEmail());
		
		if(findUser == null) {
			result.rejectValue("name", "error.name.userVO","이름이 일치하지 않습니다.");
			model.addAllAttributes(result.getModel());
			return "/member/findIdForm";
		} 
		else if(userVO.getName().equals(findUser.getName()) && userVO.getEmail().equals(findUser.getEmail())) {
			model.addAttribute("findUser", findUser);
			return "/member/findIdSuccess";
		}
		else {
			result.rejectValue("email", "error.email.userVO","이메일이 일치하지 않습니다.");
			model.addAllAttributes(result.getModel());
			return "/member/findIdForm";
		} 
	}
	
	
	@RequestMapping(value="/findPass", method = RequestMethod.GET)
	public String toFindPassForm(Model model) {
		
		model.addAttribute("userVO", new UserVO());
		return "/member/findPassForm";
	}
	
	@RequestMapping(value="/findPass", method = RequestMethod.POST)
	public String findPassSubmit(@Valid UserVO userVO, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("memberid")||result.hasFieldErrors("email")) {
			model.addAllAttributes(result.getModel());
			return "/member/findPassForm";
		}
		
		UserVO findUser = this.loginService.findPass(userVO.getMemberid(), userVO.getEmail());

		
		if(findUser == null) {
			result.rejectValue("memberid", "error.memberid.userVO","아이디가 일치하지 않습니다.");
			model.addAllAttributes(result.getModel());
			return "/member/findPassForm";
		} 
		
		else if(userVO.getMemberid().equals(findUser.getMemberid()) && userVO.getEmail().equals(findUser.getEmail())) {
			model.addAttribute("findUser", findUser);
			return "/member/updatePassForm";
		}
		else {
			result.rejectValue("email","error.email.userVO","이메일이 일치하지 않습니다.");
			model.addAllAttributes(result.getModel());
			return "/member/findPassForm";
		}
	}

	@RequestMapping(value="/updatePass", method = RequestMethod.POST)
	public String updatePass(@Valid UserVO userVO, BindingResult result, Model model, HttpServletRequest req) throws Exception {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashPass = passwordEncoder.encode(userVO.getPasswd());
		userVO.setPasswd(hashPass);
		
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/jj/key3.txt");
		
		Path filePath = Paths.get(uploadFolder);
		String key = Files.readString(filePath);
		
		AES256Util aes256 = new AES256Util(key);
		
		if(result.hasFieldErrors("memberid")||result.hasFieldErrors("passwd")) {
			model.addAllAttributes(result.getModel());
			return "/member/updatePassForm";
		}
		if(this.loginService.updatePass(userVO) == 1) {
			model.addAttribute("memberid", userVO.getMemberid());
			return "/member/updatePassSuccess";
		}
		else {
			model.addAttribute("errMsg","변경에 실패했습니다.");
			return "/member/updatePassForm";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/shop/main";
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<MemberImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile, HttpServletRequest req) {
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<MemberImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}
		
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/memberimg");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<MemberImageVO> list = new ArrayList();
		
		// 향상된 for
				for(MultipartFile multipartFile : uploadFile) {
					
					/* 이미지 정보 객체 */
					MemberImageVO vo = new MemberImageVO();
					
					/* 파일 이름 */
					String uploadFileName = multipartFile.getOriginalFilename();	
					vo.setFileName(uploadFileName);
					vo.setUploadPath(datePath);
					
					/* uuid 적용 파일 이름 */
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

							//비율 
							double ratio = 3;
							//넓이 높이
							int width = (int) (bo_image.getWidth() / ratio);
							int height = (int) (bo_image.getHeight() / ratio);					
						
						
						Thumbnails.of(saveFile)
				        .size(width, height)
				        .toFile(thumbnailFile);
						
					} catch (Exception e) {
						e.printStackTrace();
					} 
					list.add(vo);
				}
				
				//기본 for
				for(int i = 0; i < uploadFile.length; i++) {
							
				}
				ResponseEntity<List<MemberImageVO>> result = new ResponseEntity<List<MemberImageVO>>(list, HttpStatus.OK);
				return result;
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName, HttpServletRequest req){
		
		String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/memberimg/");
		
		File file = new File(uploadFolder + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/* 고객 프로필 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList2", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<MemberImageVO>> getAttachList2(int cno) {

		return new ResponseEntity<List<MemberImageVO>>(attachService.getAttachList2(cno), HttpStatus.OK);

	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest req){
		
		File file = null;
		
		try {
			
			String uploadFolder = req.getSession().getServletContext().getRealPath("/").concat("resources/memberimg/");
			
			/* 썸네일 파일 삭제 */
			file = new File(uploadFolder + fileName);
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
	public String memberDeleteGET(Model model,HttpSession session)throws Exception {
		
		int cno = (int) session.getAttribute("cno"); 
		
		model.addAttribute("member", loginService.getMemberInfo(cno));
		
		
		return "/member/memberDelete";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(@RequestParam(value = "cno", required = false, defaultValue = "0") int cno,
			@RequestBody UserVO userVO,HttpSession session, Model model, HttpServletRequest request) throws Exception {

		cno = (int) session.getAttribute("cno");
		String memberid = (String) session.getAttribute("memberid");
		
		String inputPass = userVO.getPasswd();
		UserVO loginUser = this.loginService.getUser(userVO.getMemberid());
		String result = "";

		if(userVO.getMemberid() != null && userVO.getMemberid() != "") {	
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			
			if(passwordEncoder.matches(inputPass, loginUser.getPasswd())) {
		
				List<MemberImageVO> fileList = loginService.getMemberInfo(cno);

				if(fileList != null) {
					
					List<Path> pathList = new ArrayList();
					
					fileList.forEach(vo ->{
						
						String uploadFolder = request.getSession().getServletContext().getRealPath("/").concat("resources/memberimg/");
						
						// 원본 이미지
						Path path = Paths.get(uploadFolder, vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
						pathList.add(path);
						
						// 섬네일 이미지
						path = Paths.get(uploadFolder, vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
						pathList.add(path);
						
					});
					
					pathList.forEach(path ->{
						path.toFile().delete();
					});
					
				}
				loginService.deletememberinq(memberid);
				loginService.deleteImageAll(cno);
				loginService.memberDelete(userVO);
				result = "success";
			}
		}		
		return result;
	}
}
