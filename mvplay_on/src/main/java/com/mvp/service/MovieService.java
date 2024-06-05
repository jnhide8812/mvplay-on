package com.mvp.service;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface MovieService {
	//개별 구매 
	public MovieVO movieBuyDetail(int movieId);
			
	//영화 총 갯수
	public int movieGetTotal(Criteria cri);
	
	//영화 리스트
	public List<MovieVO> movieList();
	
	//영화 조회
	public MovieVO movieGetDetail(int movieId);
	
	//영화 ID&이름
	public MovieVO getMovieIdTitle(int movieId);

	/*영화 평점
	public int movieGetRating();*/
	
	//지정 영화 이미지 정보 얻기
	/*public List<> getPosterInfo(int movieId); */
	
	//영화 제목 검색
	public List<MovieVO> searchMovie(Criteria cri);
	
	//영화 검색 페이징용
	public int getMovieTotal(Criteria cri) throws Exception;
	
	//영화 랭킹용
	public List<MovieVO> movieRank();
	
	/* 이하 카테고리별 분류를 위한 임시 조치 */
	//임시 purchase용
	public List<MovieVO> movieSF();
	public List<MovieVO> movieMystery();
	public List<MovieVO> movieCrime();
	public List<MovieVO> movieAnimation();
	public List<MovieVO> movieDrama();
	public List<MovieVO> movieRomance();
	public List<MovieVO> movieThriller();
	public List<MovieVO> movieComedy();
}
