<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의 게시판</title>
</head>
<body>
<header>
	<%@ include file="../includes/admin/header.jsp"%>
</header>


<div class="admin_content_wrap">
	<h2>문의 게시판</h2>
	<table>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>답변 여부</th><th>조회수</th>
		</tr>

	<!-- 목록 시작 -->
	<c:forEach items="${list }" var="list">
		<tr>
			<td>${list.ano }</td>
			<td>
				<a href="/admin/qnaDetail?ano=${list.ano }">${list.title }</a></td>
			<td>${list.userId }</td>
			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
			<td>${list.answerCk }</td>
			<td>${list.viewCnt }</td>
		</tr>
	</c:forEach>
	<!-- 목록 끝 -->
 
 </table>
	

</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>

</body>
</html>