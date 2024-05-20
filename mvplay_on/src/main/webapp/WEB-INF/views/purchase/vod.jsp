<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
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

<script>
$(document).ready(function() {
    // 결제 정보 업데이트 함수
    function updatePaymentInfo(price) {
        console.log("Updating payment info with price: " + price);
        var paymentMethod = $('input[name="buymethod"]:checked').val();
        console.log("Selected payment method: " + paymentMethod);
        var discount = 0; // 할인 정보 (실제 로직에 따라 할인 정보를 가져와야 함)
        var totalAmount = parseFloat(price) - parseFloat(discount); // 총 결제 금액 계산

        $('#contentPrice').text("콘텐츠 가격: " + price);
        $('#discount').text("할인: " + discount);
        $('#totalAmount').text("총 결제 금액: " + totalAmount);
    }

    // 페이지 로드 시 updatePaymentInfo 호출하기
    updatePaymentInfo("${movieInfo.buyPrice}"); // 초기 콘텐츠 가격 설정

    // 결제 방법이 변경될 때 updatePaymentInfo 호출하기
    $('input[name="buymethod"]').change(function() {
        var selectedPrice = $(this).val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
        updatePaymentInfo(selectedPrice);
    });

    // 결제하기 버튼 클릭 시
    $("#purchaseBtn").click(function() {
        var itemName = "${movieInfo.movieTitle}";
        requestPay(itemName);
    });
});

function requestPay(itemName) {
    var today = new Date();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    var seconds = today.getSeconds();
    var makeMerchantUid = hours + minutes + seconds;
    var amount = $('input[name="buymethod"]:checked').val() === 'rent' ? "${movieInfo.rentalPrice}" : "${movieInfo.buyPrice}";
    var uid ='';
    var msg;
    
    console.log("Requesting payment for item: " + itemName);
    var IMP = window.IMP;
    IMP.init('imp13216508');
   
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: "IMP" + makeMerchantUid,
        name: itemName,
        amount: amount,
        buyer_email: "moviePlayOn@namever.com",
        buyer_name: '무비플레이온',
        buyer_tel: '010-000-0000',
    }, function(rsp) {
        if (rsp.success) {
            $.ajax({
                url: '/purchase/validation' + rsp.imp_uid, // 서버 측에서 결제를 검증하는 URL
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify({
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid,
                    paid_amount: rsp.paid_amount
                }),
                contentType: 'application/json', // JSON으로 보내기 위한 설정
                success: function(data) {
                    if (data.everythings_fine) { // 서버에서 보낸 응답 처리
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                        
                       
                        // 결제가 성공하면 폼을 제출하여 결제 완료 페이지로 이동
                        $('<input>').attr({
                            type: 'hidden',
                            name: 'imp_uid',
                            value: rsp.imp_uid
                        }).appendTo('#movie_move');
                        $('<input>').attr({
                            type: 'hidden',
                            name: 'merchant_uid',
                            value: rsp.merchant_uid
                        }).appendTo('#movie_move');
                        $('#movie_move').attr('action', '/purchase/purchaseDetail').submit();
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
</html>