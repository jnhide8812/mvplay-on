package com.mvp.service;


import com.mvp.model.PaymentValidationRequest;
import com.mvp.model.PurchaseVO;
import com.mvp.model.SubscribtionVO;

public interface PurchaseService {
	
	//구매 영화 정보(구매 처리)
	public void getBuyInfo(PurchaseVO pvo);
	
	// 대여시,  만료일 업데이트
    public int updateRental(int id);
			
	//개별 구매(소장) 영화 purchase table에 등록
	public int enrollPurchase_1(PurchaseVO pvo);
			
	//개별 구매(대여) 영화 purchase table에 등록
	public int enrollPurchase_2(PurchaseVO pvo);
	
	 // 구독 정보 가져오기
    public SubscribtionVO getSubscriptionInfo(int id);
    
    // 구독 정보 등록
    public int enrollSubscription(SubscribtionVO svo);
    
 // 결제 검증 서비스 메서드
    boolean validatePayment(PaymentValidationRequest request);
}
