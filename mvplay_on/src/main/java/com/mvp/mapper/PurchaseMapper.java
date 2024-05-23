package com.mvp.mapper;

import com.mvp.model.MovieVO;
import com.mvp.model.PurchaseVO;

public interface PurchaseMapper {
		 
		//구매 영화 정보
		public PurchaseVO getBuyInfo(int movieId);
		
		//개별 구매(소장) 영화 purchase table에 등록
		public int enrollPurchase_1(PurchaseVO pvo);
		
		//개별 구매(대여) 영화 purchase table에 등록
	    public int enrollPurchase_2(PurchaseVO pvo);

		
}
