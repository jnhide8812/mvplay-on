<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="subscribe_choice" action="${pageContext.request.contextPath}/purchase/subscribe" method="post"></form>
	 <input type="hidden" name="action" value="step3">
<ul>
	<li>결제방법을 등록해주세요</li>
	<li>결제 정보만 입력하면 바로 감상할 수 있어요${sessionScope.period}</li>
	
	 <c:choose>
        <c:when test="${sessionScope.period == '1개월'}">
            <li><input type="radio" name="payment" value="card"> 카드결제</li>
            <li>${sessionScope.priceMonthly}원</li>
                    
            <li><input type="radio" name="payment" value="카카오페이"> 카카오페이</li>
            <li>${sessionScope.priceMonthly}원</li>
        </c:when>
        <c:when test="${sessionScope.period == '12개월'}">
            <li><input type="radio" name="payment" value="card"> 카드결제</li>
            <li>${sessionScope.priceYearly}원 (월 ${sessionScope.priceMonthlyDiscounted}원 꼴)</li>
                    
            <li><input type="radio" name="payment" value="카카오페이"> 카카오페이</li>
            <li>${sessionScope.priceYearly}원 (월 ${sessionScope.priceMonthlyDiscounted}원 꼴)</li>
        </c:when>
    </c:choose>
	<!-- 체크박스 disable기능 추후 추가 예정 -->
	<li>(필수)언제든 해지 가능하며, 구독이 끝날 때까지 이용할 수 있어요</li>
	<li>결제 후 3일 이내이고, 이용 내역이 없다면 환불 받을 수 있어요</li>
	
</ul>
	  <div class="btn_section_effect">
	  	
            <button id="finallSubscribeBtn" type="button" class="btn">결제 방법 등록</button>
        </div>  
        
<script>
 // 결제 방법 등록 버튼 클릭 시
 $("#finallSubscribeBtn").click(function() {
	 $("#subscribe_choice").submit();
    
 });
 </script>
</body>
</html>