package com.mvp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.MemberMapper;
import com.mvp.model.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	MemberMapper membermapper;
	
	/*회원가입*/
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	/*로그인*/
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return membermapper.memberLogin(member);
	}
	
	/*마이페이지*/
	@Override
	public MemberVO memberGetDetail(int userId) throws Exception {
		log.info("memberGetDetail......" + userId);
		return membermapper.memberGetDetail(userId);
	}
}
