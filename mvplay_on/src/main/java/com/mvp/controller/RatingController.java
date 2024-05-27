package com.mvp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvp.model.RatingVO;

@Controller
@RequestMapping("/movie/*")
public class RatingController {
	private static final Logger logger = LoggerFactory.getLogger(RatingController.class);
	
	
	//관리자 메인 페이지GET
	@GetMapping("/rating")
	public void getMovieRating() throws Exception {		
		logger.info("get movie rating");
		
	}
	
	@ResponseBody
	@PostMapping("/rating")
	public void postMovieRating(RatingVO rvo) {
		logger.info("post movie rating + rvo"+ rvo);
		
		
		
		
	}
}
