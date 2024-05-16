<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                                <input type="hidden" name="movieTitle" value="<c:out value="${movieInfo.movieTitle}"/>" >
                             </div>
                          </div>
                          <div class="form_section">     
                             <div class="form_section_content"><!--  개봉일? -->
                                <input type="hidden" value="<fmt:formatDate value='${movieInfo.movieDate}' pattern='yyyy-MM-dd'/>" >
                             </div>
                          </div>                                                         
                          <div class="form_section">
                             <div class="form_section_content">
                                <input type="hidden "name="cate1" value="<c:out value="${movieInfo.cate1}"/>" >
                                <input type="hidden" name="cate2" value="<c:out value="${movieInfo.cate1}"/>" >
                             </div>
                          </div>               
							<!-- 별점 -테이블에서 수정중임으로 추후 추가예정 -->
                         
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>소장</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="purcahse_movie" value="${purchaseInfo.purchasePrice}" >
                            	<label>지금 구매하면 평생 감상할 수 있어요</label>
                             </div>
                          </div>   
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>대여</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="rent_movie" value="${purchaseInfo.rentPrice}">
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
                         
                            <div class="btn_section">
                               <button id="purchaselBtn" class="btn">결제하기</button>
                          		   <p class="css-1mm6nt9">*이벤트, 쿠폰, 결제 수단 및 캐시 충전 금액 
                          		   등에 따라 가격이 달라질 수 있어요</p>
                          </div> 
                    </div>      
                    

                   
                   <form id="moveForm" action="/결제 api로 이동?" method="get" >
                   <input type="hidden" name="pageNum" value="${cri.pageNum}">
                  <input type="hidden" name="amount" value="${cri.amount}">
                  <input type="hidden" name="keyword" value="${cri.keyword}">
                   </form>
                   
                </div>
                
            <%--  <%@include file="../includes/footer.jsp" %> --%>
             
<script>
   
   $(document).ready(function(){
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
   });
    	
	   
	
</script>
	
	
</body>
</html>