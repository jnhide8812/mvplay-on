package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.AskBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AskBoardTest {
private static final Logger logger = LoggerFactory.getLogger(AskBoardTest.class);
	
	@Autowired
	private AskBoardMapper mapper;
	
	@Test
	public void addTest() {
		AskBoardVO vo = new AskBoardVO();
		
		vo.setAno(400);
		
		vo.setAnswer("답변00001");
		
		mapper.addAnswer(vo);
		
		logger.info("test vo : "+vo);
		
		
	}
	

}
