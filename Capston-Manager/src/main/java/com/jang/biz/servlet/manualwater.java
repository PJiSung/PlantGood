package com.jang.biz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "manualwater", urlPatterns = "/smartpot/manualwater")
public class manualwater extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String rno = sendmn.rno; 
		String on = watersend.on;
		String off = watersend.off; 
		
		if(on == null) {
			on = "";
		}else if(off == null) {
			off = "";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //출력스트림 객체생성

		//JSON data 아두이노로 전송
		if(on.equals("on")) {
			out.print("{\"on\":" + on + ",\"off\":" + "0" + ",\"rno\":" + rno + "}");
		}
		if(off.equals("off")){
			out.print("{\"off\":" + off + ",\"on\":" + "0" + ",\"rno\":" + rno + "}");
		}
	}
}