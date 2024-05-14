package com.mvp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//로그인 페이지 이동 GET
	@GetMapping("/login")
	public void loginGET() {
		logger.info("loginGET()");
	}
	
	//회원가입 페이지 이동 GET
	@GetMapping("/signUp")
	public void signUpGET() {
		logger.info("signUpGET()");
	}
	

}
