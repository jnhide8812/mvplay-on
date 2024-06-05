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
	public List<MovieVO> movieSF(){
		return mapper.getMovieSF();
	}
	
	public List<MovieVO> movieMystery() {
		return mapper.getMovieMystery();
	}
	
	public List<MovieVO> movieCrime(){
		return mapper.getMovieMystery();
	}
	
	public List<MovieVO> movieAnimation(){
		return mapper.getMovieAnimation();
	}
	
	public List<MovieVO> movieDrama(){
		return mapper.getMovieDrama();
	}
	
	public List<MovieVO> movieRomance(){
		return mapper.getMovieRomance();
	}
	public List<MovieVO> movieThriller(){
		return mapper.getMovieThriller();
	}
	
	public List<MovieVO> movieComedy(){
		return mapper.getMovieComedy();
	}
	
}
