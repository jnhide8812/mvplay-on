package com.mvp.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.catalina.mapper.Mapper;
import org.springframework.stereotype.Repository;

import com.mvp.mapper.ReplyMapper;
import com.mvp.model.ReplyVO;

@Repository
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyMapper mapper;
	
	//댓글 리스트
	@Override
	public List<ReplyVO> readReply(int bno) {
		return mapper.readReply(bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) {
		mapper.writeReply(vo);
	}
	
	//댓글 선택
	@Override
	public ReplyVO readReplySelect(int rno) {
		return mapper.readReplySelect(rno);
	}
	
	//댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) {
		mapper.replyUpdate(vo);
	}
	
	//댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) {
		mapper.replyDelete(vo);
	}
	
	
}
