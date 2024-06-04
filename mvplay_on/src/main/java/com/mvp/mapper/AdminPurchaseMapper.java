package com.mvp.mapper;

import java.util.List;

import com.mvp.model.Criteria;
import com.mvp.model.PurchaseViewVO;
import com.mvp.model.RefundVO;

public interface AdminPurchaseMapper {
	
	//관리자 개별 구매/대여 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectPurchaseList(Criteria cri);
	
	//관리자-구매/대여 cri 토탈
	public int purchaseGetTotal(Criteria cri);
		
	//관리자 구독권 관리 리스트 출력
	public List<PurchaseViewVO> adminSelectSubscribeList(Criteria cri);
	
	//관리자 구독 내역 cri 토탈 계산 
	public int subscribeGetTotal(Criteria cri);
	
	//관리자 환불 전단계 1.영화 구매 정보 불러오기 --id:개별구매 주문번호
	public PurchaseViewVO adminSelectPurchaseDetail(int id);
	
	//환불 신청하기
	public int adminRefundInsert(RefundVO rvo);
	
	//관리자 환불 완료 업데이트
	public int adminRefundUpdate(RefundVO rvo);
	
	//관리자 환불 취소(삭제)
	public int adminRefundDelete(RefundVO rvo);
	
	//구매 테이블에 만료일 업데이트(purchase table)
	public int adminRefundPurchaseUpdate(RefundVO rvo);
	
	
}
