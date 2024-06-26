<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의 게시판</title>
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
	padding: 10px;
}
.table_purchase td{
	text-align: center;
	height: 34px;
	border: 1px solid black;
}
/* 문의게시판-제목 th */
.table_title{
	width: 350px;
}

/* 페이지 메이커 */
.pageMaker_wrap{
	text-align: center;
	margin: auto;
    margin-top: 30px;
    margin-bottom: 40px;

}


.pageMaker{
    list-style: none;
    display: inline-block;
    
}	
.pageMaker_btn {
    float: left;
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
}
.next, .prev {
    border: 1px solid #ccc;
    padding: 0 10px;
}
.next a, .prev a {
    color: #ccc;
}
.active{							/* 현재 페이지 버튼 */
	border : 2px solid black;
	font-weight:400;
}

/* 검색 영역 */
.search_wrap{
	margin-top:15px;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='keyword']{
	width: 500px;
	padding: 4px 10px;
    font-size: 15px;
    height: 20px;
    line-height: 20px;
}
.search_btn{
	height: 32px;
    width: 80px;
    font-size: 18px;
    font-weight: bold;
    line-height: 20px;
    position: absolute;
    margin-left: 15px;
    background-color: #f7f7f7;
}

/*링크 짙은 파랑색*/
.qboard_area a:link{color: #3065ac;}
.qboard_area a:visited{color: #3065ac;}

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

	<h2>구매 대여 관리</h2><br>
	<div class="wrap">
		<!-- 게시물 있음 -->
		<div class="qboard_area">
		<c:if test="${listCheck !='empty' }">
			<table class="table_purchase">
				<tr>
					<th>주문번호</th><th>유저</th><th class="table_title">영화제목</th><th>대여가</th><th>소장가</th><th>구매일</th><th>만료일</th><th>환불하기</th>
				</tr>

				<!-- 목록 시작 -->
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.id }</td>
						<td>${list.userId }</td>
						<td><a class="move" href='<c:out value="${list.movieId}"/>'>${list.movieName }</a></td>
						<td>${list.rentalPrice }</td>
						<td>${list.buyPrice }</td>
						<td><fmt:formatDate value="${list.startDate}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${list.expiredDate}" pattern="yyyy-MM-dd" /></td>
						<td>
							
						<!-- 환불 진행사항 보기 --> 
						<!-- <c:if test="${empty list.refundStatus && list.buyPrice != 0}"><a href="/admin/refund?id=${list.id }">환불하기</a></c:if> -->
						<c:if test="${list.startDate<list.expiredDate  }">
							<a href="/admin/refund?id=${list.id }"><c:if test="${empty list.refundStatus}">환불하기</c:if></a>
						</c:if>
						
						<c:if test="${!empty list.refundStatus}">
							<a href="/admin/refund?id=${list.id }">
								<c:if test="${list.refundStatus=='환불완료' }"><b>환불완료</b></c:if>
								<c:if test="${list.refundStatus!='환불완료' }">진행사항 보기</c:if>
							</a>
						</c:if>

						</td>
					</tr>
				</c:forEach>
			
				<!-- 목록 끝 -->
	
				<!-- 게시글 없음 -->
				<c:if test="${listCheck =='empty' }">
					<div class="table_empty">
						등록된 내용이 없습니다. 
					</div>
				</c:if>
 			</table>
		</c:if>
		
	<!-- 검색 영역 시작 search_wrap -->
	<div class="search_wrap">
		<form id="searchForm" action="/admin/purchase" method="get">
			<div class="search_input">
				유저 검색 : <input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
				<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>">
				<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/>">
				<button class="btn search_btn">검 색</button>
			</div>
		</form>
	</div>
	<!-- 검색 영역 끝 search_wrap-->
	
	<!-- 페이지 메이커 시작 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageMaker_btn prev">
					<a href="${pageMaker.pageStart -1 }">이전</a>
				</li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ?  'active':''}">
					<a href="${num }">${num }</a>
				</li>
			</c:forEach>
			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next }">
				<li class="pageMaker_btn next">
					<a href="${pageMaker.pageEnd +1 }">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 페이지 메이커 끝 -->
	
	<form id="moveForm" action="/admin/purchase" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	
	</div><!-- "qboard_area"-->
	
	
	</div><!-- wrap -->

</div>

<footer>
	<%@ include file="../includes/admin/footer.jsp"%>
</footer>


<script>
$(document).ready(function(){
	
let rResult = '<c:out value="${refund_result}" />';
	checkResult(rResult);
	
	function checkResult(result){
		if(result === ''){
			return;
		}
		alert("주문번호 '" + rResult +"'의 환불이 신청되었습니다.\n");
	}

//환불 완료 알림
let rcResult = '<c:out value="${refund_confirm}" />';
	checkComResult(rcResult);
	function checkComResult(result){
		if(result === ''){
			return;
		}
		alert("주문번호 '" + rcResult +"'의 환불이 완료되었습니다.\n");
	}
//환불 취소 알림
let rcancelResult = '<c:out value="${refund_cancel}" />';
	checkCancelResult(rcancelResult);
	
	function checkCancelResult(result){
		if(result ===''){
			return;
		}
		alert("주문번호 '" + rcancelResult +"'의 환불이 취소되었습니다.\n");
	}

}); //$(document).ready(function)


let moveForm = $('#moveForm');
let searchForm = $('#searchForm');

//페이지 이동 버튼
$(".pageMaker_btn a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

/* 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	searchForm.submit();
	
});

//영화 상세 페이지 이동
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr('href') + "'>");
	moveForm.attr("action", "/admin/movieDetail");
	moveForm.submit();
	
});



</script>
</body>
</html>