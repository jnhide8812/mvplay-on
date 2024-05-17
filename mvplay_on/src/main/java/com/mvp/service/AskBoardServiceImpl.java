package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.AskBoardMapper;
import com.mvp.model.AskBoardVO;
@Service
public class AskBoardServiceImpl implements AskBoardService{

	@Autowired
	AskBoardMapper askMapper;
	
	@Override
	public AskBoardVO select(int ano) {
		return askMapper.select(ano);
	}

	@Override
	public List<AskBoardVO> selectList() {
		return askMapper.selectList();
	}
	

}
