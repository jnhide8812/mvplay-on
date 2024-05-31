package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.AskBoardMapper;
import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;
@Service
public class AskBoardServiceImpl implements AskBoardService{

	@Autowired
	private AskBoardMapper askMapper;
	
	/*사용자 - 게시글 등록*/
	@Override
	public void enroll(AskBoardVO board) {
		askMapper.enroll(board);	
	}
	
	/*게시판 목록*/
	@Override
	public List<AskBoardVO> getList() {
		return askMapper.getList();
	}
	
	/*관리자 - 게시판 조회*/
	@Override
	public AskBoardVO select(int ano) {
		return askMapper.select(ano);
	}
	
	/*게시글 수정*/
	@Override
	public int modify(AskBoardVO askboard) {
		return askMapper.modify(askboard);
	}
	/*게시글 삭제*/
	@Override
	public int delete(int ano) {
		return askMapper.delete(ano);
	}
	/*관리자 - 게시판 페이징*/
	@Override
	public List<AskBoardVO> selectList(Criteria cri) {
		return askMapper.selectList(cri);
	}
	
	/*관리자 - 게시판 페이징2-total*/
	@Override
	public int boardGetTotal(Criteria cri) {
		return askMapper.boardGetTotal(cri);
	}
	
	/*관리자 - 게시판 답변 달기*/
	@Override
	public void addAnswer(AskBoardVO avo) {
		askMapper.addAnswer(avo);
	}
	
	/*관리자 - 게시판 답변 삭제*/
	@Override
	public void deleteAnswer(AskBoardVO avo) {
		askMapper.deleteAnswer(avo);
	}
	
	/*개인 게시글 개수*/
	@Override
	public List<AskBoardVO> ownList(String userId) {
		return askMapper.ownList(userId);
	}

	

	
	
}
