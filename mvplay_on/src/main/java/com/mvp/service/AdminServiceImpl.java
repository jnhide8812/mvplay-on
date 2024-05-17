package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper admapper;
	
	@Override
	public void movieInsert() throws Exception {
		
		admapper.movieInsert();
		
	}

}
