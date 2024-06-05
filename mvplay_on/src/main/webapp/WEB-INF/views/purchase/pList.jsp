<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 구매 목록</title>
<link rel="stylesheet" href="/resources/css/purchase/pList.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <div id="container">
    <!-- 헤더 -->
    <%@include file="../includes/header.jsp"%>
    <%@include file="../includes/nav.jsp"%> 
    <div class="main_content">
	   <form id="refundForm" action="/purchase/refund" method="get">
	        <div class="ai_list">
	            <c:if test="${not empty list}">
		            <div class="doll_dance">
		            	<h1 class="list_name">"${member.userId}"님이 대여 소장 중인 영화</h1>
		            </div>
					<input type="hidden" name="userId" value="${member.userId}">
	                <c:forEach items="${list}" var="list">
	                <div class="watch">
	                   <!-- 각 영화 정보 표시 -->
	                   <%--  <input type="hidden" name="userId" value="${list.userId}"> --%>
	                   <ul>
							<li>
								<a class="move" href="/movie/movieDetail?movieId=${list.movieId}">
									<img src="/resources/img/${list.poster}" class="poster">
								</a>
	                       	</li>
	                        <li>
		                        <a class="subject" href="/movie/movieDetail?movieId=${list.movieId}">
		                           ${list.movieTitle}<br>
		                        </a>
	                        </li>
	                        <li>
	                           <!-- 환불하기 버튼 -->
	                           <input type="submit" value="환불하기" class="refund">
	                        </li>
						</ul>
					</div>
	                </c:forEach>
				</c:if>
			</div>
	     </form>
    </div>  <!--main_content -->
     <!-- FOOTER -->
     <%@include file="../includes/footer.jsp"%> 
</div>  <!-- container -->

    
<script>
//환불 요청 폼
/*let refundForm = $('#refundForm');


 $("#refund_btn").on("click", function(e){
    e.preventDefault();
    
    refundForm.attr("method", "post");
    refundForm.attr("action", "/purchase/refund");
    refundForm.submit();
   
   
   
});   
 */

</script>



</body>
</html>






