package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface MovieMapper {
	//구매 정보
	public MovieVO movieBuyDetail(int movieId);
	
	//영화 검색
	public List<MovieVO> getMovieList();
	
	//영화 총 갯수
	public int movieGetTotal(Criteria cri);

	//영화 조회
	public MovieVO movieGetDetail(int movieId);
	
	//영화 ID&이름
	public MovieVO getMovieIdTitle(int movieId);
	
	/*영화 평점
	public int movieGetRating();*/
	
	//영화 제목 검색
	public List<MovieVO> searchMovie(Criteria cri);
	
	//영화 검색 페이징용
	public int getMovieTotal(Criteria cri) throws Exception;
	
	//영화 랭킹용
	public List<MovieVO> getMovieRank();
	
	
	/* 이하 카테고리별 분류를 위한 임시 조치 */
	//purchase용
	public List<MovieVO> getMovieSF_P();
	public List<MovieVO> getMovieMystery_P();
	public List<MovieVO> getMovieCrime_P();
	public List<MovieVO> getMovieAnimation_P();
	public List<MovieVO> getMovieDrama_P();
	public List<MovieVO> getMovieRomance_P();
	public List<MovieVO> getMovieThriller_P();
	public List<MovieVO> getMovieComedy_P();
	
	//subscribe용
	public List<MovieVO> getMovieSF_S();
	public List<MovieVO> getMovieMystery_S();
	public List<MovieVO> getMovieCrime_S();
	public List<MovieVO> getMovieAnimation_S();
	public List<MovieVO> getMovieDrama_S();
	public List<MovieVO> getMovieRomance_S();
	public List<MovieVO> getMovieThriller_S();
	public List<MovieVO> getMovieComedy_S();
}
