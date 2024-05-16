package com.mvp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvp.purchase.PurchaseVO;
import com.mvp.service.PurchaseService;


@Controller
@RequestMapping(value = "/purchase/*")
public class PurcahseController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/*
	 * @Autowired private PurchaseService service;
	 */
	
	
	
	//개별 구매
	@GetMapping("/vod")
	public void purchasePageGET() {
		
		logger.info("vod");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
