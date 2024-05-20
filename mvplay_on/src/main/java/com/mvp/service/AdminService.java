package com.mvp.service;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface AdminService {
	
	public void movieInsert(MovieVO mvo) throws Exception;
	
	public List<MovieVO> movieList(Criteria cri) throws Exception;

}
