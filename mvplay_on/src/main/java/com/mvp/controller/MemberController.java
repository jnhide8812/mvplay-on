package com.mvp.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mvp.model.MemberVO;
import com.mvp.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	
	//회원가입 페이지 이동 GET
	@GetMapping("/signUp")
	public void signUpGET() {
		logger.info("signUpGET()");
	}
	
	//회원가입
	@PostMapping(value="/signUp")
	public String joinPOST(MemberVO member) throws Exception{ 
		logger.info("signup 진입");
		System.out.println("member : "+member);
		//회원가입 서비스 진행
		memberservice.memberJoin(member);
		logger.info("join Service 성공");
		return "redirect:/main";
	}

	//로그인 페이지 이동 GET
	@GetMapping("/login")
	public void loginGET() {
		logger.info("loginGET()");
	}
	


}
