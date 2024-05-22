package com.mvp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvp.mapper.AdminPurchaseMapper;
import com.mvp.model.Criteria;
import com.mvp.model.PageVO;
import com.mvp.model.PurchaseViewVO;

@Controller
@RequestMapping("/admin/*")
public class AdminPurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(AdminPurchaseController.class);
	
	//관리자 구매관리 매퍼 
	@Autowired
	AdminPurchaseMapper apMapper;
	
	
	//관리자-구매 대여 관리GET
	@GetMapping("/purchase")
	public void getAdminPurchase(Criteria cri, Model model) {
		logger.info("get admin purchase");
		List<PurchaseViewVO> boardList = apMapper.adminSelectPurchaseList(cri); 
		
		if(!boardList.isEmpty()) {
			model.addAttribute("list", boardList);	
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, apMapper.boardGetTotal(cri)));
		
		
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/subscribe")
	public void getAdminSubscribe() {
		logger.info("get admin subscribe");
	}
}
