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
			<c:if test="${not empty list}">
				<h1 class="list_name">"${member.userId}"님이 대여 소장 중인 영화</h1>
				<input type="hidden" name="userId" value="${member.userId}">
				
				<div class="ai_list">
				<c:forEach items="${list}" var="item">
	                <div class="watch">
	                   <!-- 각 영화 정보 표시 -->
	                    
	                   <ul>
							<li>
								<a class="move" href="/movie/movieDetail?movieId=${item.movieId}">
									<img src="/resources/img/${item.poster}" class="poster">
								</a>
	                       	</li>
	                        <li>
		                        <a class="subject" href="/movie/movieDetail?movieId=${item.movieId}">
		                           ${item.movieTitle}<br>
		                        </a>
	                        </li>
	                        <li>
	                           <!-- 환불하기 버튼 -->
	                           <input type="button" value="환불하기" class="refund"  data-movie-id="${item.movieId}" data-id="${item.id}">
	                        </li>
						</ul>
					</div>
	            </c:forEach>
	            </div>
			</c:if>
			<br><br>
			<c:if test="${not empty exList}">
				<h1 class="list_name">구매 만료된 영화</h1>
				<input type="hidden" name="userId" value="${member.userId}">
				
				<div class="ai_list">
				<c:forEach items="${exList}" var="exItem">
	                <div class="watch">
	                   <!-- 각 영화 정보 표시 -->
	                    
	                   <ul>
							<li>
								<a class="move" href="/movie/movieDetail?movieId=${exItem.movieId}">
									<img src="/resources/img/${exItem.poster}" class="poster">
								</a>
	                       	</li>
	                        <li>
		                        <a class="subject" href="/movie/movieDetail?movieId=${exItem.movieId}">
		                           ${exItem.movieTitle}<br>
		                        </a>
	                        </li>
	                        <%-- <li>
	                           <!-- 환불하기 버튼 -->
	                           <input type="button" value="환불하기" class="refund"  data-movie-id="${item.movieId}" data-id="${item.id}">
	                        </li> --%>
						</ul>
					</div>
	            </c:forEach>
	            </div>
			</c:if>
	     </form>
    </div>  <!--main_content -->
     <!-- FOOTER -->
     <%@include file="../includes/footer.jsp"%> 
</div>  <!-- container -->

    
<script>
//환불 요청 폼
$(".refund").on("click", function() {
    var movieId = $(this).data("movieId");
    var id = $(this).data("id");
    
    console.log("movieId:", movieId);  // 디버깅용 콘솔 출력
    console.log("id:", id);  // 디버깅용 콘솔 출력
    
    // 기존의 hidden input 요소 제거
    $("#refundForm input[name='movieId']").remove();
    $("#refundForm input[name='id']").remove();
    
    
    
    // 새로운 hidden input 요소 추가
    $("#refundForm").append('<input type="hidden" name="movieId" value="' + movieId + '">');
    $("#refundForm").append('<input type="hidden" name="id" value="' + id + '">');
    
    $("#refundForm").submit();
});

</script>



</body>
</html>






