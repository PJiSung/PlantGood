package com.jang.biz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.jang.biz.model.Control;
import com.jang.biz.model.Plant;
import com.jang.biz.service.SmartPotService;

@WebServlet(name = "sendauto", urlPatterns = "/smartpot/sendauto")
public class sendauto extends HttpServlet {
	
	@Autowired
	private SmartPotService smartpotService;
	
	private static final long serialVersionUID = 1L;

	public static String temmin = "0"; //static 필드 선언부
	public static String temmax = "0";
	public static String kind="";
	public static int ledtime=0;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ledtime = 30;
		
		Control leddata = smartpotService.getControlInfo(); //led 시간 데이터
		ledtime = leddata.getLed();
		
		kind = request.getParameter("kind");
		Plant teminfo = smartpotService.getPlantNameInfo(kind); //식물별 최적온도 데이터

		temmin = teminfo.getTemmin();
		temmax = teminfo.getTemmax();

		response.sendRedirect("controlpage"); //값만 받아서 바로 페이지로 보내줌
		
	}

}


