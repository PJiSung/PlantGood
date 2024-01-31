package com.jang.biz.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jang.biz.service.ShopService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class VisitCounter implements HttpSessionListener {
	
	@Autowired private ShopService shopService;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		shopService.Visitcnt();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}

}
