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
	max-width: 1000px;
		
}
.table_answer th, td{
	text-align: left;
	height: 30px;
	border: 1px solid black;
	padding : 5px;
	
}
.answerDiv{
	min-height: 100px; 
	font-size: 16px;
	/* background-color: yellow; */
	
}
/* ck 에디터 -div */
.ckeditor{
	width: 700px;
	height: 500px;
	font-size: 14px;
}


</style>
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
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
				<th><c:out value="${vo.ano }"/></th>
				<th colspan="3" class="table_title"><c:out value="${vo.title}"/></th>
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
	<br>
	
	<!-- 답변 댓글영역 -->
	<div class="qna_answer_area">
	
	<!-- 답변이 있으면 보임 -->
	<div>
		<c:if test="${vo.answerCk =='O'}">
		<table class="table_answer">
			<tr>
				<td>
					<div class="answerDiv"><pre>${vo.answer }</pre></div>
				</td>
			</tr>
			<tr>
				<td>답변일 : <c:out value="${vo.answerDate }"/></td>
			</tr>
		</table>
		</c:if>
	</div>
	
	<br>
	
	<!-- 답변 달기 -->
	<div class="ckeditor">
		<form id="answerForm">
			<input type="hidden" name="ano" value='<c:out value="${vo.ano }" />'>
			<textarea name="answer" id="answer_editor">${vo.answer }</textarea>
			<button id="addAnserBtn">답변 달기/수정하기</button>
			<button id="deleteAnser">삭제하기</button>		
		</form>
		
		
		
		
	</div>
	
	</div>
	<!-- 답변 영역 끝 : qna_answer_area -->
	
	
	
	
	
	


</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>
<script>
//CK에디터
ClassicEditor
	.create(document.querySelector('#answer_editor'))
	.catch(error=>{
		console.error(error);
});


var answerForm = $("#answerForm");
/*답변 달기 버튼*/
$("#addAnserBtn").on("click", function(e){
	e.preventDefault();
	answerForm.attr("action", "/admin/qnaDetail");
	answerForm.attr("method", "post");
	answerForm.submit();
});




//답변 삭제 버튼
$("#deleteAnser").on("click", function(e){
	e.preventDefault();
	answerForm.attr("action", "/admin/deleteAnswer");
	answerForm.attr("method", "post");
	answerForm.submit();
});



 
 
 
</script>


<!-- 시간 나면 페이징 처리 예정 : 검색어와 타입 넣어야함
참고 : boardEx => read.jsp 

//댓글-삭제 버튼 클릭
$(".replyDelete").click(function(){
	self.location = "/board/replyDelete?bno=${read.bno}"
			+ "&page=${scri.page}"
			+ "&perPageNum=${scri.perPageNum}"
			+ "&searchType=${scri.searchType}"
			+ "&keyword=${scri.keyword}"
			+ "&rno=" + $(this).attr("data-rno");
});

//약간 수정 - 참고 
self.location = "/admin/qnaDetail?ano=${vo.ano}"
	+ "&pageNum=${cri.pageNum}"
	+ "&amount=${cri.amount}"
	+ "&ano="?????;
});

	
 -->


</body>
</html>