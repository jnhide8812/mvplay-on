package com.mvp.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mvp.model.MemberVO;
import com.mvp.model.PurchaseVO;
import com.mvp.service.MemberService;
import com.mvp.service.PurchaseService;

public class LoginInterceptor implements HandlerInterceptor  {
	
	//구매 기록 확인
	@Autowired
	PurchaseService purchaseService;
	
	//만료일 지나면 멤버 ugrade 변경
	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member == null) {
			response.sendRedirect("/main");
			return false;
		}else if((("2").equals(member.getUgrade()) || ("3").equals(member.getUgrade())) ) {
			
			//오늘 날짜
			Date now = new Date();
			
			//구독권-만료일 확인하기 
			boolean result = false;
			PurchaseVO pvo = new PurchaseVO();
			pvo.setUserId(member.getUserId());

			PurchaseVO date = purchaseService.subscribeCheckDate(pvo); //구독권 만료일 확인
			Date expiredDate = date.getExpiredDate();
			result = expiredDate.after(now);
			//만료일이 지났다면 일반회원으로 변경 
			if(!result) {
				member.setUgrade("1");
				memberService.updateMemberGrade(member);
				session.setAttribute("member", member);
				
				return true;
			}
		}
		
		return true;
		
	}

}
