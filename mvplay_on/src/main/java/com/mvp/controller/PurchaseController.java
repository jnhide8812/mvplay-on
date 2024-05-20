package com.mvp.controller;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

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

import com.mvp.model.PurchaseVO;
import com.mvp.service.MovieService;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/purchase/*")
@RequiredArgsConstructor
public class PurchaseController {
    private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);

    private IamportClient iamportClient;

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

    // 개별 구매
    @GetMapping("/vod")
    public void purchasePageGET(int movieId, Model model) {
        System.out.println("movieId 후:" + movieId);
        logger.info("vod");
        logger.info("purchasePageGET()........." + movieId);

        model.addAttribute("movieInfo", movieservice.movieGetDetail(movieId));
        System.out.println(movieservice.movieGetDetail(movieId));
    }

    @PostMapping("/vod")
    public String purchasePagePost(PurchaseVO purchase, HttpServletRequest request) {
        System.out.println("구매 상세페이지 이동" + purchase);
        return "redirect:/purchase/purchaseDetail";
    }

    @PostMapping("/purchase/validation/{imp_uid}")
    @ResponseBody
    public IamportResponse<Payment> validateIamport(@PathVariable String imp_uid) throws IOException {
        IamportResponse<Payment> payment = null;
		payment = iamportClient.paymentByImpUid(imp_uid);
       
        return payment;
    }

    @GetMapping("/payFail") // payFail 페이지에 대한 매핑
    public String payFail() {
        return "purchase/payFail"; // payFail.jsp가 있는 경로를 반환
    }
}
