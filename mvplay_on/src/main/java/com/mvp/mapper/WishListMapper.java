package com.mvp.mapper;

import java.util.List;

import com.mvp.model.MovieVO;
import com.mvp.model.WishListVO;

public interface WishListMapper {
	//위시리스트 추가
	public void insertWishList(WishListVO wvo);
	
	//위시리스트 삭제
	public void deleteWishList(WishListVO wvo);
	
	//전체 위시리스트 출력
	public List<MovieVO> getWishList();

}
