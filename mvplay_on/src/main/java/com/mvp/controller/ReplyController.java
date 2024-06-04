package com.mvp.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;
import com.mvp.model.ReplyPageVO;
import com.mvp.model.ReplyVO;
import com.mvp.service.MovieService;
import com.mvp.service.ReplyService;

@RestController
@RequestMapping("/movie")
public class ReplyController {

private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService RepService;
	
	@Autowired
	private MovieService movieService;
	
	//댓글 등록
	@PostMapping("/replyWrite")
	public void replyWritePOST(ReplyVO vo) {
		logger.info("replyWritePOST");
		RepService.writeReply(vo);
	}
	
	@GetMapping(value = "/replyWrite")
	public void replyWrite() throws Exception {
		logger.info("reply write");
		
		//rttr.addAttribute("movieId",vo.getMovieId());
		
	}	
	
	//댓글 체크
	@PostMapping("/check")
	public String replyCheckPOST(ReplyVO vo) {
		return RepService.checkReply(vo);
	}
	
	//댓글 수정
	@PostMapping("/replyUpdate")
	public void replyUpdatePOST(ReplyVO vo) {
		RepService.replyUpdate(vo);
	}
	
	
	//댓글 삭제
	@PostMapping("/replyDelete")
	public void replyDeletePOST(ReplyVO vo) {
		RepService.replyDelete(vo);
	}
	
	//댓글 리스트
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ReplyPageVO replyListPOST(Criteria cri) {
		logger.info("reply list");
		return RepService.replyList(cri);
	}
	
	/* 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("reply write");
		
		RepService.replyWrite(vo);
		
		rttr.addAttribute("movieId",vo.getMovieId());
		
		return "redirect:/movie/movieDetail?movieId="+vo.getMovieId();	
	}
	
	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("reply update");
		
		RepService.replyUpdate(vo);
		
		return "redirect:/movie/subscribeDetail";
	}

	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("reply delete");
		
		RepService.replyDelete(vo);
		
		return "redirect:/movie/subscribeDetail";
	}
		
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("movieId") int movieId, Model model) throws Exception {
		logger.info("reply update");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(movieId);
		
		model.addAttribute("readReply", vo);
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("movieId") int movieId, Model model) throws Exception {
		logger.info("reply delete");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(movieId);
		
		model.addAttribute("readReply", vo);
	}
	*/
}
