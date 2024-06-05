<%@page import="com.mvp.model.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
<link rel="stylesheet" href="/resources/css/purchase/vod.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- import -->
<!-- <script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->

</head>
<body>

	<div id="container">

		<div class="pur_wrap">

			<!-- 에러 메시지 출력 -->
			<c:if test="${not empty errorMessage}">
				<div style="color: red;">${errorMessage}</div>
			</c:if>

			<form id="movie_move" action="/purchase/vod" method="post">
				<div class="subh">
					<h1 class="contents">구매 컨텐츠</h1>
				</div>
				<input type="hidden" name="userId" value="${member.userId}">
				<input type="hidden" name="movieId" value="${movieInfo.movieId}">
				<input type="hidden" name="buyPrice" value="${movieInfo.buyPrice}">
				<input type="hidden" name="rentalPrice"
					value="${movieInfo.rentalPrice}">
				<div class="content_wrap">
					<div class="content_subject"></div>
					<div class="content_main">
						<div class="pst_img">
							<img src="/resources/img/${movieInfo.poster}">
						</div>
						<dl>
							<dd class="alone">개별 구매</dd>
							<dt>${movieInfo.movieTitle}</dt>
							<dd>
								<fmt:formatDate value='${movieInfo.movieDate}'
									pattern='yyyy-MM-dd' />
							</dd>
							<dd>${movieInfo.cate1}</dd>
							<dd>${movieInfo.cate2}</dd>
						</dl>
					</div>
					<div class="price_section">
						<ul>
							<li class="j">정가 |</li>
							<li>소장: ${movieInfo.buyPrice}원 /</li>
							<li>대여: ${movieInfo.rentalPrice}원</li>
						</ul>
						<p class="explain">*이벤트, 쿠폰, 결제 수단 및 캐시 충전 금액 등에 따라 가격이 달라질 수
							있어요</p>
					</div>
					<div class="buy_wrap">
						<h2>구매 방법</h2>
						<div class="way_buy" id="howtobuy">
							<ul>
								<li class="j"><input type="radio" name="buymethod"
									value="collect"> 소장</li>
								<li>${movieInfo.buyPrice}원</li>
								<li>지금 구매하면 평생 감상할 수 있어요</li>
							</ul>
							<ul>
								<li><input type="radio" name="buymethod" value="rent">
									대여</li>
								<li>${movieInfo.rentalPrice}원</li>
								<li>지금 구매하면 7일 동안 대여할 수 있어요</li>
							</ul>
						</div>
					</div>
					<div class="pway_wrap">
						<h2>결제방법</h2>
						<div class="way_buy" id="howtopay">
							<ul class="how">
								<li><input type="radio" name="paymentMethod" value="card">
									카드 결제</li>
								<li><input type="radio" name="paymentMethod" value="kakao">
									카카오페이</li>
							</ul>
						</div>
						<div class="price_info">
							<ul>
								<li><label id="contentPrice">콘텐츠 가격: <c:choose>
											<c:when test="${param.buymethod == 'rent'}">${movieInfo.rentalPrice}원</c:when>
											<c:otherwise>${movieInfo.buyPrice}원</c:otherwise>
										</c:choose>
								</label></li>
								<%-- <li>
			                        <label id="totalAmount">총 결제 금액:
			                            <c:choose>
			                                <c:when test="${param.buymethod == 'rent'}">${movieInfo.rentalPrice}원</c:when>
			                                <c:otherwise>${movieInfo.buyPrice}원</c:otherwise>
			                            </c:choose>
			                        </label>
		                        </li> --%>
							</ul>
						</div>
						<div class="btn_buy">
							<button id="purchaseBtn" type="button" class="sbtn">결제하기</button>
						</div>
					</div>
				</div>
				<!-- content_wrap -->
			</form>
		</div>
		<!-- ps_main -->
	</div>
	<!-- container -->
	<script>


$(document).ready(function() {
   
	<%-- var apiKey = '<%= ApiUtil.getProperty("imp.api.key") %>';
	var secretKey = '<%= ApiUtil.getProperty("imp.api.secretkey") %>';
	var impCode = '<%= ApiUtil.getProperty("imp.code") %>'; --%>
	
	
	 function updatePaymentInfo(price) {
	        $('#contentPrice').text("콘텐츠 가격: " + price + "원");
	    }

	    function getSelectedPrice() {
	        var selectedMethod = $('input[name="buymethod"]:checked').val();
	        return selectedMethod === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
	    }

	    updatePaymentInfo(getSelectedPrice()); // 초기 콘텐츠 가격 설정
	    
	    $('input[name="buymethod"]').change(function() {
	        updatePaymentInfo(getSelectedPrice());
	    });

	    $("#purchaseBtn").click(function() {
	    	
	        var selectedMethod = $('input[name="buymethod"]:checked').val();
	    	console.log("selectedMethod : "+selectedMethod);
	        if (!selectedMethod) {
	            alert("구매 방법을 선택해주세요.");
	            return;
	        }
	        var paymentMethod = $('input[name="paymentMethod"]:checked').val();
	        console.log("paymentMethod : "+paymentMethod);
	        if (!paymentMethod) {
	            alert("결제 방법을 선택해주세요.");
	            return;
	        }
	        alert("결제가 완료되었습니다.")
	        submitForm();
	    });

	    function submitForm() {
	    	  var selectedMethod = $('input[name="buymethod"]:checked').val();
	    	    var selectedPrice = getSelectedPrice();
	    	    
	    	    $('#movie_move').append('<input type="hidden" name="selectedPrice" value="' + selectedPrice + '">');
	    	 
	    	    $('#movie_move').submit();
	    	}
	    
	 
	});
	</script>
</body>
</html>


<%-- function requestPay(itemName) {
    var today = new Date();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    var seconds = today.getSeconds();
    var makeMerchantUid = hours + minutes + seconds;
    var amount = $('input[name="buymethod"]:checked').val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
    var uid ='';
    var msg;
    var apiKey = '<%= ApiUtil.getProperty("imp.api.key") %>';
    
    
    console.log("vod item: " + itemName);
    var IMP = window.IMP;
    IMP.init('<%= ApiUtil.getProperty("imp.code") %>');
   
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        merchantUid: "IMP" + makeMerchantUid,
        name: itemName,
        amount: amount,
        buyer_email: "moviePlayOn@namever.com",
        buyer_name: '무비플레이온',
        buyer_tel: '010-000-0000',
    }, function(rsp) {
        if (rsp.success) {
        	alert("결제 uid")
            $.ajax({
                url: '/purchase/validation/' + rsp.impUid, // 서버 측에서 결제를 검증하는 URL
                type: 'POST',
                dataType: 'json',
                //headers: {
                  //  'apiKey': apiKey, // API 키를 헤더에 포함
                   // 'secretKey': secretKey // 비밀 키를 헤더에 포함
                //}
            ,
                data: JSON.stringify({
                    impUid: rsp.impUid,
                    merchantUid: rsp.merchantUid,
                    paid_amount: rsp.paid_amount
                }),
                contentType: 'application/json', // JSON으로 보내기 위한 설정
                success: function(data) {
                    if (data.everythings_fine) { // 서버에서 보낸 응답 처리
                    	
                    	msg = '결제가 완료되었습니다.';
                    	alert(msg);
                    	msg += '\n고유ID : ' + rsp.impUid;
                        msg += '\n상점 거래ID : ' + rsp.merchantUid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        
                       
                        // 결제가 성공하면 폼을 제출하여 결제 완료 페이지로 이동
                        $('<input>').attr({
                            type: 'hidden',
                            name: 'impUid',
                            value: rsp.impUid
                        }).appendTo('#movie_move');
                        $('<input>').attr({
                            type: 'hidden',
                            name: 'merchantUid',
                            value: rsp.merchantUid
                        }).appendTo('#movie_move');
                        $('#movie_move').attr('action', '/purchase/purchaseMain').submit();
                        alert("결제 완료 폼 제출")
                    } else {
                        // 결제 취소 처리
                        alert('결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.');
                    }
                }
            });
        } else {
            msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg;
            alert(msg);
            // 실패 시 이동할 페이지
            location.href = "/purchase/payFail";
        }
    });
} 
</script>
</body>
</html>--%>