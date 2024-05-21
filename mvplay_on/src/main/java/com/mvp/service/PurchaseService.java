package com.mvp.service;


import com.mvp.model.PurchaseVO;

public interface PurchaseService {
	
	//구매 영화 정보(구매 처리)
	public void getBuyInfo(PurchaseVO pvo);
			
	//개별 구매(소장) 영화 purchase table에 등록
	public int enrollPurchase_1(PurchaseVO pvo);
			
	//개별 구매(대여) 영화 purchase table에 등록
	public int enrollPurchase_2(PurchaseVO pvo);
}
