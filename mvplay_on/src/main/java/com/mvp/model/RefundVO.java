package com.mvp.model;

import java.util.Date;

import lombok.Data;

@Data
public class RefundVO {
	//환불 주문번호
	private int refundId;
	//개별 구매주문번호(purchase)
	private int id;
	//환불 금액
	private int refundPrice;
	//유저 아이디
	private String userId;
	//환불 신청일
	private Date refundDate;
	//환불 상태
	private String refundStatus;
	
}
