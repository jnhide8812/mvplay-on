package com.mvp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.AskBoardVO;
import com.mvp.service.AskBoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private AskBoardService askbservice;
	
	
	/*게시판 목록 페이지 접속*/
	@GetMapping("/list")
	public void AsksboardListGET(Model model) {
		log.info("게시판 목록 페이지 진입");
		model.addAttribute("list", askbservice.getList());
	}
	
	/*게시판 등록 페이지 접속*/
	@GetMapping("/enroll")
	public void AskboardEnrollGET() {
		log.info("게시판 등록 페이지 진입");
	}
	
	/* 게시판 등록 */
    @PostMapping("/enroll")
    public String boardEnrollPOST(AskBoardVO board, RedirectAttributes rttr) {
        
        log.info("AskBoardVO : " + board);
        
        askbservice.enroll(board);
        
        rttr.addFlashAttribute("result", "enrol success");
        
        return "redirect:/AskBoard/list";
        
    }
}
