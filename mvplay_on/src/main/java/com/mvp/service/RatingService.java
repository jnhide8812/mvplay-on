package com.mvp.service;

import com.mvp.model.RatingVO;

public interface RatingService {
	//별점 넣기
	public void insertRating(RatingVO rvo);
	
	//개인-별점 가져오기
	public RatingVO selectRating(RatingVO rvo);
	
}
