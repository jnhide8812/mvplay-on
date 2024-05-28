package com.mvp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvp.model.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTest {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void replyEnrollTest() {
		
		String id = "1";
		int movieId = 1;
		String content = "댓글 테스트";
		
		ReplyVO vo = new ReplyVO();
		vo.setMovieId(1);
		vo.setUserId(id);
		vo.setReplyContent("텟스트 리플");
		
		mapper.writeReply(vo);
		
		
	}
	
}
