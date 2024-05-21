package com.mvp.service;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface MovieService {
	//개별 구매 
	public MovieVO movieGetDetail(int movieId);

	//영화 검색
	public List<MovieVO> getMovieList(Criteria cri);
			
	//영화 총 갯수
	public int movieGetTotal(Criteria cri);
	
	//영화 리스트
	public List<MovieVO> movieList(Criteria cri);

	//지정 영화 이미지 정보 얻기
	/*public List<> getPosterInfo(int movieId); */
	
}
