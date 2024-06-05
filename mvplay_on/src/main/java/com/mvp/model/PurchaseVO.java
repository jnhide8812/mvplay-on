package com.mvp.model;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class PurchaseVO {
	//뷰로부터 넘겨받을 값
	private int id; 		//자동증가 주문번호
	private String userId;	//유저id
	private int movieId;	//영화id
	//db에서 받아올 값
	private Integer  buyPrice; //소장가
	private Integer  rentalPrice; //대여가
	//만들어낼 값
	private Date startDate; //구매일
	private Date expiredDate;	//만료일
	private String paymentMethod; //결제 방식
	
}