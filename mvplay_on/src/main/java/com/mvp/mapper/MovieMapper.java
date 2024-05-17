package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface MovieMapper {
	//구매 정보
	public MovieVO movieGetDetail(int movieId); 
	
	//영화 검색
	public List<MovieVO> getMovieList(Criteria cri);
		
	//영화 총 갯수
	public int movieGetTotal(Criteria cri);
}
