package com.mvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvp.mapper.MemberMapper;
import com.mvp.mapper.MovieMapper;
import com.mvp.mapper.PurchaseMapper;
import com.mvp.model.MemberVO;
import com.mvp.model.PurchaseVO;
import com.mvp.model.RefundVO;
import com.mvp.model.SubscribtionVO;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private MovieMapper moviemapper;

	@Autowired
	private PurchaseMapper purchasemapper;

	@Autowired
	private MemberMapper membermapper;

	// 구매
	@Override
	@Transactional
	public void getBuyInfo(PurchaseVO pvo) {
		// 구매 정보
		PurchaseVO purchase = purchasemapper.getBuyInfo(pvo.getMovieId());

		// db에 구매 정보 삽입
		purchasemapper.enrollPurchase_1(pvo); // 소장
		purchasemapper.enrollPurchase_2(pvo); // 대여

	}
	/*
	 * @Override public boolean validatePayment(PaymentValidationRequest request) {
	 * // 여기에 결제 검증 로직을 구현합니다. // 필요한 경우 결제 정보를 데이터베이스에서 조회하여 검증합니다. // 예시로는 간단히
	 * 성공적으로 받은 요청만을 검증하도록 하겠습니다. return request != null && request.getImpUid() !=
	 * null && !request.getImpUid().isEmpty(); }
	 */

	@Override
	public int enrollPurchase_1(PurchaseVO pvo) {
		return purchasemapper.enrollPurchase_1(pvo);
	}

	@Override
	public int enrollPurchase_2(PurchaseVO pvo) {

		return purchasemapper.enrollPurchase_2(pvo);
	}

	// 구독 정보
	@Override
	public SubscribtionVO getSubscriptionInfo(int id) {
		return purchasemapper.getSubscriptionInfo(id);
	}

	// 구독 디비 대입
	@Override
	public int enrollSubscription(SubscribtionVO svo) {
		return purchasemapper.enrollSubscription(svo);
	}
	
	@Override
	public void refund(RefundVO rvo) {
		purchasemapper.refund(rvo);
	}
	
	@Override
	public int enrollRefund(RefundVO rvo) {
		return purchasemapper.enrollRefund(rvo);
	}

	
	
	
}
