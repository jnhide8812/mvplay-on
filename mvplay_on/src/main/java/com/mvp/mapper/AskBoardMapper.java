package com.mvp.mapper;

import java.util.List;

import com.mvp.model.AskBoardVO;

public interface AskBoardMapper {
	//게시글 작성
	
	
	//게시글 조회
	public AskBoardVO select(int ano);
	
	//게시글 목록 조회
	public List<AskBoardVO> selectList();
	
	

}
