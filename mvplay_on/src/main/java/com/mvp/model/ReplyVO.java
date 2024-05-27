package com.mvp.model;

import java.util.Date;
import java.util.List;

public class ReplyVO {
	
	//댓글 번호
	private int replyNum;
	
	//유저 ID
	private String userId;
	
	//영화 ID
	private int movieId;
	
	//내용
	private String replyContent;
	
	//작성 일자
	private Date regDate;

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", userId=" + userId + ", movieId=" + movieId + ", replyContent="
				+ replyContent + ", regDate=" + regDate + "]";
	}
	
}
