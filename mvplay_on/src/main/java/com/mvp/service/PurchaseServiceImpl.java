package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvp.mapper.MemberMapper;
import com.mvp.mapper.MovieMapper;
import com.mvp.mapper.PurchaseMapper;
import com.mvp.model.PurchaseVO;
import com.mvp.model.PurchaseViewVO;
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
	
	@Override
	public List<PurchaseViewVO> getPList(String userId){
		return purchasemapper.getPList(userId);
	}
	
	@Override
	public PurchaseViewVO getRefund(int id) {
		return purchasemapper.getRefund(id);
	}
	//중복구매 방지
	@Override
	public int checkPurchase(PurchaseVO pvo) {
		return purchasemapper.checkPurchase(pvo);
	}

	@Override
	public PurchaseVO getBuyInfo(PurchaseViewVO pview) {
		
		return purchasemapper.getBuyInfo(pview);
	}

	//구매 고객 만료일 확인
	@Override
	public PurchaseVO purchaseCheckDate(PurchaseVO pvo) {
		return purchasemapper.purchaseCheckDate(pvo);
	}

	//구독 만료일 확인
	@Override
	public PurchaseVO subscribeCheckDate(PurchaseVO pvo) {
		return purchasemapper.subscribeCheckDate(pvo);
	}
	

	
	
	
}
