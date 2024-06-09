package com.mvp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	
	//별점 삭제
	@ResponseBody
	@PostMapping(value = "/deleteRating"/* , produces = MediaType.APPLICATION_JSON_VALUE */)
	public ResponseEntity<String> postDeleteRating(HttpServletRequest request, RatingVO rvo) {
		//rvo: 뷰단에서 얻은 정보
		logger.info("post deleteRating + rvo"+ rvo);
		
		//세션 가져오기!!
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo != null) { //세션이 있는 경우
			RatingVO myRatingVO = new RatingVO();
			myRatingVO = ratingService.selectRating(rvo);
			
			ratingService.deleteRating(myRatingVO);

			return new ResponseEntity<>("ok", HttpStatus.OK);
		}

		//로그인 하지 않은 경우, 삭제할 별점이 없는 경우  
		return new ResponseEntity<>("bad request_login", HttpStatus.BAD_REQUEST);
		
	}	
	
	//별점 등록, 수정 
	@ResponseBody
	@PostMapping(value = "/rating"/* , produces = MediaType.APPLICATION_JSON_VALUE */)
	public ResponseEntity<String> postMovieRating(HttpServletRequest request, RatingVO rvo) {
		//rvo: 뷰단에서 얻은 정보
		logger.info("post movie rating + rvo"+ rvo);
				
		//세션 가져오기!!
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo != null) { //세션이 있는 경우
			
			//0. 값이 있다면 인서트 or update 판단
			//1. 기존 별점 값이 있는지 없는지 검색
			RatingVO myRatingVO = new RatingVO();
			myRatingVO = ratingService.selectRating(rvo);
			
			//2. 기존에 별점 점수가 없다면 인서트
			if (myRatingVO ==null) {
				ratingService.insertRating(rvo);
				
			}else {
				//기존 별점이 있다면 현재 점수로 업데이트 
				rvo.setRatingId(myRatingVO.getRatingId());
				ratingService.updateRating(rvo);
			}
			
			return new ResponseEntity<>("ok", HttpStatus.OK);
		}//if문 끝-세션이 있는 경우
		
		//로그인 하지 않은 경우 
		return new ResponseEntity<>("로그인을 해주세요", HttpStatus.BAD_REQUEST);
		
		
	}
	
	
	//영화 상세 정보 - 임시 페이지 - 메인
	@GetMapping("/movieDetail2_rating")
	public void movieGetInfoGET(HttpServletRequest request) {
		//0528----
		List<MovieVO> movieList = movieService.getPurchaseMovieList();
		List<MovieVO> movieRank = movieService.getPurchaseMovieRank();
		List<MovieVO> cate1List = movieService.selectCate1();
		
		request.setAttribute("movieList", movieList);
		request.setAttribute("movieRank", movieRank);
		request.setAttribute("cate1List", cate1List);
		
	}
	
	
}
