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
	<%@include file="../includes/header.jsp" %>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<%@include file="../includes/nav.jsp" %>
		<!-- 메인 content -->
		<div class="main_content">
		<!-- 영화 신작 -->
			<div class="">
				<div class="">
					<img alt="" src="${movieInfo.poster}">
					<div>
						<button id="likeBtn" class="btn like_btn">보고싶어요</button>
						<button id="ratingBtn" class="btn rating_btn">평가하기</button>
					</div>
				</div>
				
				<div>
					<div>
						<!-- 영화 제목 -->
						<h1><input name="movieTitle" value="<c:out value="${movieInfo.movieTitle}"></c:out>" /></h1>
					</div>
					<div>
						<!-- 영화 평점 -->
						<input name="movieRating" value='<c:out value=></c:out>' />
						<!-- 영화 개봉일 -->
						<input name="regDate" value='<c:out value="${movieInfo.regDate}"></c:out>' />
						<!-- 영화 장르 -->
						<input name="movieTag" value='<c:out value="${movieInfo.cate1}"></c:out>, <c:out value="${movieInfo.cate2}"></c:out>' />
					</div>
					<div>
						<!-- 영화 줄거리 -->
						<input name="movieContent" value='<c:out value="${movieInfo.movieContent}"></c:out>' />
					</div>
					<div>
						<button id="subscribeBtn" class="btn">구독하기</button>
						<button id="buyBtn" class="btn buy_btn">구매하기</button>
					</div>
				</div>
			</div>
		<!-- 푸터 -->
		<%@include file="../includes/footer.jsp" %>

</div>  <!-- id="container" -->
<script>
</script>
</body>
</html>