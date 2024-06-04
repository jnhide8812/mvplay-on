<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/movie/movieSearch.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<div id="container">
        <!-- 헤더 -->
		<%@include file="../includes/header.jsp"%>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<%@include file="../includes/nav.jsp"%>
		<div class="main_content">
		    <div class="search_area">
		        <c:forEach items="#{movieList}" var="movieList">
		            <div class="ls">
		               <a href="/movie/movieDetail?movieId=${movieList.movieId}">
			              <img src="/resources/img/${movieList.poster}" class="res">
			           </a>
		            </div>
		            <div class="rs">
			            <ul>
			                <li class="tt">${movieList.movieTitle}</li>
			                <li class="info">
			                	<span>${movieList.cate1}</span>
			               		<span>${movieList.movieDate}</span>
			                </li>
			            </ul> 
			       </div> 
		        </c:forEach>
		    </div>
		</div>
		<!-- 페이지이동 -->
		<%-- <div class="page_wrap">
			<ul class="page">
				<!-- 이전 버튼 -->
				<c:if test="${page.prev}">
					<li class="page_btn prev"><a href="${page.pageStart - 1}">이전</a>
					</li>
				</c:if>
				<!-- 페이지 번호 -->
				<c:forEach begin="${page.pageStart}" end="${page.pageEnd}" var="num">
					<li class="page_btn ${page.cri.pageNum == num ? 'active':''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:if test="${page.next}">
					<li class="page_btn next"><a href="${page.pageEnd + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</div> --%>
		<%-- <form id="moveForm" action="/movie/movieSearch" method="get">
			<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
			<input type="hidden" name="amount" value="${page.cri.amount}">
			<input type="hidden" name="keyword" value="${page.cri.keyword}">
		</form>	 --%>
		<!-- 하단 -->
		<%@include file="../includes/footer.jsp"%>	
</div>
    <script>
    
	    /* let moveForm = $('#moveForm');
		 
		
		$(".page_btn a").on("click", function(e){
		    
		    e.preventDefault();
		    
		    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		    
		    moveForm.submit();
		}); */
    
    </script>
</body>
</html>