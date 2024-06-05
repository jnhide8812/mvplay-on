package com.mvp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class WishListVO {
	/*	ID    		NOT NULL 	NUMBER       
		USERID  	NOT NULL 	VARCHAR2(50) 
		MOVIEID 	NOT NULL 	NUMBER       
		WISH             		NUMBER(1)    
		REGDATE		       		DATE      
	*/
	private int id;				//위시리스트 자동증가 아이디PK
	private String userId;		//유저 아이디 FK
	private int movieId;		//영화 아이디 FK
	private int wish;			//보고싶어요 default 1; 1: 보고싶어요, 0: x
	private Date regDate;		//등록일 default: sysdate
	
	
	
}
