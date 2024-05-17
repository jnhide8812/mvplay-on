package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.MovieMapper;
import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;


@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieMapper mapper;
	
	
	//개별 구매
	@Override
	public MovieVO movieGetDetail(int movieId) {
		System.out.println("(service)movieGetDetail......." + movieId);
		return mapper.movieGetDetail(movieId);
	}
	
	//영화 검색
	@Override
	public List<MovieVO> getMovieList(Criteria cri) {
		
		return mapper.getMovieList(cri);
			
	}
		
	//영화 총 갯수
	@Override
	public int movieGetTotal(Criteria cri) {
			
		return mapper.movieGetTotal(cri);
			
	}
}
