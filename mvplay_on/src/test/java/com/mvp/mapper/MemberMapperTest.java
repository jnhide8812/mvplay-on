package com.mvp.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

private static final Logger logger = LoggerFactory.getLogger(MemberMapperTest.class);
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void memberMapperTest() {
		MemberVO mvo = new MemberVO();
		mvo.setUserId("admin1");
		
		List<MovieVO> list = mapper.getUserRatingList(mvo);
		logger.info("list : "+list);
		
		
		
	}

}
