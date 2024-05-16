<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport -->
<script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<h2>구매 컨텐츠</h2>
	   <%-- <%@include file="../includes/header.jsp" %> --%>
            
                <div class="content_wrap">
                    <div class="content_subject"></div>

                    <div class="content_main">
						<!--div 좌측poster도 넣어야됨...  -->
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>개별 구매</label>
                             </div>
                             
                             <div class="form_section_content">
                                <input type="hidden" name="movieTitle" value="${movieInfo.movieTitle}" />
                             </div>
                          </div>
                          <div class="form_section">     
                             <div class="form_section_content"><!--  개봉일? -->
                                <input type="hidden" value="<fmt:formatDate value='${movieInfo.movieDate}' pattern='yyyy-MM-dd'/>" >
                             </div>
                          </div>                                                         
                          <div class="form_section">
                             <div class="form_section_content">
                                <input type="hidden" name="cate1" value="<c:out value="${movieInfo.cate1}"/>" >
                            </div> 
                           <div>
                              <input type="hidden" name="cate1" value="<c:out value="${movieInfo.cate2}"/>" >
                             </div>
                          </div>               
							<!-- 별점 -테이블에서 수정중임으로 추후 추가예정 -->
                         
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>소장</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="purcahse_movie" value="${movieInfo.buyPrice}" >
                            	<label>지금 구매하면 평생 감상할 수 있어요</label>
                             </div>
                          </div>   
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>대여</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="rent_movie" value="${movieInfo.rentalPrice}">
                                <label>지금 구매하면 7일 동안 대여할 수 있어요</label>
                             </div>
                          </div> 
                          
                          <h2>구매 방법</h2>             
                          <div class="form_section" id="howtobuy">
               					<input type="radio" name="buymethod" value="rent"> 대여
   								<input type="radio" name="buymethod" value="collect"> 소장       
                            </div>
                               
                             </div>
                          </div>              
                         <h2>결제방법</h2>
                          <div class="form_section">
                            <div class="form_section" id="howtopay">
               					<input type="radio" name="paymentMethod" value="card"> 카드 결제
   								<input type="radio" name="paymentMethod" value="kakao"> 카카오페이   
                            </div>
                             <div class="form_section_content bct">
                               <div> 
                                  <label id="contentPrice">콘텐츠 가격: </label>
                               </div>
                               <div> 
                                	 <label id="discount">할인: </label>
                               </div>
                               <div>   
                                <label id="totalAmount">총 결제 금액: </label>
                             </div>
                          </div>
                         
                           <%--  <div class="btn_section">
                               <button id="purchaseBtn" type="button" onclick="requestPay('${movieInfo.movieId}')" class="btn">결제하기</button>
                          		   <p class="css-1mm6nt9">*이벤트, 쿠폰, 결제 수단 및 캐시 충전 금액 
                          		   등에 따라 가격이 달라질 수 있어요</p>
                          </div>  --%>
                    </div>      
                    

                  <!--  <!-- 결제하기 -->
                   <form id="moveForm" action="/결제 api로 이동?" method="get" >
                  
                   </form> -->
                   
                </div>
                
            <%--  <%@include file="../includes/footer.jsp" %> --%>
             
<script>

   $(document).ready(function() {
       // 결제 정보 업데이트 함수
       function updatePaymentInfo(price) {
           // 선택된 결제 방법에 따라 표시할 콘텐츠 가격 및 총 결제 금액
           var paymentMethod = $('input[name="buymethod"]:checked').val();
           var discount = 0; // 할인 정보 (실제 로직에 따라 할인 정보를 가져와야 함)
           var totalAmount = parseFloat(price) - parseFloat(discount); // 총 결제 금액 계산

           // 결제 정보 업데이트
           $('#howtopay').text("결제 방법: " + paymentMethod);
           $('#contentPrice').text("콘텐츠 가격: " + price);
           $('#discount').text("할인: " + discount);
           $('#totalAmount').text("총 결제 금액: " + totalAmount);
       }

       // 결제하기 버튼 클릭 시
       $("#purchaseBtn").click(function() {
           // 결제 정보를 가져오는 예시 (가격 등)
           var purchaseInfo = {
               movieTitle: "영화 제목",
               amount: 10000, // 결제 금액
               paymentMethod: $('input[name="paymentMethod"]:checked').val() // 선택된 결제 방법
               // 추가적인 결제 정보들을 여기에 추가할 수 있습니다.
           };

         /*   // AJAX를 사용하여 결제 정보를 서버에 전송
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
   }); */

   function requestPay(itemName) {
       var today = new Date();
       var hours = today.getHours();
       var minutes = today.getMinutes();
       var seconds = today.getSeconds();
       var makeMerchantUid = hours + minutes + seconds;

       console.log(itemName);
       IMP.request_pay({
           pg: "kakaopay", // 카카오페이
           merchant_uid: "IMP" + makeMerchantUid,
           name: itemName,
           amount: 50000,
           buyer_email: "moviePlayOn@namebr.com",
           buyer_name: '무비플레이온',
           buyer_tel: '010-000-0000'
       }, function(rsp) {
           if (rsp.success) {
               var msg = "결제가 완료되었습니다";
               msg += "고유ID :" + rsp.imp_uid;
               msg += "상점 거래 ID :" + rsp.merchant_uid;
               msg += "결제 금액 :" + rsp.paid_amount + "원";
               msg += "카드 승인번호 :" + rsp.apply_num;

           } else {
               console.log(rsp);
               var msg = "결제에 실패하였습니다"
               msg += rsp.error_msg + "에러가 발생하였습니다";
           }
           alert(msg);
       });
   }
</script>
</body>
</html>