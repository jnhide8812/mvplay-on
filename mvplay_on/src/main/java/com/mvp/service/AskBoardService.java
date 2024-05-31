package com.mvp.service;

import java.util.List;

import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;

public interface AskBoardService {
	//관리자 게시글 조회
	public AskBoardVO select(int ano);
	
	//관리자 게시글 목록 조회
	public List<AskBoardVO> selectList(Criteria cri);
	
	//사용자 - 게시글 등록
	public void enroll(AskBoardVO board);
	
	/*게시판 목록*/
	public List<AskBoardVO> getList();
	
	//관리자 게시글 수정
	public int modify(AskBoardVO askboard);
	
	//게시글 삭제
	public int delete(int ano);
	
	//관리자 - 게시글 개수
	public int boardGetTotal(Criteria cri);
	
	//관리자 답변 달기
	public void addAnswer(AskBoardVO avo);
	
	//관리자 답변 삭제
	public void deleteAnswer(AskBoardVO avo);
	

	//개인 - 게시판 개인목록
	public List<AskBoardVO> ownList(String userId);
	
	//개인 개시글 개수
	//public int askboardGetTotal(Criteria cri);
}
