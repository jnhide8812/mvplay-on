package com.mvp.service;

import com.mvp.model.MemberVO;
import com.mvp.model.SubscribtionVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	//마이페이지
	public MemberVO memberGetDetail(int userId) throws Exception;

	//구독권 등급변경
	public void updateMemberGrade(MemberVO member) throws Exception;



}
