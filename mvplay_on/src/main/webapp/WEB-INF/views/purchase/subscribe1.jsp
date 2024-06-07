<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/purchase/subscribe1.css">
<link rel="stylesheet" href="/resources/css/basic/style.css">
<meta charset="UTF-8">
<title>mvplayon-구독권을 선택해주세요</title>
</head>
<body>
<div id="container">
	<!-- <header class="logo">
		<img src="/resources/icon/logo_m.png">
	</header> -->
	 <%@include file="../includes/header.jsp"%>
	<div class="sub_wrap">
	<div class="middle_wrap">
		<div class="top">
			<div class="tit_wrap">
				<h1 class="main_tit">구독권을 선택해 주세요</h1>
				<h2 class="sub_tit">원할 때 언제든지 해지할 수 있어요</h2>
			</div>
			<form id="subscribe_choice" action="/purchase/subscribe1" method="post">
			<input type="hidden" name="action" value="step1">
			<input type="hidden" name="userId" value="${memberInfo}">	
	
				<div class="main_content">
					<div class="bp">
						<ul class="pink">
							<li class="up">
								<img class="ck" src="/resources/icon/ck_b.png">
								<input type="radio" name="goods" value="b" class="grade"> 베이직
							</li>
							<li>
								<span class="price">월 7900원</span>							
							</li>
						</ul>
						<ul class="grade">
							<li>
								<div class="hd" ><img src="/resources/icon/hd_icon.png"></div>
								<span class="hd">Full HD 지원</span>
								<p class="explain">선명한 화질</p>
							</li>
							<li>
								<div class="hd"><img src="/resources/icon/x_icon.png" class="x"></div>
								<span class="hd">HDR 10+ 미지원</span>
								<p class="explain">안정적인 색상</p>
							</li>
						</ul>
					</div>
					<div class="bp">
						<ul class="pink">
							<li class="up">
								<img class="ck" src="/resources/icon/ck_b.png">
								<input type="radio" name="goods" value="p" class="grade"> 프리미엄
							</li>
							<li>
								<span class="price">월 8900원</span>							
							</li>
						</ul>
						<ul class="grade">
							<li>
								<div class="hd"><img src="/resources/icon/4k_b.png"></div>
								<span class="hd">Ultra HD 4K 지원</span>
								<p class="explain">실감나는 화질</p>
							</li>
							<li>
								<div class="hd"><img src="/resources/icon/hdr_b.png"></div>
								<span class="hd">HDR 10+ 지원</span>
								<p class="explain">더 입체감있는 색상</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="month_wrap">
					<label class="tit">
						구독권의 결제 주기를 선택하세요.
					</label>
					<ul>
						<li><input type="radio" name="period" value="1개월" class="mon">1개월</li>
						<li><input type="radio" name="period" value="12개월" class="mon">12개월 16% 절약</li>
					</ul>
				</div>
				<div id="selectedPrice"></div>
			
			<div class="pay_wrap">
				<div class="pay_tit">
					<h1 class="main_tit">결제방법</h1>
					<h2 class="sub_tit">결제 정보만 입력하면 바로 감상할 수 있어요</h2>
				</div>
				<ul class="payment">
				 	<li><input type="radio" name="payment" value="card">카드결제</li>
					<li><input type="radio" name="payment" value="kakao">카카오페이</li>
				
				 
				
					<%-- <c:choose>
						<c:when test="${period == '1개월'}">
							<li><input type="radio" name="payment" value="card">카드결제</li>
							<li>${priceMonthly}원</li>

							<li><input type="radio" name="payment" value="카카오페이">카카오페이</li>
							<li>${priceMonthly}원</li>
						</c:when>
						<c:when test="${period == '12개월'}">
							<li><input type="radio" name="payment" value="card">카드결제</li>
							<li><input type="radio" name="payment" value="카카오페이">카카오페이</li>
						</c:when>
					</c:choose> 수정중 --%>
				</ul>	
				<!-- 체크박스 disable기능 추후 추가 예정 -->
				<div class="check_list">
					<p class="ck1"><input type="radio">(필수)언제든 해지 가능하며, 구독이 끝날 때까지 이용할 수 있어요</p>
					<p class="ck2">결제 후 3일 이내이고, 이용 내역이 없다면 환불 받을 수 있어요</p>
				</div>
			</div>  <!-- pay_wrap -->
			<div class="paybtn_wrap">
				<button id="subscribeBtn111" type="button" class="sbtn">구독 시작하기</button>
				<!-- <button type="submit" class="sbtn">결제하기</button> -->
			</div>
			
		</form>
		</div>
	</div> <!-- middle_wrap -->
	</div> <!-- sub_wrap -->
	<%@include file="../includes/footer.jsp" %>
</div> <!-- container -->


<script>
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
    
    // 구독하기 버튼 클릭 시
    $("#subscribeBtn111").click(function() {
    	
		var goods = $('input[name="goods"]:checked').val();
        
        // 구독 상품 값을 hidden input에 추가하여 서버로 전송
        $('#subscribe_choice').append('<input type="hidden" name="ugrade" value="' + (goods === 'b' ? '2' : '3') + '">');
        
    	
        $("#subscribe_choice").submit();
    });

    // 초기 상태 업데이트
    updatePrice();
});
</script>





</body>
</html>