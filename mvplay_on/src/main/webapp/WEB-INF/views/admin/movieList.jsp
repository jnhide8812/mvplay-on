<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>
<link rel="stylesheet" href="/resources/css/admin/movieList.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
    <header>
	   <%@ include file="../includes/admin/header.jsp"%>
	</header>
    <div class="admin_content_wrap">
        <div class="movie_table_wrap">
	        <table class="movie_table">
	            <thead>
	                <tr>
	                    <td class="td_column">영화번호</td>
	                    <td class="td_column">영화제목</td>
	                    <td class="td_column">메인장르</td>
	                    <td class="td_column">개봉일자</td>
	                    <td class="td_column">이용등급</td>
	                </tr>
	            </thead>
	            <c:forEach items="#{mvList}" var="mvList">
	                <tr>
		                <td><c:out value="${mvList.movieId}"></c:out> </td>
		                <td><c:out value="${mvList.movieTitle}"></c:out></td>
		                <td><c:out value="${mvList.cate1}"></c:out> </td>
		                <td><fmt:formatDate value="${mvList.movieDate}" pattern="yyyy-MM-dd"/></td>
		                <td><c:out value="${mvList.movieCheck}"></c:out></td>
	                </tr>
	            </c:forEach>
	        </table>
        </div>
    </div>
    <footer>
	   <%@ include file="../includes/admin/footer.jsp"%>
	</footer>
</body>
</html>