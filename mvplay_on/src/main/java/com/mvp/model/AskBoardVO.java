package com.mvp.model;

import java.sql.Date;

import lombok.Data;

//문의 게시판
@Data
public class AskBoardVO {
	/* --문의 게시판
	ano 		number 			generated always as IDENTITY primary key,
	userId 		varchar2(50) 	not null,
	title 		varchar2(200) 	not null,
	content 	varchar2(4000) 	not null,
	answerCk 	char(1) 		default 'X',
	regDate 	date 			default sysdate,
	updateDate 	date,
	viewCnt 	number 			default 0,
		foreign key(userId) references member(userId)
	*/	
	
	//문의게시판 no.
	private int ano;
	
	//유저 아이디
	private String userId;
	
	//제목
	private String 	title;
	
	//내용
	private String content;
	
	//답변 여부
	private String answerCk;
	
	//등록 날짜
	private Date regDate;
	
	//수정 날짜
	private Date updateDate;
	
	//조회수
	private int viewCnt;
	
}
