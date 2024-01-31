package com.jang.biz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 수동 최소온도 최대온도 받는곳 */
@WebServlet(name = "send", urlPatterns = "/smartpot/send")
public class send extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	public static String temmin = "0"; //static 필드 선언부
	public static String temmax = "0";
	public static String control = "";


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		temmin = request.getParameter("temmin"); //jsp 키값을 받아옴
		temmax = request.getParameter("temmax"); //jsp 키값을 받아옴
		control = request.getParameter("control");
		if(control.equals("manual")) {
			if(temmin == null && temmax == null) {
				temmin = "0";
				temmax = "0";
			}
		}

		response.sendRedirect("controlpage"); //값만 받아서 바로 페이지로 보내줌
		
	}

}


