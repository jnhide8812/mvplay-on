package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;

public interface AdminMapper {
	
	public void movieInsert(MovieVO mvo) throws Exception;
	
	public List<MovieVO> getMovieList(Criteria cri) throws Exception;
	
	public int getMovieTotal(Criteria cri) throws Exception;

}
