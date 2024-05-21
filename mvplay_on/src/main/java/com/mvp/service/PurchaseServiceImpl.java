package com.mvp.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvp.mapper.MovieMapper;
import com.mvp.mapper.PurchaseMapper;
import com.mvp.model.PurchaseVO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private MovieMapper moviemapper;
	
	@Autowired
	private PurchaseMapper purchasemapper;
	
	
	
	
	//구매
	@SuppressWarnings("unused")
	@Override
	@Transactional
	public void getBuyInfo(PurchaseVO pvo) {
		//구매 정보
		PurchaseVO purchase = purchasemapper.getBuyInfo(pvo.getMovieId());
		
		//db에 구매 정보 삽입
		purchasemapper.enrollPurchase_1(pvo); //소장
		purchasemapper.enrollPurchase_2(pvo); //대여
		
	}
	
	@Override
	public int enrollPurchase_1(PurchaseVO pvo) {
	return purchasemapper.enrollPurchase_1(pvo);
	}
	@Override
	public int enrollPurchase_2(PurchaseVO pvo) {
	
	return purchasemapper.enrollPurchase_2(pvo);
	}
	
	
	
	
	
	
	
}
