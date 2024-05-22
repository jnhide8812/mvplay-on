package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.PurchaseViewVO;

public interface AdminPurchaseMapper {
	
	//관리자 개별 구매/대여 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectPurchaseList(Criteria cri);
	
	//게시글 개수
	public int boardGetTotal(Criteria cri);
		
	
	
	
}
