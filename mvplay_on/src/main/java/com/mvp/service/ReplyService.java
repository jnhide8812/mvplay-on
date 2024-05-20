package com.mvp.service;

import java.util.List;

import com.mvp.model.ReplyVO;


public interface ReplyService {
	//댓글 조회
	public List<ReplyVO> readReply(int bno);
	
	//댓글 작성
	public void writeReply(ReplyVO vo);
	
	//특정 댓글 조회
	public ReplyVO readReplySelect(int rno);
	
	//댓글 수정
	public void replyUpdate(ReplyVO vo);
	
	//댓글 삭제
	public void replyDelete(ReplyVO vo);
}
