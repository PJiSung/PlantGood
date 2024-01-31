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

@WebServlet(name = "sendcontrol", urlPatterns = "/smartpot/sendcontrol")
public class sendcontrol extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public static String control = ""; //static 필드 선언부

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		control = request.getParameter("control");
		
		response.sendRedirect("controlpage"); //값만 받아서 바로 페이지로 보내줌

	}

}


