package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.WishListMapper;
import com.mvp.model.MovieVO;
import com.mvp.model.WishListVO;

@Service
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListMapper wishListMapper;
	
	//위시리스트 삽입
	@Override
	public void insertWishList(WishListVO wvo) {
		wishListMapper.insertWishList(wvo);
		
	}
	
	//위시리스트 삭제
	@Override
	public void deleteWishList(WishListVO wvo) {
		wishListMapper.deleteWishList(wvo);
		
	}
	
	//전체 리스트 출력-관리자만 나와야 할듯
	@Override
	public List<MovieVO> getWishList() {
		return wishListMapper.getWishList();
	}
	
	//개인-위시리스트 확인 userId, movieId 필요(중복 방지)
	@Override
	public WishListVO selectUserWish(WishListVO wvo) {
		return wishListMapper.selectUserWish(wvo);
	}

}
