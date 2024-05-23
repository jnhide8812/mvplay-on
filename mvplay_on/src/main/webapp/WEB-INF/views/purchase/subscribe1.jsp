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
	<form id="subscribe_choice"  action="${pageContext.request.contextPath}/purchase/subscribe2" method="post">
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
        
         <div class="btn_section_effect">
        
            <button id="subscribeBtn111" type="button" class="btn">구독 시작하기</button>
        	<button type="submit">다음</button>
        </div>  
        
        
      </form>
      
 <script>

 // 구독하기 버튼 클릭 시
 $("#subscribeBtn111").click(function() {
	 $("#subscribe_choice").submit();
    
 });
 
 
 </script>     
      
     
</body>
</html>