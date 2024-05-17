package com.mvp.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvp.service.MovieService;



@Controller
@RequestMapping(value = "/purchase/*")
public class PurcahseController {
	private static final Logger logger = LoggerFactory.getLogger(PurcahseController.class);

	/*
	 * @Autowired private PurchaseService purchaseservice;
	 */
	 
	 @Autowired 
	 private MovieService movieservice;
	 
	 
	//개별 구매
	@GetMapping("/vod")
	public void purchasePageGET(int movieId, Model model) {
		//System.out.println("movieId 전:"+movieId);
		movieId = 4;
		System.out.println("movieId 후:"+movieId);
		logger.info("vod");
		
		logger.info("purchasePageGET()........." + movieId); 

		 //ObjectMapper mapper = new ObjectMapper(); 

		
		  //카테고리 리스트 데이터 
		 //model.addAttribute("cateList",mapper.writeValueAsString(movieservice.cateList()));
		 
		 
		 // 조회 페이지 정보 
		model.addAttribute("movieInfo", movieservice.movieGetDetail(movieId));
		 System.out.println(movieservice.movieGetDetail(movieId));
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
