package com.mvp.purchase;

import java.util.Date;

public class PurchaseVO {
	private String userId;	//유저id
	private int movieId;	//영화id
	private int purchasePrice; //구매가
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
	public int getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
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
		return "PurchaseVO [userId=" + userId + ", movieId=" + movieId + ", purchasePrice=" + purchasePrice
				+ ", startDate=" + startDate + ", expiredDate=" + expiredDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
