package com.mvp.model;

import java.util.Date;
import java.util.List;

public class PurchaseVO {
	//뷰로부터 넘겨받을 값
	private String userId;	//유저id
	private int movieId;	//영화id
	//db에서 받아올 값
	private int buyPrice; //소장가
	private int rentalPrice; //대여가
	//만들어낼 값
	private Date startDate; //구매일
	private Date expiredDate;	//만료일
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getRentalPrice() {
		return rentalPrice;
	}
	public void setRentalPrice(int rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getExpiredDate() {
		return expiredDate;
	}
	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}
	@Override
	public String toString() {
		return "PurchaseVO [userId=" + userId + ", movieId=" + movieId + ", buyPrice=" + buyPrice + ", rentalPrice="
				+ rentalPrice + ", startDate=" + startDate + ", expiredDate=" + expiredDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
