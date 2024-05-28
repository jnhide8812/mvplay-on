package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.ReplyVO;

public interface ReplyMapper {

	//댓글 리스트
	public List<ReplyVO> getReplyList(Criteria cri);
	
	//댓글 작성
	public int writeReply(ReplyVO vo);
	
	//댓글 유무 확인
	public Integer checkReply(ReplyVO vo);
	
	//댓글 수정
	public int replyUpdate(ReplyVO vo);
	
	//댓글 수정 페이지
	public ReplyVO getUpdateReply(int replyNum);
	
	//댓글 삭제
	public int replyDelete(int replyNum);
	
	//댓글 총 갯수
	public int getReplyTotal(int movieId);
	
}
