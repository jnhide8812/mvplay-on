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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.Criteria;
import com.mvp.model.PageVO;
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
		model.addAttribute("pageMaker", new PageVO(cri, apService.purchaseGetTotal(cri)));
		
		
	}

	//관리자-환불 신청 GET
	@GetMapping("/refund")
	public void getAdminRefund(int id, Criteria cri, Model model) {
		logger.info("get admin refund");
		
		PurchaseViewVO pvo = apService.adminSelectPurchaseDetail(id);
		model.addAttribute("purchaseInfo", pvo);
		
		//환불 진행 사항 확인하기
		//RefundVO rvo = apService.adminRefundSelect()
		
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, apService.purchaseGetTotal(cri)));
		
		
	}
	
	//관리자-환불 신청 Post
	@PostMapping("/refund")
	public String postAdminRefund(RefundVO rvo, RedirectAttributes rttr) {
		logger.info("post admin refund rvo");
		//환불 신청
		int result = apService.adminRefundInsert(rvo);
		
		logger.info("rvo: "+rvo);
		logger.info("result:::"+result);
		
		if(result==1) {
			//환불 신청한 주문번호 반환
			rttr.addFlashAttribute("refund_result", rvo.getId());
		}
		
		//개별 구매 페이지로 이동(또는 환불 게시판 만들어서 관리 예정)
		return "redirect:/admin/purchase";
		
	}
	//환불진행 사항 업데이트
	@PostMapping("/refundUpdate")
	public String postAdminRefundUpdate(RefundVO rvo, RedirectAttributes rttr) {
		logger.info("post admin refund rvo update");
		int result = apService.adminRefundUpdate(rvo);
		
		if(result==1) {
			//환불 신청한 주문번호 반환
			rttr.addFlashAttribute("refund_confirm", rvo.getId());
		}
		
		//개별 구매 페이지로 이동(또는 환불 게시판 만들어서 관리 예정)
		return "redirect:/admin/purchase";
		
		
	}
	//환불 취소(삭제)
	@PostMapping("/refundDelete")
	public String postAdminRefundDelete(RefundVO rvo, RedirectAttributes rttr) {
		logger.info("post admin refund rvo delete==>"+rvo);
		System.out.println("환불 삭제 rvo::"+rvo);
		
		int result = apService.adminRefundDelete(rvo);
		if(result==1) {
			rttr.addFlashAttribute("refund_cancel", rvo.getId());
		}
		
		return "redirect:/admin/purchase"; 
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
