<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 페이지</title>
<link rel="stylesheet" href="../resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<!-- slide js -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
<div id = "container">
	<!-- 헤더 -->
 	<%@include file="../includes/header.jsp" %>
 		<%@include file="../includes/nav.jsp" %>
		<div class="main_content">
			<div class="show_list">
				 <section class="list"> <!-- 영화 신작 -->
					 <c:if test="${listcheck != 'empty'}">
					 
					 <c:forEach items="${cate1List}" var="cate1List">
						<h1 class="list_name"><c:out value='${cate1List.cate1}'/></h1>
						<div class="swiper-container swiper1">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieList}" var="movieList">
										<c:if test="${movieList.cate1==cate1List.cate1}">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieList.movieId}">

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
													<span class="r"><fmt:formatNumber value="${movieList.rating}" pattern="0.0#" /></span>
													<span class="c"><c:out value="${movieList.cate1}"></c:out></span>
												</li>		
											</ul>
											</c:if>
										
										</c:forEach><!-- 영화 리스트 end -->
										
										
									</div>
								</div> <!-- swiper-wrapper -->
								<br><br>
						</div> <!-- swiper-container -->	
						</c:forEach><!-- 카테고리 end -->
					</c:if>
				</section>
				<section class="list">  <!-- 영화 랭킹 -->
					<c:if test="${listcheck != 'empty'}">
					<h1 class="list_name">Ranking</h1>
						<div class="swiper-container swiper2">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<c:forEach items="${movieRank}" var="movieRank" end="6">
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
						</div> <!-- swiper2 -->
					</c:if>
				</section>
			</div> <!-- showlist -->
		</div> <!-- main-content -->
	<!-- FOOTER -->
	<%@include file="../includes/footer.jsp" %>
</div>  <!-- id="container" -->

<script>
/* 영화 조회-
let moveForm = $('#moveForm');
	
$(".move").click(function(e) {
	e.preventDefault();
	moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/movie/movieDetail");
	moveForm.submit();
});
 */	
</script>

<!-- swiper script -->
<script>
document.addEventListener("DOMContentLoaded", function() {

    var mySwiper = new Swiper('.swiper-container', {
        slidesPerView: 6,
        slidesPerGroup: 6,
        observer: true,
        observeParents: true,
        spaceBetween: 20,
        centeredSlides : true,
        
    	loopFillGroupWithBlank : true,

    	loop : true, // 무한 반복
    	
        breakpoints: {
            1280: {
                slidesPerView: 4,
                slidesPerGroup: 4,
            },
            720: {
                slidesPerView: 2,
                slidesPerGroup: 2,
            }
        }
    });
    
});
</script>
</body>
</html>


<%--

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="../resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<!-- slide js -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
h2{
	color: white; 
	font-size: 30px; 
	font-weight: bold; 
	margin :10px 0 10px 10px;
	}
</style>
</head>
<!-- c:if로 ugrade가 1일 경우에만 구독하기 버튼 활성화, ugrade가 0(관리자),2(basic),3(premium)일 경우는 버튼 아예 없애기   -->
<body>
<div id = "container">
	<!-- 헤더 -->
 	<%@include file="../includes/header.jsp" %>
 		<%@include file="../includes/nav.jsp" %>
		<div class="main_content">
			<div class="show_list">
				 <section class="list"> <!-- 영화 신작 -->
					 <c:if test="${listcheck != 'empty'}">
						<h1 class="list_name">카테고리별</h1>
						<div class="swiper-container swiper1" style="margin-bottom: 30px;">
								<!-- SF -->
								<c:if test="${movieSF == 'empty' }">
								<p> 비어있습니다. </p>
								</c:if>
								<h2> 
								SF
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieSF}" var="movieSF">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieSF.movieId}">
														<img src="/resources/img/${movieSF.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieSF.movieId}">
														<c:out value="${movieSF.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieSF.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieSF.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->	
						
						<div class="swiper-container swiper1">
								<!-- 미스터리 -->
								<h2>
								미스터리
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieMystery}" var="movieMystery">
											<ul >
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieMystery.movieId}">
														<img src="/resources/img/${movieMystery.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieMystery.movieId}">
														<c:out value="${movieMystery.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieMystery.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieMystery.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->
						
						<div class="swiper-container swiper1">
								<!-- 범죄 -->
								<h2>
								범죄
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieCrime}" var="movieCrime">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieCrime.movieId}">
														<img src="/resources/img/${movieCrime.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieCrime.movieId}">
														<c:out value="${movieCrime.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieCrime.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieCrime.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->
							
						<div class="swiper-container swiper1">
								<!-- 애니메이션 -->
								<h2>
								애니메이션
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieAnimation}" var="movieAnimation">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieAnimation.movieId}">
														<img src="/resources/img/${movieAnimation.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieAnimation.movieId}">
														<c:out value="${movieAnimation.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieAnimation.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieAnimation.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->
						
						<div class="swiper-container swiper1">
								<!-- 드라마 -->
								<h2>
								드라마
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieDrama}" var="movieDrama">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieDrama.movieId}">
														<img src="/resources/img/${movieDrama.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieDrama.movieId}">
														<c:out value="${movieDrama.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieDrama.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieDrama.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->	
						
						<div class="swiper-container swiper1">
								<!-- 로맨스 -->
								<h2>
								로맨스
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieRomance}" var="movieRomance">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieRomance.movieId}">
														<img src="/resources/img/${movieRomance.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieRomance.movieId}">
														<c:out value="${movieRomance.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieRomance.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieRomance.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->
						
						<div class="swiper-container swiper1">
								<!-- 스릴러 -->
								<h2>
								스릴러
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieThriller}" var="movieThriller">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieThriller.movieId}">
														<img src="/resources/img/${movieThriller.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/movieDetail?movieId=${movieThriller.movieId}">
														<c:out value="${movieThriller.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieThriller.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieThriller.cate1}"></c:out></span>
												</li>		
											</ul>
										</c:forEach>
									</div>
								</div> <!-- swiper-wrapper -->
						</div> <!-- swiper-container -->
						
						<div class="swiper-container swiper1">
								<!-- 코미디 -->
								<h2>
								코미디
								</h2>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach items="${movieComedy}" var="movieComedy">
											<ul>
												<li>
													<a class="move" href="/movie/movieDetail?movieId=${movieComedy.movieId}">
														<img src="/resources/img/${movieComedy.poster}" class="poster">
													</a>
												</li>
												<li class="subject">
													<a class="move" href="/movie/moveiDetail?movieId=${movieComedy.movieId}">
														<c:out value="${movieComedy.movieTitle}"></c:out><br>
													</a>
												</li>
												<li class="iinn">
													<img class="star_rate" src="/resources/icon/star-fill.svg">
													<span class="r"><fmt:formatNumber value="${movieComedy.rating}" pattern="0.0" /></span>
													<span class="c"><c:out value="${movieComedy.cate1}"></c:out></span>
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
document.addEventListener("DOMContentLoaded", function() {

    var mySwiper = new Swiper('.swiper-container', {
        slidesPerView: 6,
        slidesPerGroup: 6,
        observer: true,
        observeParents: true,
        spaceBetween: 15,
        
    	loopFillGroupWithBlank : true,

    	loop : true, // 무한 반복
    	
        breakpoints: {
            1280: {
                slidesPerView: 4,
                slidesPerGroup: 4,
            },
            720: {
                slidesPerView: 2,
                slidesPerGroup: 2,
            }
        }
    });
    
});
</script>
</body>
</html>

 --%>