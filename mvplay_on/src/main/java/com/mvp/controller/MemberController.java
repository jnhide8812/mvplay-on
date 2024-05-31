package com.mvp.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원가입 페이지 이동 GET
	@GetMapping("/signUp")
	public void signUpGET() {
		logger.info("signUpGET()");
	}

	// 회원가입
	@PostMapping(value = "/signUp")
	public String joinPOST(MemberVO member) throws Exception {
		logger.info("signup 진입");

		String rawPw = ""; // 인코딩 전 비번
		String encodePw = ""; // 인코딩 후 비번

		rawPw = member.getUpw();
		encodePw = pwEncoder.encode(rawPw);
		member.setUpw(encodePw);

		// 회원가입 서비스 진행
		memberservice.memberJoin(member);
		logger.info("join Service 성공");
		return "redirect:/main";
	}
	
	/* 이메일 인증 */
    @GetMapping("/mailCheck")
    @ResponseBody
    public String getMailCheck(String userId) throws Exception {
        
        // 인증번호 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        String num = Integer.toString(checkNum);
        
        logger.info("인증번호 : " + num);
        
        return num;
        
    }

	// 로그인 페이지 이동 GET
	@GetMapping("/login")
	public void loginGET() {
		logger.info("loginGET()");
	}

	/* 로그인 */
	@PostMapping(value = "login")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr, Model model)
			throws Exception {

		HttpSession session = request.getSession();

		String rawPw = "";
		String encodePw = "";

		MemberVO lvo = memberservice.memberLogin(member);

		if (lvo != null) { // 일치하지 않는 아이디, 비밀번호 입력
			rawPw = member.getUpw();
			encodePw = lvo.getUpw();

			if (true == pwEncoder.matches(rawPw, encodePw)) {

				lvo.setUpw(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", lvo); // session에 사용자의 정보 저장
				return "redirect:/main";

			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}

		} else {// 로그인 실패
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}

	}

	/* 메인페이지 로그아웃 */
	@GetMapping(value = "logout.do")
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		return "redirect:/main";
	}

	/* 비동기식 로그아웃 메서드 */
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {

		logger.info("비동기 로그아웃 메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();
	}

	// 마이페이지 페이지 이동 GET
	@GetMapping("/myPage")
	public void myPageGET() {
		logger.info("myPageGET()");
	}

}
