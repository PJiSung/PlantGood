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

@WebServlet(name = "sendmn", urlPatterns = "/smartpot/sendmn")
public class sendmn extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public static String rno = "";//static 필드 선언부

}


