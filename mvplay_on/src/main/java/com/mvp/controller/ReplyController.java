package com.mvp.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.ReplyVO; 
import com.mvp.service.ReplyService;

@Controller
@RequestMapping("/movie/*")
public class ReplyController {

private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	ReplyService RepService;
	
	// 댓글 작성
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
}
