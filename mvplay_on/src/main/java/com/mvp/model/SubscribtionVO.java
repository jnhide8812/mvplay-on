package com.mvp.model;

import java.util.Date;

import lombok.Data;
@Data
public class SubscribtionVO {
	private int id; //pk
	private String userId; //유저id
	private String goods;  //구독상품(베이직, 프리미엄)
	private int SubscribePrice;	//구독가격
	private Date startDate;	//결제일
	private Date expiredDate;	//만료일
}