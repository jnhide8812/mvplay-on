package com.mvp.mapper;

import com.mvp.model.MemberVO;
import com.mvp.model.PurchaseVO;
import com.mvp.model.SubscribtionVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
	
	//마이페이지
	public MemberVO memberGetDetail(int userId);
	
	//구독권-등급 변경
	public void updateMemberGrade(MemberVO member);
	
}
