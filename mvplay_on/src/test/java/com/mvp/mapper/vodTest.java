package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.MovieVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class vodTest {
	private static final Logger logger = LoggerFactory.getLogger(vodTest.class);
	
	@Autowired
	private MovieMapper mapper;
	
	@Test
	public void connectTest() {
		int movieId =10;
		MovieVO vo = mapper.movieGetDetail(movieId);
		System.out.println("조회 :"+ vo);
		
		
		
	}
	
	
	
	
	
	
}
