package com.mvp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.MemberMapper;
import com.mvp.model.MemberVO;
import com.mvp.model.MovieVO;
import com.mvp.model.SubscribtionVO;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	MemberMapper membermapper;

	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {

		membermapper.memberJoin(member);

	}

	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return membermapper.memberLogin(member);
	}

	/* 마이페이지 */
	@Override
	public MemberVO memberGetDetail(int userId) throws Exception {
		log.info("memberGetDetail......" + userId);
		return membermapper.memberGetDetail(userId);
	}

	// 구독권 등급변경
	@Override
	public void updateMemberGrade(MemberVO member) throws Exception {
		membermapper.updateMemberGrade(member);
	}

	//개인이 별점 준 영화 리스트 출력하기  
	@Override
	public List<MovieVO> getUserRatingList(MemberVO member) {
		return membermapper.getUserRatingList(member);
	}
}
