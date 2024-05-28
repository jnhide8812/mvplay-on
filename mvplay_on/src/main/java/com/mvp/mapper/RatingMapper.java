package com.mvp.mapper;

import com.mvp.model.RatingVO;

public interface RatingMapper {

	//별점 넣기
	public void insertRating(RatingVO rvo);
	
	//개인-별점 가져오기
	public RatingVO selectRating(RatingVO rvo);
	
	
}
