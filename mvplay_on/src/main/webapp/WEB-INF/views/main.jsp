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
<script src="path/to/swiper.min.js"></script>
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
				 <section class="list"> <!-- 영화 신작 -->
					 <c:if test="${listcheck != 'empty'}">
						<h1 class="list_name">New</h1>
						<div class="swiper-container swiper1">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
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
													<span class="r"><fmt:formatNumber value="${movieList.rating}" pattern="0.00" /></span>
													<span class="c"><c:out value="${movieList.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
								<div class="swiper_button_next">
									<img class="slide" src="/resources/icon/slide_right.png">
								</div> 
								<div class="swiper_button_prev">
									<img class="slide" src="/resources/icon/slide_left.png">
								</div> 
								<div class="swiper_pagination"></div>  <!-- 페이징 -->
						</div> <!-- swiper-container -->	
					</c:if>
				</section>
	
				<section class="list">  <!-- 영화 랭킹 -->
					<c:if test="${listcheck != 'empty'}">
					<h1 class="list_name">Ranking</h1>
						<div class="swiper-container swiper2">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<c:forEach items="${movieRank}" var="movieRank">
										<ul>
											<li>
												<a class="move" href="/movie/movieDetail?movieId=${movieRank.movieId}">
													<img src="/resources/img/${movieRank.poster}" class="poster">
												</a>
											</li>
											<li class="subject">
												<a class="move" href="/movie/movieDetail?movieId=${movieRank.movieId}">
													<c:out value="${movieRank.movieTitle}"></c:out><br>
												</a>
											</li>
											<li class="iinn">
												<img class="star_rate" src="/resources/icon/star-fill.svg">
												<span class="r"><c:out value="${movieRank.rating}"></c:out></span>
												<span class="c"><c:out value="${movieRank.cate1}"></c:out></span>
											</li>		
										</ul>
									</c:forEach>
								</div>
							</div>
							<div class="swiper_button_next">
								<img class="slide" src="/resources/icon/slide_right.png">
							</div>  <!-- 다음버튼 -->
							<div class="swiper_button_prev">
									<img class="slide" src="/resources/icon/slide_left.png">
							</div>  <!-- 이전버튼 -->
							<div class="swiper_pagination"></div>
						</div> <!-- swiper2 -->
					</c:if>
				</section>
			</div> <!-- showlist -->
		</div> <!-- main-content -->
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

<!-- swiper script -->
<script>
new Swiper('.swiper-container', {

	slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 15, // 슬라이드간 간격
	slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
</body>
</html>