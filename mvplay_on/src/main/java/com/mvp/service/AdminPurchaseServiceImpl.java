package com.mvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvp.mapper.AdminPurchaseMapper;
import com.mvp.model.Criteria;
import com.mvp.model.PurchaseViewVO;
@Service
public class AdminPurchaseServiceImpl implements AdminPurchaseService {
	//관리자 구매 관리 매퍼
	@Autowired
	AdminPurchaseMapper apMapper;
	
	
	@Override
	public List<PurchaseViewVO> adminSelectPurchaseList(Criteria cri) {
		return apMapper.adminSelectPurchaseList(cri);
	}


	@Override
	public int boardGetTotal(Criteria cri) {
		return apMapper.boardGetTotal(cri);
	}

}
