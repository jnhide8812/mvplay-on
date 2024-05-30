package com.mvp.model;

import lombok.Data;

@Data
public class PaymentValidationRequest {
	private String impUid; // 결제 고유 번호
    private String merchantUid; // 상점 거래 번호
    private int paidAmount; // 결제 금액
}
