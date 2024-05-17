<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의 게시글</title>
</head>
<body>
<header>
	<%@ include file="../includes/admin/header.jsp"%>
</header>

<div class="admin_content_wrap">


	<c:out value="${vo.ano }"></c:out>
	<c:out value="${vo.title}"></c:out>
	<c:out value="${vo.content}"></c:out>
	<c:out value="${vo.userId }"></c:out>
	<c:out value="${vo.answerCk }"></c:out>
	<c:out value="${vo.viewCnt }"></c:out>
	<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" />


</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>

</body>
</html>