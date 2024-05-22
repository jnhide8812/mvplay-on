package com.mvp.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvp.model.AskBoardVO;
import com.mvp.model.Criteria;
import com.mvp.model.MovieVO;
import com.mvp.model.PageVO;
import com.mvp.service.AdminService;
import com.mvp.service.AskBoardService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adService;
	
	@Autowired
	AskBoardService askService; 	//문의게시판 연결
	
	//관리자 메인 페이지GET
	@GetMapping("/main")
	public void getAdminMain() throws Exception {		
		logger.info("get Admin Main");
	}
	
	//관리자 문의 게시판 GET 
	@GetMapping("/qna")
	public void getAdminQna(Criteria cri, Model model) {
		//참고 boardEx - kun~ 
		logger.info("get admin qna");
		List<AskBoardVO> boardList = askService.selectList(cri);
		
		if(!boardList.isEmpty()) {
			model.addAttribute("list", boardList);	
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		//페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageVO(cri, askService.boardGetTotal(cri)));
		
		
	}
	//관리자 문의 게시글 상세 조회 GET
	@GetMapping("/qnaDetail")
	public void getAdminQnaDetail(int ano, Model model) {
		logger.info("qna admin Detail get");
		AskBoardVO vo = askService.select(ano);
		model.addAttribute("vo", vo);
	}
	
   //관리자-문의 게시판 답변 달기
   @PostMapping("/qnaDetail")
   public String postAnswerBoard(AskBoardVO avo, Model model,RedirectAttributes rttr) {
      logger.info("qnaDetail post");
      askService.addAnswer(avo);
      
      //업데이트한 정보 가져오기
      AskBoardVO vo = askService.select(avo.getAno());
      model.addAttribute("vo", vo);
      
      //1-> result로 변경 xml int로 변경, etc....
      rttr.addFlashAttribute("answer_result", 1);
      return "redirect:/admin/qna";
      
   }
	
	
	//영화 추가 GET
	@GetMapping("/movieInsert")
	public void getMovieInsert() throws Exception {		
		logger.info("getMovieInsert");
	}
	
	//영화 추가 POST
	@PostMapping("/movieInsert")
	public void postMovieInsert(MovieVO mvo, String poster) throws Exception {		
		logger.info("postMovieInsert");
		
		adService.movieInsert(mvo);
	}
	
	// 영화 포스터 업로드
	@PostMapping("/uploadAjax")
	public void postUploadAjax(MultipartFile[] uploadFile) {
		
		logger.info("postUploadAjax");
		
		String uploadFolder = "C:\\temp";
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}
		
	}
	
	//영화 리스트 GET
	@GetMapping("/movieList")
	public void getMovieList(Criteria cri, Model model) throws Exception {
		
		List mvList = adService.movieList(cri);
		
		model.addAttribute("mvList", mvList);
		
		int total = adService.getMovieTotal(cri);
		
		PageVO page = new PageVO(cri, total);
		
		model.addAttribute("page", page);
		
	}
	
	//영화 상세 페이지 GET
	@GetMapping("/movieDetail")
	public void getMovieDetail(int movieId, Criteria cri, Model model) throws Exception {
		
		
		// 목록 페이지 조건 정보
		model.addAttribute("cri", cri);
		
		// 상세 페이지 정보
		model.addAttribute("movieInfo", adService.getMovieDetail(movieId));
		
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/purchase")
	public void getAdminPurchase() {
		logger.info("get admin purchase");
	}
	
	//관리자-구매 대여 관리GET
	@GetMapping("/subscribe")
	public void getAdminSubscribe() {
		logger.info("get admin subscribe");
	}

}
