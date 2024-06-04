<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 환불 신청</title>
<style>
.admin_content_wrap{}
.qboard_area{
	width: 100%;
	margin: 0 auto;
	align: center;
}

/* 문의 게시판 */
.table_purchase{
	border-collapse: collapse;
	color: #292929;
	border:2px solid black;
	
}
.table_purchase th{
	min-width: 70px;
	background-color: #f7f7f7;
	text-align: center;
	height: 46px;
	border: 1px solid black;
	padding: 20px;
}
.table_purchase td{
	width: 300px;
	text-align: left;
	height: 34px;
	border: 1px solid black;
	padding: 20px;
	
}
/* 문의게시판-제목 th */
.table_title{
	width: 350px;
}





</style>
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

	<h2>관리자 - 환불 신청</h2><br>
	<div class="wrap">
	
	<!-- 영화 구매 정보 영역 -->
	<div class="purchase_table_area">
	<form action="/admin/refund" method="post" id="refundForm">		
	
		<input type="hidden" name="id" value='<c:out value="${purchaseInfo.id}"/>' >
		<input type="hidden" name="refundPrice" value='<c:out value="${purchaseInfo.buyPrice}"/>' >
		<input type="hidden" name="userId" value='<c:out value="${purchaseInfo.userId}"/>' >
		
		<table class="table_purchase">
			<tr>
				<th>구매자</th><td><c:out value="${purchaseInfo.id}"/></td>
			</tr>		
			<tr>
				<th>영화 제목</th>
				<td><a class="move" href='<c:out value="${purchaseInfo.movieId}"/>'><c:out value="${purchaseInfo.movieName}"/></a></td>
			</tr>
			<tr>
				<th>구매일</th><td><fmt:formatDate value="${purchaseInfo.startDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>구매 금액</th><td><c:out value="${purchaseInfo.buyPrice}"/></td>
			</tr>
			<c:if test="${!empty purchaseInfo.refundStatus}">
				<input type="hidden" name="refundId" value="${purchaseInfo.refundId }">
				<tr>
					<th>환불 진행 사항</th><td><c:out value="${purchaseInfo.refundStatus}"/>
					<c:if test="${purchaseInfo.refundStatus != '환불완료'}">
						<button type="button" id="refundCancelBtn">환불 취소</button>
						<button type="button" id="refundConfirmBtn">환불 완료</button>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>환불 신청일</th><td><fmt:formatDate value="${purchaseInfo.refundDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			
			<tr>
				<td colspan="2"><a href="javascript:history.back();">뒤로가기</a></td>
			</tr>
			</c:if>
			<c:if test="${empty purchaseInfo.refundStatus}">
				<tr>
					<td colspan="2"><input type="submit" value="환불하기">
						<a href="javascript:history.back();">뒤로가기</a>
					</td>
				</tr>
			</c:if>	
		
		</table>
	</form>	
	</div><!-- 영화 구매 정보 영역 purchase_detail_area -->
	
	
	
	<!-- 위치 기억 임시 -->
	<div class="qboard_area">
		<form id="moveForm" action="/admin/purchase" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div><!-- "qboard_area"-->
	</div><!-- wrap -->

</div><!-- admin_content_wrap -->

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>


<script>
let moveForm = $('#moveForm');

//환불 요청 폼
let refundForm = $('#refundForm');
//환불 요청 버튼
let refundConfirm = $('#refundConfirmBtn');
//환불 취소 버튼(삭제)
let refundCancelBtn = $('#refundCancelBtn');

//페이지 이동 버튼
$(".pageMaker_btn a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.submit();
	
});

//환불 완료 버튼
refundConfirm.on("click", function(e){
	e.preventDefault();
	
	
	//refundForm.append("<input type='hidden' name='refundId' value='"+$(this).attr('href') + "'>");
	refundForm.attr("method", "post");
	refundForm.attr("action", "/admin/refundUpdate");
	refundForm.submit();
	
});
//환불 취소 버튼 
refundCancelBtn.on("click", function(e){
	e.preventDefault();
	alert("환불 취소");
	
	refundForm.attr("method", "post");
	refundForm.attr("action", "/admin/refundDelete");
	refundForm.submit();
	
});

// 영화 상세 페이지 이동
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr('href') + "'>");
	moveForm.attr("action", "/admin/movieDetail");
	moveForm.submit();
	
});


</script>
</body>
</html>