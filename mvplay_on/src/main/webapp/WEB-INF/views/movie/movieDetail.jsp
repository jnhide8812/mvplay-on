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
<script>

</script>  
  
</head>
<body>
<div id = "container">
	<!-- 헤더 -->
	<header>
	<%@include file="../includes/header.jsp" %>
	</header>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<nav>
		<%@include file="../includes/nav.jsp" %>
		</nav>
		<!-- 메인 content -->
		<div class="main_content">
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
						<h1><input type="text" id="movieTitle" name="movieTitle" value="${movieInfo.movieTitle}" disabled="disabled" /></h1>
					</div>
					<div>
					<ul>
						<!-- 영화 평점 -->
						<li>
						<label>평균 </label>
						<c:out value="${movieInfo.rating}"></c:out>
						<label>점</label>
						<!-- 영화 개봉일 -->
						<fmt:formatDate value="${movieInfo.movieDate}" pattern="yyyy년"></fmt:formatDate>
						<!-- 영화 장르 -->
						<c:out value="${movieInfo.cate1}"></c:out>, <c:out value="${movieInfo.cate2}"></c:out>
						</li>
					</ul>
					</div>
					<div>
						<!-- 영화 줄거리 -->
						<input name="movieContent" value='<c:out value="${movieInfo.movieContent}"></c:out>' disabled="disabled" />
					</div>
					<div>
						<button id="subscribeBtn" class="btn">구독하기</button>
						<button id="buyBtn" class="btn buy_btn">구매하기</button>
					</div>
					<div id="reply">
				 <ol class="replyList">
				  <c:forEach items="${repList}" var="repList">
				   <li>
				    <p>
				    <span class="glyphicon glyphicon-user"></span>
				     ${repList.writer}
				     (<fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />)
				    </p>
				    
				    <p>${repList.content}</p>
				    
				    <p>                
					   <button type="button" class="replyUpdate btn btn-warning btn-xs" data-rno="${repList.replyNum}">수정</button>
					   <button type="button" class="replyDelete btn btn-danger btn-xs" data-rno="${repList.replyNum}">삭제</button>
					   
					   <script>					    
					    $(".replyDelete").click(function(){
					     self.location = "/movie/replyDelete?movieId=${read.movieId}"
					      + "&replyNum=" + $(this).attr("data-replyNum");   
					    });         
					   </script>
					</p>
				    
				  </li>
				 </c:forEach>     
				</ol>
				
				<section class="replyForm">
				<form role="form" method="post" autocomplete="off" class="form-horizontal">
			
				<input type="hidden" id="replyNum" name="replyNum" value="${repList.replyNum}" readonly="readonly" />
				
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
				</div>
				 
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<textarea id="replyContent" name="replyContent" class="form-control"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="repSubmit btn btn-success">작성</button>
					</div>
					<script>
						var formObj = $(".replyForm form[role='form']");
						        
						$(".repSubmit").click(function(){
						 formObj.attr("action", "replyWrite");
						 //formObj.attr("action", "movieDetail");
						 formObj.submit();
						});
					</script>
				</div>
			</form>
		</section>
			</div>
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