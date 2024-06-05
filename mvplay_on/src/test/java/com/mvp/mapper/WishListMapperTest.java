package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.MemberVO;
import com.mvp.model.WishListVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class WishListMapperTest {
	private static final Logger logger = LoggerFactory.getLogger(WishListMapperTest.class);
	
	@Autowired
	private WishListMapper mapper;
	
	@Test
	public void wishListMapperTest() {
		WishListVO wvo = new WishListVO();
		wvo.setId(7);
		mapper.deleteWishList(wvo);
		
		mapper.getWishList();
		
		
		/* 위시리스트 추가
		WishListVO wvo = new WishListVO();
		wvo.setUserId("user0");
		wvo.setMovieId(61);
		wvo.setWish(1);
		
		mapper.insertWishList(wvo);
		*/
		
		
	}
	

}
