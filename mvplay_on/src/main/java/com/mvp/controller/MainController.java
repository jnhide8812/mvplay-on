package com.mvp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvp.model.Criteria;
import com.mvp.service.MovieService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MovieService movieService;
	
	//메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGET() {
		logger.info("mainPageGET()");
	}
	
	/*리스트 데이터 받아오기
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void mainListGET(Criteria cri, Model model) throws Exception{
		logger.info("movieListGET");
		
		//영화 리스트
		List movieList = movieService.getMovieList(cri);
		
		if (!movieList.isEmpty()) {
			model.addAttribute("movieList", movieList);
		} else {
			model.addAttribute("movieListCheck", "empty");
			return;
		}
		
	}*/
	
	
}
