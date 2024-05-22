package com.mvp.model;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseViewVO {
	//개별구매
	private int rn; 			//rownum
	private int id; 			//자동증가 주문번호
	private String userId;		//유저id
	private int movieId;		//영화id
	private String movieName; 	//영화 제목
	private int buyPrice; 		//소장가
	private int rentalPrice; 	//대여가
	private Date startDate; 	//구매일
	private Date expiredDate;	//만료일
	
	//구독권
	private String goods;		//구독권 종류'b', 'p'
	private int subscrivePrice; //
	
	
}
