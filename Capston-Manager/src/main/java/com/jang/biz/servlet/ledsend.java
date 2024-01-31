package com.jang.biz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.jang.biz.service.SmartPotService;


/*수동 LED on off 받는곳*/
@WebServlet(name = "ledsend", urlPatterns = "/smartpot/ledsend")
public class ledsend extends HttpServlet {
	
	@Autowired
	private SmartPotService smartpotService;
	
	private static final long serialVersionUID = 1L;

	public static String off = "0";
	public static String on = "0";
	public static String test = "";
	public static String memberiddata = ""; //static 필드 선언부
	public static String namedata = "";
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		off = request.getParameter("off");
		on = request.getParameter("on");
		test = request.getParameter("test");
		memberiddata = request.getParameter("memberiddata"); //jsp 키값을 받아옴
		namedata = request.getParameter("namedata");
		
		String memberid = memberiddata;
		String name = namedata;
		String contents;
		System.out.println(test);

		if(test.equals("on")) {
			contents = "LED 켜짐";
			smartpotService.leddataSave(memberid, name, contents);
		}else{
			contents = "LED 꺼짐";
			smartpotService.leddataSave(memberid, name, contents);
		}
		
		response.sendRedirect("controlpage"); //값만 받아서 바로 페이지로 보내줌
		
	}

}


