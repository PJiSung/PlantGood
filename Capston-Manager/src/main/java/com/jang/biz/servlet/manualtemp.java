package com.jang.biz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "manualtemp", urlPatterns = "/smartpot/manualtemp")
public class manualtemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //출력스트림 객체생성
		
		//html로 받아온 데이터
		String temmin = send.temmin;
		String temmax = send.temmax; 
		String control = sendcontrol.control;

		String rno = sendmn.rno; 


		if(control.equals("manual")) {
			control = "1";
		}else {
			control = "0";
		}
		
		//JSON data 아두이노로 전송
		
		out.print("{\"temmin\":" + temmin + ",\"temmax\":" + temmax + ",\"control\":" + control + ",\"rno\":" + rno + "}");

	}
}