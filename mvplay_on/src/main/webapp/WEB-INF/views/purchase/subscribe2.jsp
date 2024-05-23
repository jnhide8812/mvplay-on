<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>mvplayon-구독권 결제주기를 선택해주세요</title>
</head>
<body>
    <h2>구독권의 결제주기를 선택해 주세요</h2>
    <form id="subscribe_choice" action="${pageContext.request.contextPath}/purchase/subscribe3" method="post"> 
    <input type="hidden" name="action" value="step2">     
       <!-- jsp 폼 제출 시 url 경로를 동적으로 설정 -->
        <div class="form_section_effect">
            <ul>
                <li><input type="radio" name="period" value="1개월"> 1개월</li>
               
                
                <li>${sessionScope.priceMonthly}원</li>
                
                <li><input type="radio" name="period" value="12개월"> 12개월 16% 절약</li>
               
                <li>월 ${sessionScope.priceMonthlyDiscounted}원 꼴</li>
                <li>${sessionScope.priceYearly}원</li>
            </ul>
        </div>
        
        <div class="btn_section_effect">
        
            <button id="subscribeBtn" type="button" class="btn">결제 주기 선택</button>
       		<button type="submit">다음</button>
        </div>  
    </form>
      
    <script>
    // 결제 주기 선택 버튼 클릭 시
    alert("구독2-1")
    $("#subscribeBtn").click(function() {
        $("#subscribe_choice").submit();
    });
    </script>     
</body>
</html>
