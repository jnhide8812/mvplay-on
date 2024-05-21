<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의 게시글</title>

<style>
/* 문의 게시판 전체 테이블 */
.table_q{ 
	border-collapse: collapse;
	color: #292929;
	border:2px solid black;
	min-width: 600px;
}
.table_q th{
	background-color: #f7f7f7;	
}
.table_q th, td{
	text-align: center;
	min-width: 100px;
	height: 30px;
	border: 1px solid black;
	padding: 3px;
}
/* 문의게시판-제목 th */
.table_t{
	height: 46px;
	font-weight: 800;
	font-size: 20px;
	
}
.table_c{
	min-height: 300px;
	text-align: left;
	padding-left: 20px;
	padding-top: 30px;
}


</style>

</head>
<body>
<header>
	<%@ include file="../includes/admin/header.jsp"%>
</header>

<div class="admin_content_wrap">
<input type="hidden" value='<c:out value="${vo.ano }" />'>
<table class="table_q">
	<tr>
		<th colspan="4" class="table_t"><c:out value="${vo.title}"/></th>
	</tr>
	<tr>
		<th>등록자명</th><td><c:out value="${vo.userId }"/></td><th>등록일</th><td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th>조회수</th><td><c:out value="${vo.viewCnt }"/></td><th>등록일</th><td><c:out value="${vo.answerCk }"/></td>
	</tr>
	<tr>
		<td colspan="4"><div class="table_c"><c:out value="${vo.content}"/></div></td>
	</tr>

</table>


	

	
	
	
	
	


</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>

</body>
</html>