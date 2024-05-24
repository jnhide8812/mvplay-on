package com.mvp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvp.model.Criteria;
import com.mvp.model.PageVO;
import com.mvp.model.PurchaseVO;
import com.mvp.model.PurchaseViewVO;
import com.mvp.model.RefundVO;
import com.mvp.service.AdminPurchaseService;

@Controller
@RequestMapping("/admin/*")
public class AdminPurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(AdminPurchaseController.class);
	
	//관리자 구매관리 매퍼 
	@Autowired
	AdminPurchaseService apService;
	
	
	//관리자-구매 대여 관리GET
	@GetMapping("/purchase")
	public void getAdminPurchase(Criteria cri, Model model) {
		logger.info("get admin purchase");
		List<PurchaseViewVO> boardList = apService.adminSelectPurchaseList(cri); 
		
		if(!boardList.isEmpty()) {
			model.addAttribute("list", boardList);	
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, apService.boardGetTotal(cri)));
		
		
	}

	//관리자-환불 신청 GET
	@GetMapping("/refund")
	public void getAdminRefund(int id, Criteria cri, Model model) {
		logger.info("get admin refund");
		
		PurchaseViewVO pvo = apService.adminSelectPurchaseDetail(id);
		model.addAttribute("purchaseInfo", pvo);
		logger.info("get__refund __pvo: "+ pvo);
	}
	
	//관리자-환불 신청 Post
	@PostMapping("/refund")
	public void postAdminRefund(PurchaseVO pvo) {
		logger.info("post admin refund pvo "+pvo);
		logger.info("=========");
		
		
		//logger.info("rvo:"+rvo);
		
		
	}
	
	
	
	//관리자-구매 대여 관리GET
	@GetMapping("/subscribe")
	public void getAdminSubscribe(Criteria cri, Model model) {
		logger.info("get admin subscribe");
		
		List<PurchaseViewVO> boardList = apService.adminSelectSubscribeList(cri);
		
		if(!boardList.isEmpty()) {
			model.addAttribute("list", boardList);
			
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, apService.subscribeGetTotal(cri)));
		
		
	}
}
