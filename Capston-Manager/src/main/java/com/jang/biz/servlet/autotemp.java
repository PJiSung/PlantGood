package com.jang.biz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "autotemp", urlPatterns = "/smartpot/autotemp")
public class autotemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rno = sendmn.rno; 
		
		String temmin = sendauto.temmin;
		String temmax = sendauto.temmax; 
		String control = sendcontrol.control;
		
		if(control.equals("manual")) {
			control = "1";
		}else {
			control = "0";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //출력스트림 객체생성
		
		//JSON data 아두이노로 전송

		out.print("{\"temmin\":" + temmin + ",\"temmax\":" + temmax + ",\"control\":" + control + ",\"rno\":" + rno + "}");
	}
}