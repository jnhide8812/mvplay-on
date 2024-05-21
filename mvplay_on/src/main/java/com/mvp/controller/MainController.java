package com.mvp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;
import com.mvp.service.MovieService;

@Controller
public class MainController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MovieService movieService;
	
	/*메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGET() {
		logger.info("mainPageGET()");
	}*/
	
	/*리스트 데이터 받아오기
	@RequestMapping("/main")
	public void mainListGET(Criteria cri, Model model) throws Exception{
		logger.info("movieListGET");
		
		//영화 리스트
		List movieList = movieService.movieList(cri);
		
		if (!movieList.isEmpty()) {
			model.addAttribute("movieList", movieList);
		} else {
			model.addAttribute("movieListCheck", "empty");
			return;
		}
		
	}*/
	
	@RequestMapping("/main")
	public String list(HttpServletRequest request) {
		List<MovieVO> movieList = movieService.movieList();
		request.setAttribute("movieList", movieList);
		return "main";
		
	}
	
	/*
	//영화 디테일 확인
	@GetMapping("movieDetail")
	public void movieDetailGET(int movieId, Criteria cri, Model model)throws JsonProcessingException {
		logger.info("영화 정보..." + movieId);
			
		ObjectMapper mapper = new ObjectMapper();
			
		model.addAttribute("cri",cri);
		model.addAttribute("movieInfo",movieService.movieGetDetail(movieId));
		
	}
	*/
	@RequestMapping(value = "/movie/movieDetail", method = RequestMethod.GET)
	public void movieDetailGET(@RequestParam("movieId") int movieId, Model model) {
		
		logger.info("movieDetailGET");
		
		MovieVO vo = movieService.movieGetDetail(movieId);
		model.addAttribute("movieDetail",vo);
		
	}
	
}
