package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.PurchaseViewVO;

public interface AdminPurchaseMapper {
	
	//관리자 개별 구매/대여 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectPurchaseList(Criteria cri);
	
	//관리자-구매/대여 cri 토탈
	public int boardGetTotal(Criteria cri);
		
	//관리자 구독권 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectSubscribeList(Criteria cri);
	
	//관리자 구독 내역 cri 토탈 계산 
	public int subscribeGetTotal(Criteria cri);
	
}
