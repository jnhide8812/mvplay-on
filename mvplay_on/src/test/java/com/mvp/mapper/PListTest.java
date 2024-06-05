package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.PurchaseVO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PListTest {

   

    @Autowired
    private PurchaseMapper mapper;

	/*
	 * @Test public void pListMapperTest() { String userId = "1"; PurchaseViewVO
	 * pview = new PurchaseViewVO(); List<PurchaseViewVO> movieList =
	 * mapper.getPList(userId); System.out.println(movieList);
	 * 
	 * 
	 * }
	 */
    
	/*
	 * @Test public void cannotbuyTest() { PurchaseVO vo = new PurchaseVO();
	 * vo.setUserId("1"); vo.setMovieId(21);
	 * 
	 * //String userId="1";
	 * 
	 * // int movieId = 21;
	 * 
	 * // 중복 구매 확인 int count = mapper.checkPurchase(vo);
	 * 
	 * System.out.println(count);
	 * 
	 * }
	 */
    
    @Test 
    public void refundTest() {
    	PurchaseVO vo = new PurchaseVO();
    	
    	vo.setId(2);
    	
    	PurchaseVO result = mapper.getBuyInfo(vo);
    	
    	System.out.println(result);
    	
    	
    	
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}	
