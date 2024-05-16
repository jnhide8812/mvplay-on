package com.mvp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvp.model.MovieVO;

@Controller
@RequestMapping
public class MovieController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//메인 페이지로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}
	
	
	
	/* 이하 어드민 에서 필요할 거 같은 영화 관련 매핑
	 
	//영화 관리 페이지 접속
	@RequestMapping(value = "movieManage", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception{
        logger.info("영화 등록 페이지 접속");
	}

	//영화 등록 페이지로 이동
	@RequestMapping(value = "movieEnroll", method = RequestMethod.GET)
	public void movieEnrollGET(Model model) throws Exception {
		logger.info("영화 등록 페이지 접속");
	}
	
	//영화 수정 페이지로 이동
	@PostMapping("/movieModify")
	public String movieModifyPOST(MovieVO vo, RedirectAttributes rttr) {
		logger.info("영화 수정"+vo);
	}
	
	//영화 상세 정보 조회 페이지로 이동
	@GetMapping({"/movieDetail", "/movieModify"})
	public void movieGetInfoGET(int movieId, Criteria cri, Model model) throws JsonProcessingException {
		logger.info("영화 상세 정보" + movieId);
	}
	*/
	
}
