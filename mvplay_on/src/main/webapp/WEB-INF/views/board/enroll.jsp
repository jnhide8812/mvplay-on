<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<link rel="stylesheet" href="/resources/css/basic/style.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="container">
	<div class="my">
		<%@include file="../includes/header.jsp" %>
		<%@include file="../includes/nav.jsp" %>
		
		<div class="eboard my_wrap">
			<div class="sub">
				<h1>문의하기</h1>
			</div>
			
			<div class="main_board">
			<form id="eboard" action="/board/enroll" method="post">
				<input type="hidden" name="userId" value="${member.userId }">
				<div class="input_wrap">
					<legend><span class="mtit">Title</span></legend>
					<span class="sub_type"><input type="text" name="title"></span>
				</div>
				<div class="input_wrap">
					<legend><span class="mtit">Content</span></legend>
					<textarea rows="3" name="content"></textarea>
				</div>
				
				<button class="sbtn">등록</button>
			</form>
			</div>

		</div> 
		<%@include file="../includes/footer.jsp" %>
	</div>
</div>

<script>
//문의하기 버튼
$(document).ready(function(){
	$(".sbtn").click(function(){
		$("#eboard").attr("action","/board/enroll");
		$("#eboard").submit();
	});
});
</script>

</body>
</html>