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
		            <div>
			            <ul>
			                <li>
			                    <a href="/movie/movieDetail?movieId=${movieList.movieId}">
			                        <img src="resources/img/${movieList.poster}" width="100px">
			                    </a>
			                </li>
			                <li>
			                    <div>
			                        <p>${movieList.movieTitle}</p>
			                        <p>${movieList.cate1}</p>
			                        <p>${movieList.movieDate}</p>
			                    </div>
			                </li>
			            </ul>    
		            </div>
		        </c:forEach>
		    </div>
		</div>	
		<!-- 하단 -->
		<%@include file="../includes/footer.jsp"%>	
    </div>
</body>
</html>