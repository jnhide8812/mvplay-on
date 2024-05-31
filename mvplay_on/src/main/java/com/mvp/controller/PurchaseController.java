package com.mvp.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvp.model.MemberVO;
import com.mvp.model.PurchaseVO;
import com.mvp.model.SubscribtionVO;
import com.mvp.service.MemberService;
import com.mvp.service.MovieService;
import com.mvp.service.PurchaseService;
@Component
@Controller
@RequestMapping

public class PurchaseController {
    private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);

	/* private IamportClient iamportClient; */
    
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private MovieService movieservice;

	/*
	 * @Value("${imp.api.key}") private String apiKey;
	 * 
	 * @Value("${imp.api.secretkey}") private String secretKey;
	 * 
	 * @PostConstruct public void init() { this.iamportClient = new
	 * IamportClient(apiKey, secretKey); }
	 */

    // 개별 구매 페이지 이동
    @GetMapping("/purchase/vod")
    public void purchasePageGET(@RequestParam("movieId") int movieId, HttpServletRequest request, Model model) {
        System.out.println("movieId" + movieId);
        logger.info("vod");
        logger.info("purchasePageGET()........." + movieId);

        HttpSession session = request.getSession();
        String userId = "daewoo"; // 임시 로그인
        session.setAttribute("userId", userId);
        //String userId = (String) session.getAttribute("userId");

        
       

        model.addAttribute("memberInfo", userId);
        model.addAttribute("movieInfo", movieservice.movieGetDetail(movieId));
        logger.info(" getmapping vod" +movieId );

         
    }

    // 대여,소장
    @PostMapping("/purchase/vod")
    public String purchasePagePost(PurchaseVO pvo, MemberVO member, HttpServletRequest request, Model model) {
        logger.info("purchasePagePost()........."+pvo);
        
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        session.setAttribute("userId", userId);
        if (userId == null) {
           
            return "redirect:/member/login";
        }

        String selectedMethod = request.getParameter("selectedMethod");
        System.out.println("selectedMethod: "+selectedMethod);
        pvo.setUserId(userId);

		/*
		 * try { MemberVO memberLogin = memberService.memberLogin(member);
		 * memberLogin.setUpw(""); session.setAttribute("member", memberLogin); } catch
		 * (Exception e) { logger.error("Error member login", e); }
		 */

        if ("rent".equals(selectedMethod)) {
            purchaseService.enrollPurchase_2(pvo);
            logger.info("enrollPurchase_2");

            
           
        } else {
            purchaseService.enrollPurchase_1(pvo);
            logger.info("enrollPurchase_1");
        }

        return "redirect:/movie/purchaseDetail"; 
    }
    
    @GetMapping("/movie/purchaseDetail")
    public String purchaseDetailPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = "daewoo"; // 임시 로그인
        session.setAttribute("userId", userId);
        logger.info("purchaseDetail로 이동");
        
        return "redirect:/movie/purchaseMain"; 
    }

	 /* 
	 * @PostMapping("/purchase/validation/{impUid}")
	 * 
	 * @ResponseBody public ResponseEntity<IamportResponse<Payment>>
	 * validateIamport(@PathVariable String impUid) { try {
	 * logger.info("Validation request received for imp_uid: " + impUid);
	 * IamportResponse<Payment> payment = iamportClient.paymentByImpUid(impUid);
	 * logger.info("Payment validation successful for imp_uid: " + impUid); return
	 * new ResponseEntity<>(payment, HttpStatus.OK); } catch
	 * (IamportResponseException | IOException e) {
	 * logger.error("Error occurred during payment validation for imp_uid: " +
	 * impUid, e); return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
	 * }
	 * 
	 * // 결제 검증 컨트롤러(결과 반환)
	 * 
	 * @PostMapping("/purchase/validation") public ResponseEntity<String>
	 * validatePayment(@RequestBody PaymentValidationRequest request) { boolean
	 * validationResult = purchaseService.validatePayment(request); if
	 * (validationResult) { System.out.println("결제 검증 컨트롤러: 결제 유효성 검증 성공"); return
	 * new ResponseEntity<>("Payment validation successful", HttpStatus.OK); } else
	 * { System.out.println("결제 검증 컨트롤러: 결제 유효성 검증 실패"); return new
	 * ResponseEntity<>("Payment validation failed", HttpStatus.BAD_REQUEST); } }
	 */
//-----------결제 실패 매핑
    @GetMapping("/purchase/payFail") // payFail 페이지에 대한 매핑
    public void GetpayFailPage(HttpServletRequest request) {
    	 HttpSession session = request.getSession();
         String userId = "daewoo"; // 임시 로그인
         session.setAttribute("userId", userId);
         logger.info("payFail");
    }
    
    @PostMapping("/purchase/payFail")
    public String PostpayFailPage(HttpServletRequest request, Model model) {
        System.out.println("포스트 payFail");
        return "redirect:/purchase/payFail"; // 구독 완료 후 리다이렉트할 페이지 경로를 지정합니다.
    }
    
    

    // 구독----------------------------------------------------------------------------------------------
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
    
    @GetMapping("/movie/PurchaseMain")
    public void GetsPurchaseMainPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = "daewoo"; // 임시 로그인
        session.setAttribute("userId", userId);
        logger.info("PurchaseMain");
    }

    @PostMapping("/movie/PurchaseMain")
    public String PostPurchaseMainPage(HttpServletRequest request, Model model) {
        String expiredDate = (String) request.getSession().getAttribute("expiredDate");
        model.addAttribute("expiredDate", expiredDate);
        System.out.println("포스트 PurchaseMain");
        return "redirect:/movie/PurchaseMain"; // 구독 완료 후 리다이렉트할 페이지 경로를 지정합니다.
    }
    
}
