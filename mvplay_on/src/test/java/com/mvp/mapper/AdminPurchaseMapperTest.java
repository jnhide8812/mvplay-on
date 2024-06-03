package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.RefundVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminPurchaseMapperTest {
private static final Logger logger = LoggerFactory.getLogger(AdminPurchaseMapperTest.class);
	
	@Autowired
	private AdminPurchaseMapper mapper;
	
	
	@Test
	public void apmTest() {
		RefundVO rvo = new RefundVO();
		rvo.setRefundId(83);
		
		mapper.adminRefundUpdate(rvo);
		
		
		//logger.info("테스트"); m  
		//Criteria cri = new Criteria();
		
		//mapper.adminSelectPurchaseList(cri);
		
		//mapper.boardGetTotal(cri);
		//logger.info("....:  "+mapper.boardGetTotal(cri));
		
		//mapper.adminSelectSubscribeList(cri);
		//logger.info("....:  "+mapper.subscribeGetTotal(cri));
		
		//int id= 382;
		//logger.info("디테일 "+mapper.adminSelectPurchaseDetail(id));
		
		//	INSERT INTO refund (id, refundPrice, userId, refundStatus) 
		//	values(#{id}, #{refundPrice}, #{userId}, '환불신청')
	
	
		//refundId=0, id=376, refundPrice=20000, userId=1, refundDate=null, refundStatus=null)
		
		/*
		RefundVO rvo = new RefundVO();
		
		rvo.setId(376);
		rvo.setUserId("1");
		rvo.setRefundPrice(20000);
		mapper.adminRefundInsert(rvo);
		
		logger.info("rvo"+rvo);
		
		*/
		
	}
	
}
