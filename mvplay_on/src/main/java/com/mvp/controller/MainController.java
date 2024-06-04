package com.mvp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvp.model.Criteria;
import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;
import com.mvp.model.RatingVO;
import com.mvp.service.MovieService;
import com.mvp.service.RatingService;

@Controller
public class MainController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private RatingService ratingService;
	
	
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
	
	/*
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		
		logger.info("메인 페이지 진입");
		
		model.addAttribute("");
		model.addAttribute();
		model.addAttribute();		
		
	}*/
	
	//기존 매핑
	@RequestMapping("/main")
	public void list(HttpServletRequest request) {
		System.out.println("test");
		List<MovieVO> movieList = movieService.movieList();
		List<MovieVO> movieRank = movieService.movieRank();
		request.setAttribute("movieList", movieList);
		request.setAttribute("movieRank", movieRank);
		
	}
	
	/*
	@GetMapping("/movie/movieDetail")
	public void movieGetInfoGET(int movieId, Model model) throws JsonProcessingException {
		logger.info("영화 정보를 보는 페이지에 접속 중..."+movieId);
		model.addAttribute("movieInfo", movieService.movieGetDetail(movieId));
	}*/
	
	@GetMapping("/movie/movieDetail")
	public void movieGetInfoGET(HttpServletRequest request, int movieId, Model model) {
		//세션 가져오기!!
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo != null) { //세션이 있는 경우
			logger.info("mvo:::"+mvo);
			
			RatingVO rvo = new RatingVO();
			
			//세션이 있는 경우 고객이 선택한 별점을 ratingInfo에 넣음
			rvo.setUserId(mvo.getUserId());
			rvo.setMovieId(movieId);
			RatingVO myRatingVO =ratingService.selectRating(rvo);
			
			logger.info("myRatingVO:::"+myRatingVO);
			model.addAttribute("ratingInfo", myRatingVO);
			
		}
		///여기까지 수정 
		
		logger.info("movie Id: " + movieId);
		MovieVO vo = movieService.movieGetDetail(movieId);
		model.addAttribute("movieInfo", vo);
		
	}
	
	/*영화 디테일 페이지 접속
	@RequestMapping(value = "/movie/movieDetail", method = RequestMethod.GET)
	public void movieDetailGET(@RequestParam("movieId") int movieId, Model model) {
		
		logger.info("movieDetailGET");
		
		MovieVO vo = movieService.movieGetDetail(movieId);
		model.addAttribute("movieDetail",vo);
		
	}*/
	
	
	
}
