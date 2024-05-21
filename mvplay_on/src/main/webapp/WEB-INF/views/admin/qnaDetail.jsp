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
.table_qna{ 
	border-collapse: collapse;
	color: #292929;
	border:2px solid black;
	min-width: 600px;
}
.table_qna th{
	background-color: #f7f7f7;	
}
.table_qna th, td{
	text-align: center;
	min-width: 100px;
	height: 30px;
	border: 1px solid black;
	padding: 3px;
}
/* 문의게시판-제목 th */
.table_title{
	height: 46px;
	font-weight: 800;
	font-size: 20px;
	
}
.table_content{
	min-height: 300px;
	text-align: left;
	padding-left: 20px;
	padding-top: 20px;
}
/* 답변테이블 */
.table_answer {
	border-collapse: collapse;
	color: #292929;
	border:2px solid black;
	min-width: 600px;
	background-color: #f7f7f7;	
}
.table_answer th, td{
	text-align: left;
	height: 30px;
	border: 1px solid black;
	padding : 5px;
}

</style>

</head>
<body>
<header>
	<%@ include file="../includes/admin/header.jsp"%>
</header>

<div class="admin_content_wrap">
	<!-- 문의 게시글 영역 -->
	<div class="qna_table_area">
		
		<table class="table_qna">
			<tr>
				<th colspan="4" class="table_title"><c:out value="${vo.title}"/></th>
			</tr>
			<tr>
				<th>등록자명</th><td><c:out value="${vo.userId }"/></td><th>등록일</th><td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>조회수</th><td><c:out value="${vo.viewCnt }"/></td><th>답변 여부</th><td><c:out value="${vo.answerCk }"/></td>
			</tr>
			<tr>
				<td colspan="4"><div class="table_content"><c:out value="${vo.content}"/></div></td>
			</tr>
		
		</table>
	</div><!-- 문의 게시글 영역 qna_detail_area -->
	
	답변 달기 / 답변 보이기 / 답변 수정하기 필요함
	<!-- 답변 댓글영역 -->
	
	<div class="qna_answer_area">
	<hr>
	
	<!-- 답변이 있으면 보임 -->
	<div>
		<c:if test="${vo.answerCk =='O'}">
		<table class="table_answer">
			<tr>
				<td colspan="2"><c:out value="${vo.answer }"/></td>
			</tr>
			<tr>
				<td>답변일 : <c:out value="${vo.answerDate }"/></td><td>수정 버튼 예정임</td>
			</tr>
	
		</table>
		</c:if>
	</div>
	
	<!-- 답변이 없으면 답변 달기 -->
	<div>
		<c:if test="${vo.answerCk =='X'}">
			<form action="/admin/qnaDetail" method="post">
				<input type="hidden" name="ano" value='<c:out value="${vo.ano }" />'>
				<input type="text" name="answer">
				<input type="submit" value="답변 달기">
			</form>
		</c:if>	
	</div>
	
	</div>
	<!-- 답변 영역 끝 : qna_answer_area -->
	

	
	
	
	
	


</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>

</body>
</html>