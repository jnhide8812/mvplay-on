<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 실패 페이지(임시 확인용)</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- import -->
<script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<h2>구매 컨텐츠</h2>
<form id="movie_move">
<div class="content_wrap">
    <div class="content_subject"></div>

    <div class="content_main">
        <label>개별 구매</label>
        <ul>
            <li>${movieInfo.poster}포스터</li>
            <li>${movieInfo.movieTitle}</li>
            <li><fmt:formatDate value='${movieInfo.movieDate}' pattern='yyyy-MM-dd'/></li>
            <li>${movieInfo.cate1}</li>
            <li>${movieInfo.cate2}</li>
        </ul>
        <div class="form_section">
            <ul>
                <li>정가 | </li>
                <li>소장: ${movieInfo.buyPrice}원 /</li>
                <li>대여: ${movieInfo.rentalPrice}원</li>
                <p class="css-1mm6nt9">*이벤트, 쿠폰, 결제 수단 및 캐시 충전 금액 등에 따라 가격이 달라질 수 있어요</p>
            </ul>
        </div>

        <h2>구매 방법</h2>
        <div class="form_section_effect" id="howtobuy">
            <ul>
                <li><input type="radio" name="buymethod" value="collect"> 소장</li>
                <li>${movieInfo.buyPrice}원</li>
                <li>지금 구매하면 평생 감상할 수 있어요</li>
                <li><input type="radio" name="buymethod" value="rent"> 대여</li>
                <li>${movieInfo.rentalPrice}원</li>
                <li>지금 구매하면 7일 동안 대여할 수 있어요</li>
            </ul>
        </div>

        <h2>결제방법</h2>
        <div class="form_section_effect">
            <div class="form_section" id="howtopay">
                <input type="radio" name="paymentMethod" value="card"> 카드 결제
                <input type="radio" name="paymentMethod" value="kakao"> 카카오페이   
            </div>
            <div class="form_section_content bct">
                <ul>
                    <li><label id="contentPrice">콘텐츠 가격:
                        <c:choose> 
                            <c:when test="${param.buymethod == 'rent'}">${movieInfo.rentalPrice}원</c:when>
                            <c:otherwise>${movieInfo.buyPrice}원</c:otherwise>
                        </c:choose>
                    </label></li>
                    <li><label id="totalAmount">총 결제 금액:
                        <c:choose> 
                            <c:when test="${param.buymethod == 'rent'}">${movieInfo.rentalPrice}원</c:when>
                            <c:otherwise>${movieInfo.buyPrice}원</c:otherwise>
                        </c:choose>
                    </label></li>
                </ul>
            </div>
        </div>

        <div class="btn_section_effect">
            <button id="purchaseBtn" type="button" class="btn">결제하기</button>
        </div>  
    </div>
</div>
</form>