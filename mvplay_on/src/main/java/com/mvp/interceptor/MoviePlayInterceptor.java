package com.mvp.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;
import com.mvp.model.PurchaseVO;
import com.mvp.service.AdminService;
import com.mvp.service.MemberService;
import com.mvp.service.PurchaseService;

public class MoviePlayInterceptor implements HandlerInterceptor {
	
	//영화 정보 확인
	@Autowired
	AdminService adService;
	
	//구매 기록 확인
	@Autowired
	PurchaseService purchaseService;
	
	//만료일 지나면 멤버 ugrade 변경
	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		//영화 정보 가져옴 movieCheck varchar2  0: 멤버십/ 1: 구매 / 2: 대여 /3: 구매+대여
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		MovieVO mvo = adService.getMovieDetail(movieId);
		String movieCk = mvo.getMovieCheck();
		
		//등급 ugrade	char(1)	1일반회원, 2베이직, 3프리미엄, 0 관리자
		if (member == null ) {
			response.sendRedirect("/main");
			return false;
		} 
		
		//구독 영화에 일반 회원이라면 : 상세 페이지로  
		if(("0").equals(movieCk) && ("1").equals(member.getUgrade())) {
			response.sendRedirect("/movie/movieDetail?movieId="+movieId);
			return false;
		}/* 로그인 인터셉터에서 대체
		else if(("0").equals(movieCk) && (("2").equals(member.getUgrade()) || ("3").equals(member.getUgrade())) ) {
			
			//오늘 날짜
			Date now = new Date();
			
			//구독권-만료일 확인하기 
			boolean result = false;
			
			PurchaseVO pvo = new PurchaseVO();
			pvo.setUserId(member.getUserId());

			//만료일 확인
			PurchaseVO date = purchaseService.subscribeCheckDate(pvo);
			Date expiredDate = date.getExpiredDate();
			result = expiredDate.after(now);
			
			System.out.println("인터셉터 만료일 : expiredDate:"+expiredDate);
			System.out.println("인터셉터 만료일 : result:"+result);
			
			if(!result) {
				member.setUgrade("1");
				memberService.updateMemberGrade(member);
				
				response.sendRedirect("/movie/movieDetail?movieId="+movieId);
				return false;
			}
			
			return true;
		}
		*/
		
		//구독 영화가 아닌 영화에(구매 대여 영화) 구매 대여 기록이 없다면 : 상세 페이지로 
		if(!("0").equals(movieCk)) {
			
			//구매기록 확인
			boolean result = false;
			PurchaseVO pvo = new PurchaseVO();
			pvo.setUserId(member.getUserId());
			pvo.setMovieId(movieId);
			int checkPurchase = purchaseService.checkPurchase(pvo);
			if(checkPurchase>0) {
				//오늘 날짜
				Date now = new Date();
				
				//만료일 확인
				PurchaseVO date = purchaseService.purchaseCheckDate(pvo);
				Date expiredDate = date.getExpiredDate();
				result = expiredDate.after(now);
			}
			if(!result) {
				response.sendRedirect("/movie/movieDetail?movieId="+movieId);
				return false;
			}
			
			return true;
		}
		
		return true;
		
	}

}

