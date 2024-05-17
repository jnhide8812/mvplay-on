package com.mvp.service;

import java.util.List;

import com.mvp.model.AskBoardVO;

public interface AskBoardService {
	//게시글 조회
	public AskBoardVO select(int ano);
	
	//게시글 목록 조회
	public List<AskBoardVO> selectList();
	
}
