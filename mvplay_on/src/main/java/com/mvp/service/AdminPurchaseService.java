package com.mvp.service;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.PurchaseViewVO;

public interface AdminPurchaseService {

	//관리자 개별 구매/대여 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectPurchaseList(Criteria cri);
	
	//게시글 개수
	public int boardGetTotal(Criteria cri);
		
	
	//관리자 구독권 관리 리스트 출력
	
	
}
