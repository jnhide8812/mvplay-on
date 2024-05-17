<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- import -->
<script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<h2>구매 컨텐츠</h2>
<!--<%@include file="../includes/header.jsp" %>   -->

<div class="content_wrap">
    <div class="content_subject"></div>

    <div class="content_main">
        <!-- 좌측poster도 넣어야됨...  -->
       
                <label>개별 구매</label>
        
            <ul>
            	<li>${movieInfo.poster}포스터</li>
                <li>${movieInfo.movieTitle}</li>
           		 <li><fmt:formatDate value='${movieInfo.movieDate}' pattern='yyyy-MM-dd'/></li>
         		 <li>${movieInfo.cate1}</li>
          		 <li>${movieInfo.cate2}</li>
          		 <!-- 별점, 연령은 추후 추가? -->
           	</ul>
        <div class="form_section">
           <ul>
           		<li>정가 | </li>
                <li>소장: </li>
          		<li>${movieInfo.buyPrice}원 /</li>
          		<li>대여: </li>
          		<li>${movieInfo.rentalPrice}원
          		 <p class="css-1mm6nt9">*이벤트, 쿠폰, 결제 수단 및 캐시 충전 금액 등에 따라 가격이 달라질 수 있어요</p>
          
        <h2>구매 방법</h2>             
        <div class="form_section_effect" id="howtobuy">
          	<ul>
          	<li><input type="radio" name="buymethod" value="collect"> 소장</li>
          	<li>${movieInfo.buyPrice}원</li>
          	<li>지금 구매하면 평생 감상할 수 있어요</li>
           	<li> <input type="radio" name="buymethod" value="rent"> 대여</li>
           	<li>${movieInfo.rentalPrice}원
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
                    </label><li>
                
               <!--  <div> 
                    <label id="discount">할인: </label>
                </div> -->
               
                    <li>
                    <label id="totalAmount">총 결제 금액:
                        <c:choose> 
                            <c:when test="${param.buymethod == 'rent'}">${movieInfo.rentalPrice}원</c:when>
                            <c:otherwise>${movieInfo.buyPrice}원</c:otherwise>
                        </c:choose>
                    </label>
                    </li>
                    </ul>
                </div>
          
       

        <div class="btn_section_effect">
            <button id="purchaseBtn" type="button" onclick="requestPay('${movieInfo.movieTitle}')" class="btn">결제하기</button>
           
        </div>  
    </div>
</div>

<!-- <%@include file="../includes/footer.jsp" %> -->

<script>
$(document).ready(function() {
    // 결제 정보 업데이트 함수
    function updatePaymentInfo(price) {
        console.log("Updating payment info with price: " + price);
        // 선택된 결제 방법에 따라 표시할 콘텐츠 가격 및 총 결제 금액
        var paymentMethod = $('input[name="buymethod"]:checked').val();
        console.log("Selected payment method: " + paymentMethod);
        var discount = 0; // 할인 정보 (실제 로직에 따라 할인 정보를 가져와야 함)
        var totalAmount = parseFloat(price) - parseFloat(discount); // 총 결제 금액 계산

        // 결제 정보 업데이트22
        $('#contentPrice').text("콘텐츠 가격: " + price);
        $('#discount').text("할인: " + discount);
        $('#totalAmount').text("총 결제 금액: " + totalAmount);
    }

    // 페이지 로드 시 updatePaymentInfo 호출하기
    updatePaymentInfo("${movieInfo.buyPrice}"); // 예를 들어 buyPrice가 초기 콘텐츠 가격일 때

    // 결제 방법이 변경될 때 updatePaymentInfo 호출하기
    $('input[name="buymethod"]').change(function() {
        var selectedPrice = $(this).val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
        updatePaymentInfo(selectedPrice);
    });

    // 결제하기 버튼 클릭 시
    $("#purchaseBtn").click(function() {
        // 결제 정보를 가져오는 예시 (가격 등)
        var purchaseInfo = {
            movieTitle: "${movieInfo.movieTitle}",
            amount: $('input[name="buymethod"]:checked').val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}",
            paymentMethod: $('input[name="paymentMethod"]:checked').val() // 선택된 결제 방법
        };

        // AJAX를 사용하여 결제 정보를 서버에 전송(왜 안돼)
        $.ajax({
            type: "POST", // 혹은 "GET" 등 HTTP 요청 메서드 지정
            url: "/payment", // 결제 처리를 담당하는 서버의 엔드포인트 지정
            data: JSON.stringify(purchaseInfo), // 결제 정보를 JSON 형태로 전송
            contentType: "application/json", // 요청의 컨텐츠 타입 설정
            success: function(response) {
                // 결제 성공 시 처리할 로직
                console.log("결제가 성공적으로 처리되었습니다.");
                console.log(response); // 서버에서 받은 응답 출력
            },
            error: function(xhr, status, error) {
                // 결제 실패 시 처리할 로직
                console.error("결제 중 오류가 발생했습니다.");
                console.error(xhr.responseText); // 오류 응답 내용 출력
            }
        });
    });
});

$("#purchaseBtn").click(function() {
    requestPay(); // 매개변수 없이 함수 호출
});


function requestPay() {
    var today = new Date();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    var seconds = today.getSeconds();
    var makeMerchantUid = hours + minutes + seconds;
    var itemName = "${movieInfo.movieTitle}";
    var amount = $('input[name="buymethod"]:checked').val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
    
    console.log("Requesting payment for item: " + itemName);
    IMP.init('imp13216508');
    IMP.request_pay({
        pg: "kakaopay", // 카카오페이
        merchant_uid: "IMP" + makeMerchantUid,
        name: itemName,
        amount: amount,
        buyer_email: "moviePlayOn@namebr.com",
        buyer_name: '무비플레이온',
        buyer_tel: '010-000-0000'
    }, function(rsp) {
        var msg;
        if (rsp.success) {
            msg = "결제가 완료되었습니다. ";
            msg += "고유ID: " + rsp.imp_uid + ", ";
            msg += "상점 거래 ID: " + rsp.merchant_uid + ", ";
            msg += "결제 금액: " + rsp.paid_amount + "원, ";
            msg += "카드 승인번호: " + rsp.apply_num;
        } else {
            console.log(rsp);
            msg = "결제에 실패하였습니다. ";
            msg += rsp.error_msg + " 에러가 발생하였습니다";
        }
        alert(msg);
    });
}
</script>
</body>
</html>
