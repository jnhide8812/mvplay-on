package com.mvp.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.PurchaseViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PListTest {

   

    @Autowired
    private PurchaseMapper mapper;

    @Test
    public void pListMapperTest() {
        String userId = "1";
        PurchaseViewVO pview = new PurchaseViewVO();
        List<PurchaseViewVO> movieList = mapper.getPList(userId);
        	System.out.println(movieList);
            
        
    }
}
