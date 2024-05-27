package com.mvp.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.Criteria;
import com.mvp.model.MemberVO;
import com.mvp.service.MemberService;

@Controller
@RequestMapping("/member")
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
	
	/*로그인*/
	@PostMapping(value = "login")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		
		//System.out.println("login 메서드 진입");
		//System.out.println("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		MemberVO lvo = memberservice.memberLogin(member);
		
		if(lvo == null) {								//일치하지 않는 아이디, 비밀번호 입력
			
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		
		session.setAttribute("member", lvo);   				//일치하는 아이디, 비밀번호(로그인 성공)
		
		
		return "redirect:/main";
	}
	/*메인페이지 로그아웃*/
	@GetMapping(value="logout.do")
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		
		logger.info("logoutMainGET메서드 진입");
		
		HttpSession session = request.getSession();
		
		return "redirect:/main";
	}
	
	/*비동기식 로그아웃 메서드*/
	@RequestMapping(value="logout.do", method=RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception{
		
		logger.info("비동기 로그아웃 메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	}
	
	
	//마이페이지 페이지 이동 GET
	@GetMapping("/myPage")
	public void myPageGET() {
		logger.info("myPageGET()");
	}

}
