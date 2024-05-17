package com.mvp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//관리자 메인 페이지GET
	@GetMapping("/main")
	public void getAdminMain() throws Exception {		
		logger.info("get Admin Main");
	}
	
	//관리자 문의 게시판 GET 
	@GetMapping("/qna")
	public void getAdminQna() {
		logger.info("get admin qna");
	}
	
	//무비 추가 GET
	@GetMapping("/movieInsert")
	public void getMovieInsert() throws Exception {		
		logger.info("getMovieInsert");
	}	
	
	//관리자-구매 대여 관리GET
	@GetMapping("/purchase")
	public void getAdminPurchase() {
		logger.info("get admin purchase");
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/subscribe")
	public void getAdminSubscribe() {
		logger.info("get admin subscribe");
	}

}
