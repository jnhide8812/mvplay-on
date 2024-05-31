<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 구매 목록</title>
</head>
<body>
	<h1>대여 소장 중인 영화</h1>
	
	<c:if test="${purchaseInfo.buymethod == 'rent' }">
	<button class="delete_btn" data-orderid="${movieInfo.movieId}"> 구매 취소 </button>
	</c:if>
	<c:if test="${purchaseInfo.buymethod == 'collect' }">
	<button class="delete_btn" data-orderid="${movieInfo.movieId}"> 구매 취소 </button>
	</c:if>
	
	   
	<!---------------------------  -->
	<!-- 헤더 -->
 		<%@include file="../includes/header.jsp" %>
 			<%@include file="../includes/nav.jsp" %>
		<div class="main_content">
			 <form id="deleteForm" action="/purchase/refund" method="post"></form>
			  <input type="hidden" name="Id">
		      <input type="hidden" name="userId" value="${memberInfo.userId}">
			 			<div class="show_list">
				 <section class="list">
					 <c:if test="${listcheck != 'empty'}">
						<h1 class="list_name">"${memberInfo.userId}"님이 대여 소장 중인 영화</h1>
						<div class="swiper-container swiper1">
										<c:forEach items="${movieList}" var="movieList">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieList.movieId}">
														<!--<c:out value="${movieList.poster}"></c:out>-->
														<!--<c:out value="${movieList.movieTitle}"></c:out>  임시 앵커 -->
														<img src="/resources/img/${movieList.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieList.movieId}">
														<c:out value="${movieList.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<%-- <span class="r"><c:out value="${movieList.rating}"></c:out></span> --%>
													<span class="c"><c:out value="${movieList.cate1}"></c:out></span>
													<button id="delete_btn" type="button" class="sbtn">환불하기</button>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->	
					</c:if>
				</section>
	
			</div> <!-- showlist -->
		</div> <!-- main-content -->
	<!-- FOOTER -->
	<%@include file="../includes/footer.jsp" %>
</div>  <!-- id="container" -->
	
	
	
	<script>
	alert("plist")
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		
		let id = $(this).data("id");
		$("#deleteForm").find("input[name='id']").val(id);
		$("#deleteForm").submit();
		
	});
	
	
	</script>
	
	
	
</body>

</html>