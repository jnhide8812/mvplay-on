package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.RatingMapper;
import com.mvp.model.MemberVO;
import com.mvp.model.RatingVO;

@Service
public class RatingServiceImpl implements RatingService {

	@Autowired
	private RatingMapper ratingMapper;
	
	@Override
	public void insertRating(RatingVO rvo) {
		ratingMapper.insertRating(rvo);
		
	}

	@Override
	public RatingVO selectRating(RatingVO rvo) {
		// TODO Auto-generated method stub
		return ratingMapper.selectRating(rvo);
	}



}
