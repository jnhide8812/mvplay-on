package com.mvp.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

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
        this.iamportClient = new IamportClient();
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
    public void payFail() {
      
    }
//======구독=====
    // 첫 번째 구독 선택 페이지 매핑
    @GetMapping("/purchase/subscribe1")
   
    public void subscribe1Page(HttpServletRequest request) {
    HttpSession session = request.getSession();
    String userId = "daewoo"; // 임시 로그인
    session.setAttribute("userId", userId);
       logger.info("purchase");
    }
    
    @PostMapping("/movie/subscribeDetail")
    public String handleSubscription(HttpServletRequest request, SubscribtionVO svo, Model model) {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        logger.info("POST movie/purchaseDetail - Action: " + action);

        String goods = request.getParameter("goods");
        String period = request.getParameter("period");

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

            int SubscribePrice = "1개월".equals(period) ? priceMonthly : priceYearly;

            SubscribtionVO newSubscription = new SubscribtionVO();
            newSubscription.setSubscribePrice(SubscribePrice);
            newSubscription.setGoods(goods);
            newSubscription.setStartDate(new Date());

            Calendar calendar = Calendar.getInstance();
            if ("1개월".equals(period)) {
                calendar.add(Calendar.MONTH, 1);
            } else if ("12개월".equals(period)) {
                calendar.add(Calendar.YEAR, 1);
            }
            newSubscription.setExpiredDate(calendar.getTime());

            String userId = (String) session.getAttribute("userId");
            newSubscription.setUserId(userId);
            purchaseService.enrollSubscription(newSubscription);
            System.out.println("enroll");
            return "redirect:/movie/subscribeDetail.jsp";
        } else {
            return "redirect:/purchase/payfail.jsp";
        }
    }
   
    /* 2번째 구독 옵션 선택 페이지 매핑
   
    @GetMapping("/purchase/subscribe2")
    public void subscribe2Page(HttpServletRequest request,Model model) {
    	 HttpSession session = request.getSession();
    	logger.info("get purchase2");	
    }
   
    @PostMapping("/purchase/subscribe2")
    public void postSubscribe2Page(SubscribtionVO svo){
    	logger.info("post purchase2");
    	logger.info("svo :"+svo);	
    }
   
    // 3번째 결제 완료 페이지 매핑
    @GetMapping("/purchase/subscribe3")
    public void subscribe3Page(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    }
    @PostMapping("/purchase/subscribe3")
    public void postSubscribe3Page(SubscribtionVO svo){
    	
    	logger.info("post purchase3");
    	logger.info("svo :"+svo);	
    	
    	
    	
    }시간 나면 페이지 쪼개보겠음(로그인에서 id,pw와 같이 계속 같은 값을 물고 다니면 session으로 처리하면 되지만, 나처럼 한페이지마다 정보가 
    추가 업데이트되는 값을 넣을려면 매번 servlet을 만들어 줄 수 없어서 actionFactory로 처리해야하는데 처리를 못하겠음 ㅠ*/




}





