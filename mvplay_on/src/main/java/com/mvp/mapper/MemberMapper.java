package com.mvp.mapper;

import com.mvp.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
}
