<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<div class="eboard">
		<%@include file="../includes/header.jsp" %>
		<%@include file="../includes/nav.jsp" %>
		<div class="main_board">
			<h1>게시판 등록</h1>
			<form action="/askboard/enroll" method="post">
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
</body>
</html>