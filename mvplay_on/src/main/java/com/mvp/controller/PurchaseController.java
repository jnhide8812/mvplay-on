package com.mvp.controller;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvp.model.MemberVO;
import com.mvp.model.PurchaseVO;
import com.mvp.service.MemberService;
import com.mvp.service.MovieService;
import com.mvp.service.PurchaseService;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class PurchaseController {
    private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);

    private IamportClient iamportClient;
    
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private MemberService memberService;
    
    
    @Autowired
    private MovieService movieservice;

    @Value("${imp.api.key}")
    private String apiKey;

    @Value("${imp.api.secretkey}")
    private String secretKey;

    @PostConstruct
    public void init() {
        this.iamportClient = new IamportClient();
    }

    // 개별 구매 페이지 이동
    @GetMapping("/purchase/vod")
    public String purchasePageGET(int movieId, Model model) {
    	
    	System.out.println("movieId" + movieId);
    	logger.info("vod");
        logger.info("purchasePageGET()........." + movieId);

        model.addAttribute("movieInfo", movieservice.movieGetDetail(movieId));
       
        return "/movie/movieDetail";
    }
    //소장
    @PostMapping("/purchase/vod")
    public String purchasePagePost(PurchaseVO pvo,MemberVO member, HttpServletRequest request) {
        System.out.println("구매 상세페이지 이동" + pvo);
        
        purchaseService.getBuyInfo(pvo);
       
       HttpSession session = request.getSession();
       
       try {
    	   MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setUpw("");
			session.setAttribute("member", memberLogin);
			
		} catch (Exception e) {
			 logger.error("Error during member login", e);
		
	}
       
        return "redirect:/movie/purchaseDetail"; 
    }

    @PostMapping("purchase/validation/{imp_uid}")
    @ResponseBody
    public IamportResponse<Payment> validateIamport(@PathVariable String imp_uid) throws IOException {
        IamportResponse<Payment> payment = null;
		payment = iamportClient.paymentByImpUid(imp_uid);
       System.out.println("payment"+payment);
        return payment;
    }

    @GetMapping("/purchase/payFail") // payFail 페이지에 대한 매핑
    public String payFail() {
        return "purchase/payFail"; // payFail.jsp가 있는 경로를 반환
    }
}
