<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/get.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="container">
	<div class="view_wrap">
		<h1>조회 페이지</h1>
		<div class="view">
			<ul>
				<li>
					<div class="input_wrap">
						<label>게시판 번호</label>
						<input name="ano" readonly="readonly" value='<c:out value="${pageInfo.ano}"/>' >
					</div>
				</li>
				<li>
					<div class="input_wrap">
						<label>게시판 제목</label>
						<input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
					</div>
				</li>
				<li>
					<div class="input_wrap">
						<label>게시판 내용</label>
						<textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
					</div>
				</li>
				<li>
					<div class="input_wrap">
						<label>게시판 작성자</label>
						<input name="userId" readonly="readonly" value='<c:out value="${pageInfo.userId}"/>' >
					</div>
				</li>
				<li>
					<div class="input_wrap">
						<label>게시판 등록일</label>
						<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regDate}"/>' >
					</div>
				</li>
				<li>
					<div class="input_wrap">
						<label>게시판 수정일</label>
						<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
					</div>
				</li>
			</ul>
			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a> 
				<a class="btn" id="modify_btn">수정 하기</a>
			</div>
		</div> <!-- view -->
		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="ano" name="ano" value='<c:out value="${pageInfo.ano}"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
	</div> <!-- view_wrap -->
</div> <!-- container -->
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/ownList");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
</script>	
</body>
</html>