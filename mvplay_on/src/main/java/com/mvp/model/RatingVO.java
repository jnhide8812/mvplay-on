package com.mvp.model;

import lombok.Data;

@Data
public class RatingVO {
	//별점 아이디(자동생성)
	private int ratingId;
	//유저
	private String userId;
	//영화 아이디
	private int movieId;
	//별점 - 더블형
	private double rating;
}
