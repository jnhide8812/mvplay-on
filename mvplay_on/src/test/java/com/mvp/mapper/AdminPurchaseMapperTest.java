package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminPurchaseMapperTest {
private static final Logger logger = LoggerFactory.getLogger(AdminPurchaseMapperTest.class);
	
	@Autowired
	private AdminPurchaseMapper mapper;
	
	
	@Test
	public void apmTest() {
		logger.info("테스트");
		Criteria cri = new Criteria();
		
		//mapper.adminSelectPurchaseList(cri);
		
		//mapper.boardGetTotal(cri);
		//logger.info("....:  "+mapper.boardGetTotal(cri));
		
		//mapper.adminSelectSubscribeList(cri);
		logger.info("....:  "+mapper.subscribeGetTotal(cri));
		
		
		
	}
	
}
