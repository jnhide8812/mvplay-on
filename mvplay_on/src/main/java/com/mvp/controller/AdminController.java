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

import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;
import com.mvp.model.PageVO;
import com.mvp.service.AdminService;
import com.mvp.service.AskBoardService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adService;
	
	@Autowired
	AskBoardService askService; 	//문의게시판 연결
	
	//관리자 메인 페이지GET
	@GetMapping("/main")
	public void getAdminMain() throws Exception {		
		logger.info("get Admin Main");
	}
	
	//관리자 문의 게시판 GET 
	@GetMapping("/qna")
	public void getAdminQna(Criteria cri, Model model) {
		//참고 boardEx - kun~ 
		logger.info("get admin qna");
		List<AskBoardVO> boardList = askService.selectList(cri);
		
		if(!boardList.isEmpty()) {
			model.addAttribute("list", boardList);	
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, askService.boardGetTotal(cri)));
		
		
	}
	//관리자 문의 게시글 상세 조회 GET
	@GetMapping("/qnaDetail")
	public void getAdminQnaDetail(int ano, Model model) {
		logger.info("qna admin Detail get");
		AskBoardVO vo = askService.select(ano);
		model.addAttribute("vo", vo);
	}
	
	//영화 추가 GET
	@GetMapping("/movieInsert")
	public void getMovieInsert() throws Exception {		
		logger.info("getMovieInsert");
	}
	
	//영화 추가 POST
	@PostMapping("/movieInsert")
	public void postMovieInsert(MovieVO mvo) throws Exception {		
		logger.info("postMovieInsert");
		
		adService.movieInsert(mvo);
	}
	
	//영화 리스트 GET
	@GetMapping("/movieList")
	public void getMovieList(Criteria cri, Model model) throws Exception {
		
		List mvList = adService.movieList(cri);
		
		model.addAttribute("mvList", mvList);
		
		int total = adService.getMovieTotal(cri);
		
		PageVO page = new PageVO(cri, total);
		
		model.addAttribute("page", page);
		
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/purchase")
	public void getAdminPurchase() {
		logger.info("get admin purchase");
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/subscribe")
	public void getAdminSubscribe() {
		logger.info("get admin subscribe");
	}

}
