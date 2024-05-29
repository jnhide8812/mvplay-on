package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.RatingMapper;
import com.mvp.model.MemberVO;
import com.mvp.model.RatingVO;

@Service
public class RatingServiceImpl implements RatingService {

	//별점 mapper
	@Autowired
	private RatingMapper ratingMapper;
	
	//별점 넣기
	@Override
	public void insertRating(RatingVO rvo) {
		ratingMapper.insertRating(rvo);
		
	}
	
	//별점 수정
	@Override
	public void updateRating(RatingVO rvo) {
		ratingMapper.updateRating(rvo);
		
	}

	//별점 관련 vo 가져오기
	@Override
	public RatingVO selectRating(RatingVO rvo) {
		// TODO Auto-generated method stub
		return ratingMapper.selectRating(rvo);
	}
	


}
