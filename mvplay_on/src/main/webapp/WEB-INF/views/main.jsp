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
 
  
</head>
<body>
<div id = "container">
	<!-- 헤더 -->
	<%@include file="includes/header.jsp" %> 	
		<%@include file="includes/nav.jsp" %>   
		<div class="main_content">
			<div class="show_list">
				<section class="list">   <!-- 영화 신작 -->
				 <c:if test="${listcheck != 'empty'}">
					<h1 class="list_name">New</h1>
					<div class="minfo">
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
								<span class="r"><c:out value="${movieList.rating}"></c:out></span>
								<span class="c"><c:out value="${movieList.cate1}"></c:out></span>
							</li>		
						</ul>
					</c:forEach>
					</div>
				</c:if>
				</section>
			<!-- 영화 랭킹 -->
				<section class="list">
					<h1>ranking</h1>
				</section>
			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="includes/footer.jsp" %>

</div>  <!-- id="container" -->
<script>
let moveForm = $('#moveForm');

	/* 영화 조회 */
	$(".move").click(function(e) {
		e.preventDefault();
		moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr("href") + "'>");
		moveForm.attr("action", "/movie/movieDetail");
		moveForm.submit();
	});
</script>
</body>
</html>