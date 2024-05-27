<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>mvplayon-구독권을 선택해주세요</title>
</head>
<body>
	<h2>구독권을 선택해 주세요</h2>
	<form id="subscribe_choice"  action="${pageContext.request.contextPath}/movie/subscribeDetail" method="post">
	 <input type="hidden" name="action" value="step1">		
	
      <div class="form_section_effect">
         
            <ul>
                <li><input type="radio" name="goods" value="b"> 베이직</li>
             
                <li>월 7900원</li>
                <li>Ultra HD 4K 지원</li>
                <li>실감나는 화질</li>
                <li>HDR 10+ 지원</li>
                <li>더 입체감있는 색상</li>
                
                <li><input type="radio" name="goods" value="p"> 프리미엄</li>
                
                <li>월 8900원</li>
                <li>Full HD 지원</li>
                <li>선명한 화질</li>
                <li>HDR 10+ 미지원</li>
                <li>안정적인 색상</li>
            </ul>
        </div>
        
        <div class="form_section_effect">
            <ul>
                <li><input type="radio" name="period" value="1개월"> 1개월</li>
               
                <li>${priceMonthly}원</li>
                
                <li><input type="radio" name="period" value="12개월"> 12개월 16% 절약</li>
               
                <li>월 ${priceMonthlyDiscounted}원 꼴</li>
                <li>${priceYearly}원</li>
            </ul>
        </div>
        
        <ul>
	<li>결제방법을 등록해주세요</li>
	<li>결제 정보만 입력하면 바로 감상할 수 있어요</li>
	
	 <c:choose>
        <c:when test="${period == '1개월'}">
            <li><input type="radio" name="payment" value="card"> 카드결제</li>
            <li>${priceMonthly}원</li>
                    
            <li><input type="radio" name="payment" value="카카오페이"> 카카오페이</li>
            <li>${priceMonthly}원</li>
        </c:when>
        <c:when test="${period == '12개월'}">
            <li><input type="radio" name="payment" value="card"> 카드결제</li>          
            <li><input type="radio" name="payment" value="카카오페이"> 카카오페이</li>           
        </c:when>
    </c:choose>
	<!-- 체크박스 disable기능 추후 추가 예정 -->
	<li>(필수)언제든 해지 가능하며, 구독이 끝날 때까지 이용할 수 있어요</li>
	<li>결제 후 3일 이내이고, 이용 내역이 없다면 환불 받을 수 있어요</li>
	
</ul>
        
        
         <div class="btn_section_effect">
        
            <button id="subscribeBtn111" type="button" class="btn">구독 시작하기</button>
        	<button type="submit">결제하기</button>
        </div>  
        
        
      </form>
      
<script>
alert("스크립트")
$(document).ready(function() {
    // 라디오 버튼 클릭 시 가격 정보를 업데이트하는 함수
    function updatePrice() {
        var goods = $('input[name="goods"]:checked').val();
        var period = $('input[name="period"]:checked').val();

        var priceMonthly = 0;
        var priceYearly = 0;
        var priceMonthlyDiscounted = 0;

        if (goods === 'b') {
            priceMonthly = 7900;
            priceYearly = 79900;
            priceMonthlyDiscounted = 6660;
        } else if (goods === 'p') {
            priceMonthly = 8900;
            priceYearly = 89900;
            priceMonthlyDiscounted = 7490;
        }

        if (period === '1개월') {
            $('#selectedPrice').text(priceMonthly + "원");
        } else if (period === '12개월') {
            $('#selectedPrice').text(priceYearly + "원 (월 " + priceMonthlyDiscounted + "원 꼴)");
        }
    }
    
    // 라디오 버튼 변경 시 이벤트 바인딩
    $('input[name="goods"], input[name="period"]').change(function() {
        updatePrice();
        
    });
});

// 구독하기 버튼 클릭 시
$("#subscribeBtn111").click(function() {
    $("#subscribe_choice").submit();
    
});

// 초기 상태 업데이트
updatePrice();
</script>  
      
     
</body>
</html>