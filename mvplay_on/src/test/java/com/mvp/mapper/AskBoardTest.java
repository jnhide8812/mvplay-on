package com.mvp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AskBoardTest {
private static final Logger logger = LoggerFactory.getLogger(AskBoardTest.class);
	
	@Autowired
	private AskBoardMapper mapper;
	
	@Test
	public void addTest(@Param("userId")String userId, @Param("cri")Criteria cri) {
		AskBoardVO vo = new AskBoardVO();
		String keyword = "문의";
		cri.setKeyword(keyword);
		
		userId = "1";
		
		List<AskBoardVO> list = mapper.ownList(userId, cri);
		
		
		//vo.setAno(424);
		//mapper.deleteAnswer(vo);
		
		//logger.info("test vo : "+vo);
		/*
		vo.setAnswer("답변00001");
		
		mapper.addAnswer(vo);
		
		logger.info("test vo : "+vo);
		*/
		
	}
	

}
