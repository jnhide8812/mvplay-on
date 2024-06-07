package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.MovieMapper;
import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

import lombok.extern.log4j.Log4j;


@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieMapper mapper;
	
	
	//개별 구매
	@Override
	public MovieVO movieBuyDetail(int movieId) {
		System.out.println("(service)movieBuyDetail......." + movieId);
		return mapper.movieBuyDetail(movieId);
	}
		
	//영화 총 갯수
	@Override
	public int movieGetTotal(Criteria cri) {
			
		return mapper.movieGetTotal(cri);
			
	}
	
	//영화 리스트
	@Override
	public List<MovieVO> movieList() {
		
		return mapper.getMovieList();
	}
	
	//영화 조회
	@Override
	public MovieVO movieGetDetail(int movieId) {
		System.out.println("movieGetDetail"+movieId);
		return mapper.movieGetDetail(movieId);
	}
	
	//영화 ID&이름
	@Override
	public MovieVO getMovieIdTitle(int movieId) {
		return mapper.getMovieIdTitle(movieId);
	}
		
	/*영화 평점
	@Override
	public int movieGetRating() {
		return mapper.movieGetRating();
	}*/
	
	@Override
	public List<MovieVO> searchMovie(Criteria cri) {
		return mapper.searchMovie(cri);
	}
	
	@Override
	public int getMovieTotal(Criteria cri) throws Exception {
		return mapper.getMovieTotal(cri);
	}
	
	//영화 랭킹용
	@Override
	public List<MovieVO> movieRank() {
		return mapper.getMovieRank();
	}
	
	/* 이하 카테고리별 분류를 위한 임시 조치 */
	//임시 purchase용
	@Override
	public List<MovieVO> movieSF_P(){
		return mapper.getMovieSF_P();
	}
	@Override
	public List<MovieVO> movieMystery_P() {
		return mapper.getMovieMystery_P();
	}
	@Override
	public List<MovieVO> movieCrime_P(){
		return mapper.getMovieCrime_P();
	}
	@Override
	public List<MovieVO> movieAnimation_P(){
		return mapper.getMovieAnimation_P();
	}
	@Override
	public List<MovieVO> movieDrama_P(){
		return mapper.getMovieDrama_P();
	}
	@Override
	public List<MovieVO> movieRomance_P(){
		return mapper.getMovieRomance_P();
	}
	@Override
	public List<MovieVO> movieThriller_P(){
		return mapper.getMovieThriller_P();
	}
	@Override
	public List<MovieVO> movieComedy_P(){
		return mapper.getMovieComedy_P();
	}
	
	//임시 purchase용
	@Override
	public List<MovieVO> movieSF_S(){
		return mapper.getMovieSF_S();
	}
	@Override
	public List<MovieVO> movieMystery_S() {
		return mapper.getMovieMystery_S();
	}
	@Override
	public List<MovieVO> movieCrime_S(){
		return mapper.getMovieCrime_S();
	}
	@Override
	public List<MovieVO> movieAnimation_S(){
		return mapper.getMovieAnimation_S();
	}
	@Override
	public List<MovieVO> movieDrama_S(){
		return mapper.getMovieDrama_S();
	}
	@Override
	public List<MovieVO> movieRomance_S(){
		return mapper.getMovieRomance_S();
	}
	@Override
	public List<MovieVO> movieThriller_S(){
		return mapper.getMovieThriller_S();
	}
	@Override
	public List<MovieVO> movieComedy_S(){
		return mapper.getMovieComedy_S();
	}

	//영화 카테고리 리스트 출력 
	@Override
	public List<MovieVO> selectCate1() {
		return mapper.selectCate1();
	}
	
	//구매/대여 영화 최신순 정렬
	@Override
	public List<MovieVO> getPurchaseMovieList() {
		return mapper.getPurchaseMovieList();
	}

	@Override
	public List<MovieVO> getPurchaseMovieRank() {
		return mapper.getPurchaseMovieRank();
	}
	
}
