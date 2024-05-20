package com.mvp.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.ReplyVO;
import com.mvp.model.SearchCriteria;
import com.mvp.service.ReplyService;

public class ReplyController {

private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	ReplyService RepService;
	
	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply write");
		
		RepService.writeReply(vo);
		
		rttr.addAttribute("movieId",vo.getMovieId());
		rttr.addAttribute("", scri);
		
		/*
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		*/
		return "redirect:/movie/subscribeDetail";	
	}
	
	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply update");
		
		RepService.replyUpdate(vo);
		
		/*
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		*/
		
		return "redirect:/board/read";
	}

	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply delete");
		
		RepService.replyDelete(vo);
		/*
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		*/
		return "redirect:/board/read";
	}
		
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno,
							@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("reply update");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(rno);
		
		model.addAttribute("readReply", vo);
		model.addAttribute("scri", scri);
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("rno") int rno,
							@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("reply delete");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(rno);
		
		model.addAttribute("readReply", vo);
		model.addAttribute("scri", scri);
	}
}
