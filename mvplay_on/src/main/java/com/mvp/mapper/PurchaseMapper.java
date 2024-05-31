package com.mvp.mapper;

import com.mvp.model.PurchaseVO;
import com.mvp.model.SubscribtionVO;

public interface PurchaseMapper {
		 
		//구매 영화 정보
		public PurchaseVO getBuyInfo(int movieId);
		
		
		//개별 구매(소장) 영화 purchase table에 등록
		public int enrollPurchase_1(PurchaseVO pvo);
		
		//개별 구매(대여) 영화 purchase table에 등록
	    public int enrollPurchase_2(PurchaseVO pvo);
	    
	    // 구독 정보 가져오기
	    public SubscribtionVO getSubscriptionInfo(int id);
	    
	    // 구독 정보 등록
	    public int enrollSubscription(SubscribtionVO svo);
	    
	    //구매(소장,대여) 취소
	    public int refund(int id);
	    
	
	    
	    
}
