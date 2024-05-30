package com.mvp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;
import com.mvp.model.MemberVO;

public interface AskBoardMapper {
	
	//게시글 등록
	public void enroll(AskBoardVO avo);
	
	//게시글 목록
	public List<AskBoardVO> getList();
	
	//게시글 조회
	public AskBoardVO select(int ano);
	
	//게시글 목록 조회(페이징 적용)
	public List<AskBoardVO> selectList(Criteria cri);
	
	//게시글 수정
	public int modify(AskBoardVO askboard);
	
	//게시글 삭제
	public int delete(int ano);
	
	//게시글 개수
	public int boardGetTotal(Criteria cri);
	
	//관리자 답변 달기
	public void addAnswer(AskBoardVO avo);
	
	//관리자 답변 삭제
	public void deleteAnswer(AskBoardVO avo);

	
	//개인 개시글 개수
	public int askboardGetTotal(Criteria cri);

	
	//게시판 개인목록
	public List<AskBoardVO> ownList(@Param("userId")String userId, @Param("cri")Criteria cri);
}
