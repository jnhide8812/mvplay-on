<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board/enroll.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="container">
	<div class="eboard">
		<div class="main_board">
			<h1>게시판 등록</h1>
			<form id="eboard" action="/askboard/enroll" method="post">
				<div class="input_wrap">
					<label>Title</label> 
					<input name="title">
				</div>
				<div class="input_wrap">
					<label>Content</label>
					<textarea rows="3" name="content"></textarea>
				</div>
				<div class="input_wrap">
					<label>Writer</label>
					<input name="writer">
				</div>
				<button class="sbtn">등록</button>
			</form>
		</div>
	</div>
</div>
<script>
//회원가입 버튼 (회원가입 기능 적용)
$(document).ready(function(){
	$(".sbtn").click(function(){
		$("#eboard").attr("action","/askboard/enroll");
		$("#eboard").submit();
	});
});
</script>
</body>
</html>