package com.mvp.model;

import java.util.Date;

public class RefundVO {
	private String userId;
	private Date refundDay;
	private Date refundClear;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRefundDay() {
		return refundDay;
	}
	public void setRefundDay(Date refundDay) {
		this.refundDay = refundDay;
	}
	public Date getRefundClear() {
		return refundClear;
	}
	public void setRefundClear(Date refundClear) {
		this.refundClear = refundClear;
	}
	@Override
	public String toString() {
		return "RefundVO [userId=" + userId + ", refundDay=" + refundDay + ", refundClear=" + refundClear + "]";
	}
	
	
	
}
