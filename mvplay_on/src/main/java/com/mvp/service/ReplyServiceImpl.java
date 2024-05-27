package com.mvp.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.mvp.mapper.ReplyMapper;
import com.mvp.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	//댓글 작성
	@Override
	public int writeReply(ReplyVO vo) {
		int result = replyMapper.writeReply(vo);
		return result;
	}
	
	//댓글 체크
	@Override
	public String checkReply(ReplyVO vo) {
		Integer result = replyMapper.checkReply(vo);
		if (result == null) {
			return "0";
		}else {
			return "1";
		}
	}
	
	//댓글 수정
	@Override
	public int replyUpdate(ReplyVO vo) {
		int result = replyMapper.replyUpdate(vo);
		return result;
	}
	
	//댓글 삭제
	@Override
	public int replyDelete(ReplyVO vo) {
		int result = replyMapper.replyDelete(vo.getMovieId());
		return result;
	}

	@Override
	public ReplyVO getUpdateReply(int replyNum) {
		return replyMapper.getUpdateReply(replyNum);
	}
	
	
}
