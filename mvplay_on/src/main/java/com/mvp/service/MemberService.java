package com.mvp.service;

import java.util.List;

import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	//마이페이지
	public MemberVO memberGetDetail(int userId) throws Exception;

	//구독권 등급변경
	public void updateMemberGrade(MemberVO member) throws Exception;

	//개인 별점 영화, 별점순 정렬, 개봉일순 정렬
	public List<MovieVO> getUserRatingList(MemberVO member);

}
