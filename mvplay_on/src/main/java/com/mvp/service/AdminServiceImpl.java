package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.AdminMapper;
import com.mvp.model.MovieVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper admapper;
	
	@Override
	public void movieInsert(MovieVO mvo) throws Exception {
		
		admapper.movieInsert(mvo);
		
	}

}
