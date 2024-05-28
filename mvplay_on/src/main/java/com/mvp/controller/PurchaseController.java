package com.mvp.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import com.mvp.model.SubscribtionVO;
import com.mvp.service.MemberService;
import com.mvp.service.MovieService;
import com.mvp.service.PurchaseService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


import lombok.RequiredArgsConstructor;

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
        this.iamportClient = new IamportClient(apiKey, secretKey);
    }

    // 개별 구매 페이지 이동
    @GetMapping("/purchase/vod")
    public String purchasePageGET(int movieId, Model model) {
        System.out.println("movieId" + movieId);
        logger.info("vod");
        logger.info("purchasePageGET()........." + movieId);

        model.addAttribute("movieInfo", movieservice.movieGetDetail(movieId));
        return "redirect:/movie/purchaseDetail"; 
    }

    // 소장
    @PostMapping("/purchase/vod")
    public String purchasePagePost(PurchaseVO pvo, MemberVO member, HttpServletRequest request) {
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
        //payment = iamportClient.paymentByImpUid(imp_uid);
        System.out.println("payment" + payment);
        return payment;
    }

    @GetMapping("/purchase/payFail") // payFail 페이지에 대한 매핑
    public void payFail() {}

    // 구독
    @GetMapping("/purchase/subscribe1")
    public void subscribe1Page(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = "daewoo"; // 임시 로그인
        session.setAttribute("userId", userId);
        logger.info("purchase");
    }

    @PostMapping("/purchase/subscribe1")
    public String postSubscribe1(HttpServletRequest request, MemberVO member, SubscribtionVO svo, Model model) {
        HttpSession session = request.getSession();
        
        String userId = (String) session.getAttribute("userId");
        String upw = request.getParameter("upw");
        String ubirth = request.getParameter("ubirth");
        
        System.out.println("포스트 구독");
        
        String action = request.getParameter("action");
        logger.info("POST movie/subscribeMain - Action: " + action);

        String goods = request.getParameter("goods");
        String period = request.getParameter("period");
        
        String ugrade = "1"; // Default 값 (일반회원)
        session.setAttribute("ugrade", ugrade);
        session.setAttribute("userId", userId);
        session.setAttribute("upw", upw);
        session.setAttribute("ubirth", ubirth);

        System.out.println("goods: " + goods + " : " + period);

        if (goods != null && period != null) {
            session.setAttribute("goods", goods);
            session.setAttribute("period", period);

            int priceMonthly = 0;
            int priceYearly = 0;
            int priceMonthlyDiscounted = 0;

            if ("b".equals(goods)) {
                priceMonthly = 7900;
                priceYearly = 79900;
                priceMonthlyDiscounted = 6660;
            } else if ("p".equals(goods)) {
                priceMonthly = 8900;
                priceYearly = 89900;
                priceMonthlyDiscounted = 7490;
            }

            session.setAttribute("priceMonthly", priceMonthly);
            session.setAttribute("priceYearly", priceYearly);
            session.setAttribute("priceMonthlyDiscounted", priceMonthlyDiscounted);

            int subscribePrice = "1개월".equals(period) ? priceMonthly : priceYearly;

            SubscribtionVO newSubscription = new SubscribtionVO();
            newSubscription.setSubscribePrice(subscribePrice);
            newSubscription.setGoods(goods);
            newSubscription.setStartDate(new Date());

            Calendar calendar = Calendar.getInstance();
            if ("1개월".equals(period)) {
                calendar.add(Calendar.MONTH, 1);
            } else if ("12개월".equals(period)) {
                calendar.add(Calendar.YEAR, 1);
            }
            newSubscription.setExpiredDate(calendar.getTime());

            newSubscription.setUserId(userId);
            purchaseService.enrollSubscription(newSubscription);
            System.out.println("enroll");

            if (goods.equals("b")) {
                ugrade = "2";
            } else if (goods.equals("p")) {
                ugrade = "3";
            }
            System.out.println("ugrade :" + ugrade);

            member.setUserId(userId);  // 설정된 userId를 member 객체에 설정
            member.setUpw(upw);        // 설정된 upw를 member 객체에 설정
            member.setUbirth(null);// 설정된 ubirth를 member 객체에 설정
            member.setUgrade(ugrade);  // 설정된 ugrade를 member 객체에 설정

            System.out.println("memberId" + member);

            try {
                memberService.updateMemberGrade(member);
                System.out.println("member(purchaseController)" + member);
                System.out.println("ugrade(purchaseController) :" + ugrade);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "redirect:/movie/subscribeMain";
        } else {
            return "redirect:/purchase/payfail";
        }
    }


    @GetMapping("/movie/subscribeMain")
    public void GetsubscribeMainPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = "daewoo"; // 임시 로그인
        session.setAttribute("userId", userId);
        logger.info("subscribeMain");
    }

    @PostMapping("/movie/subscribeMain")
    public String PostsubscribeMainPage(HttpServletRequest request, Model model) {
        String goods = (String) request.getSession().getAttribute("goods");
        model.addAttribute("goods", goods);
        System.out.println("포스트 subscribeMain");
        return "redirect:/movie/subscribeMain"; // 구독 완료 후 리다이렉트할 페이지 경로를 지정합니다.
    }
}
