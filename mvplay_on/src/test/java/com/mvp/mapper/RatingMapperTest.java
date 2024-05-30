package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.MemberVO;
import com.mvp.model.RatingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RatingMapperTest {
private static final Logger logger = LoggerFactory.getLogger(RatingMapperTest.class);
	
	@Autowired
	private RatingMapper mapper;
	
	@Test
	public void ratingMapperTest() {
		RatingVO rvo = new RatingVO();
		
		rvo.setRating(2.5);
		rvo.setRatingId(40);
		
		mapper.updateRating(rvo);
		
		//mapper.selectRating(rvo);
		
		/*
		MemberVO member = new MemberVO();
		
		
		String userId = "admin";
		member.setUserId(userId);
		
		int movieId = 15;
		
		
		rvo.setMovieId(movieId);
		rvo.setUserId(userId);
		
		
		rvo = mapper.selectRating(rvo);
		*/
		
		//insert into rating (userId, movieId, rating) values('admin', 14, 3);
		
		//rvo.setUserId("admin");
		//rvo.setMovieId(15);
		
		
		
		//rvo.setRating(2.5);
		
		//mapper.insertRating(rvo);
		
		//logger.info("rvo: "+rvo);
		
		
		
		
		
		
		
	}


}
