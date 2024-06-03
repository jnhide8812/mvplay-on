<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 구매 목록</title>
</head>
<body>
    <h1>대여/소장 중인 영화</h1>

    <!-- 헤더 -->
   <%--  <%@include file="../includes/header.jsp"%>
    <%@include file="../includes/nav.jsp"%> --%>
    <div class="main_content">
        <form id="deleteForm" action="/purchase/pList" method="post"></form>
         <input type="hidden" name="userId" value="${memberInfo}">
  		 <input type="hidden" name="movieId" value="${movieInfo.movieId}">
        <div class="show_list">
            <section class="list">
                <c:if test="${not empty movieList}">
                    <h1 class="list_name">"${memberInfo}"님이 대여 소장 중인 영화</h1>

                    <c:forEach items="${movieList}" var="movie">
                        <!-- 각 영화 정보 표시 -->
                        <ul>
                            <li><a class="move" href="/movie/movieDetail?movieId=${movieInfo.movieId}">
                                <img src="/resources/img/${movieInfo.poster}" class="poster">
                            </a></li>
                            <li class="subject"><a class="move" href="/movie/movieDetail?movieId=${movieInfo.movieId}">
                                ${movie.movieTitle}<br>
                            </a></li>
                            <li class="iinn">
                                <span class="c">${movieInfo.cate1}</span>
                                <!-- 환불하기 버튼 -->
                                <button class="delete_btn" data-movieid="${movieInfo.movieId}">환불하기</button>
                            </li>
                        </ul>
                    </c:forEach>
                </c:if>
            </section>
        </div>
    </div>

    <!-- FOOTER -->
    <%-- <%@include file="../includes/footer.jsp"%> --%>
</body>
</html>



<script>
alert("영화리스트")
$(document).ready(function() {
    $(".delete_btn").on("click", function(e){
        e.preventDefault();
        
        console.log("userId : "+${member.userId});
       
        let movieId = $(this).data("movieid");
        $.get("/purchase/refund", {movieId: movieId}, function(data) {
            alert("환불 신청이 완료되었습니다.");
            // 환불 요청이 성공했을 때 추가적인 처리 가능
        });
    });
});
</script>


