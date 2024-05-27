<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
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
<script>
    $(document).ready(function(){
    
 		let result = '<c:out value="${result}"/>';
    	
 		checkAlert(result);
 		
 		function checkAlert(result){
 			if(result === ''){
 				return;
 			}
 			
 			if(result === "enroll success"){
 				alert("등록이 완료되었습니다.");
 			}
 		}
    });
 
</script>
</body>
</html>