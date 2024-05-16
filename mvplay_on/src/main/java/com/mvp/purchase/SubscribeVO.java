package com.mvp.purchase;

import java.util.Date;

public class SubscribeVO {

	private String userId; //유저id
	private String goods;  //구독상품(베이직, 프리미엄)
	private int subscribePrice;	//구독가격
	private Date startDate;	//결제일
	private Date expiredDate;	//만료일
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public int getSubscribePrice() {
		return subscribePrice;
	}
	public void setSubscribePrice(int subscribePrice) {
		this.subscribePrice = subscribePrice;
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
		return "PurchaseVO [userId=" + userId + ", goods=" + goods + ", subscribePrice=" + subscribePrice
				+ ", startDate=" + startDate + ", expiredDate=" + expiredDate + "]";
	}
	
	
	
}
