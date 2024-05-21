<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script>

</script>  
  
</head>
<body>
<div id = "container">
	<!-- 헤더 -->
	<%@include file="includes/header.jsp" %>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<%@include file="includes/nav.jsp" %>
		<!-- 메인 content -->
		<div class="main_content">
		<!-- 영화 신작 -->
			<div class="mnew">
			 <c:if test="${listcheck != 'empty'}">
				<h1>new</h1>
				<img src="resources/icon/f_icon.png">
				<c:forEach items="${movieList}" var="movieList">
				<ul>
				
					<li>
					<a class="move" href='<c:out value="${movieList.movieId}"></c:out>'>
						<!--<c:out value="${movieList.poster}"></c:out>-->
						<c:out value="${movieList.movieTitle}"></c:out> <!-- 임시 앵커 -->
						<img alt="" src="${movieList.poster}">
					</a>
					<c:out value="${movieList.movieTitle}"></c:out><br>
					<c:out value="${movieList.cate1}"></c:out>, <c:out value="${movieList.cate2}"></c:out><br>
					<!--평점 구간 <c:out value="${movieRating}"></c:out><br>-->
					</li>
					
				</ul>
				</c:forEach>
			</c:if>
			</div>
		<!-- 영화 랭킹 -->
			<div class="mranking">
				<h1>ranking</h1>
			</div>
		</div>
		<!-- 푸터 -->
		<%@include file="includes/footer.jsp" %>

</div>  <!-- id="container" -->
<script>
	/*로그아웃 버튼 적용 */
	$("#logout_button").click(function() {
		//alert("버튼작동");
		$.ajax({
			type : "POST",
			url : "/member/logout.do",
			success : function(data) {
				//alert("로그아웃 성공");
				document.location.reload();
			}
		}); //ajax 
	});
	
	/* 영화 조회 */
	$(".move").on("click",function(e) {
		e.preventDefault();
		moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr("href") + "'>");
		moveForm.attr("action",
		/*if(member != null && ugrade == 2||3 ) {
			"/movie/subscribeDetail.jsp"
		}*/
		"/movie/movieDetail.jsp");
		moveForm.submit();
	});
</script>
</body>
</html>