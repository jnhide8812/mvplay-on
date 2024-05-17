package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.MovieMapper;
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
}
