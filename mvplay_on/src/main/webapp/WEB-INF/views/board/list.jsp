<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<%@include file="../includes/header.jsp" %>
	<%@include file="../includes/nav.jsp" %>
	<div class="askboard">
		<h1>문의 게시판</h1>
		<div class="table_wrap">
		<c:if test="${listCheck != 'empty' }">
			<a href="/board/enroll" class="top_btn">문의하기</a>
			<table>
				<thead>
					<tr>
						<th class="bno">번호</th>
						<th class="title">제목</th>
						<th class="writer">작성자</th>
						<th class="regdate">작성일</th>
						<th class="updatedate">수정일</th>
						<th class="answerCk">답변 여부</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="list">
					<tr>
						<td><c:out value="${list.bno}"></c:out></td>
						<td><c:out value="${list.title}"></c:out></td>
						<td><c:out value="${list.writer}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
						<td>${list.answerCk}</td>
					</tr>
				</c:forEach>
			
				<!-- 게시글 없음 -->
				<c:if test="${listCheck =='empty' }">
					<div class="table_empty">
						등록된 내용이 없습니다. 
					</div>
				</c:if>
			</table>
		</c:if>
		</div>
	</div>
	<%@include file="../includes/footer.jsp" %>
</div>

</body>
</html>