package com.mvp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;
import com.mvp.model.RatingVO;
import com.mvp.service.MovieService;
import com.mvp.service.RatingService;

@Controller
@RequestMapping("/movie/*")
public class RatingController {
	private static final Logger logger = LoggerFactory.getLogger(RatingController.class);
	
	@Autowired
	private RatingService ratingService;
	
	@Autowired
	private MovieService movieService;
	
	
	//별점 매기기
	@GetMapping("/rating")
	public void getMovieRating(HttpServletRequest request,int movieId, Model model) throws Exception {		
		logger.info("get movie rating");
		
		//세션 가져오기!!
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		logger.info("movieId ::"+ movieId);
		logger.info("mvo:::"+mvo);
		
		String userId = mvo.getUserId();
		System.out.println("userId::::"+userId);

		//RatingVO rvo = ratingService.selectRating(movieId, userId);
		
		
		//model.addAttribute(model) select * from rating 
		
	}
	
	@ResponseBody
	@PostMapping("/rating")
	public void postMovieRating(RatingVO rvo) {
		logger.info("post movie rating + rvo"+ rvo);
		ratingService.insertRating(rvo);
		
		
		
		
	}
	
	
	//영화 상세 정보 - 별점 추가 예정임
	@GetMapping("/movieDetail2_rating")
	public void movieGetInfoGET(HttpServletRequest request, int movieId, Model model) {
		//0528----
		//추가 부분 HttpServletRequest request,
		
		//세션 가져오기!!
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		logger.info("mvo:::"+mvo);
		
		RatingVO rvo = new RatingVO();
		rvo.setUserId(mvo.getUserId());
		rvo.setMovieId(movieId);
		
		
		RatingVO rvo2 =ratingService.selectRating(rvo);
		
		logger.info("rvo2:::"+rvo2);
		model.addAttribute("ratingInfo", rvo2);
		
		
		
		//logger.info("rating::"+ ratingService.selectRating(movieId, mvo));
		///여기까지 수정 
		
		logger.info("movieId:222 " + movieId);
		MovieVO vo = movieService.movieGetDetail(movieId);
		model.addAttribute("movieInfo", vo);
		
	}
	
	
}
