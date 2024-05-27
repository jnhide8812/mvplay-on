<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/list.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="container">

	<div class="askboard">
		<h1 class="ask">문의 게시판</h1>
		<div class="table_wrap">
		<c:if test="${listCheck != 'empty' }">
			<a href="/board/enroll" class="top_btn">문의하기</a>
			<table>
				<thead>
					<tr>
						<th class="ano">번호</th>
						<th class="title">제목</th>
						<th class="userId">작성자</th>
						<th class="regDate">작성일</th>
						<th class="updateDate">수정일</th>
						<th class="answerCk">답변 여부</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="list">
					<tr>
						<td><c:out value="${list.ano}"></c:out></td>
						<td>
							<a class="move" href='/board/get?ano=<c:out value="${list.ano}"/>'>
                        		<c:out value="${list.title}"/>
                    		</a>
							</td>
						<td><c:out value="${list.userId}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regDate}"/></td>
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
	<!-- 검색 영역 시작 search_wrap -->
	<div class="search_wrap">
		<form id="searchForm" action="/board/list" method="get">
			<div class="search_input">
				제목 검색 : <input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
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
	
	<form id="moveForm" action="/board/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>

	

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
			
			if(result == "modify success"{
				alert("수정이 완료되었습니다.");
			})
				
			if(result == "delete success"{
				alert("삭제가 완료되었습니다.");
			})
		}
});

let moveForm = $('#moveForm');
//let searchForm = $('#searchForm');

 $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.append("<input type='hidden' name='ano' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/board/get");
        moveForm.submit();
    });


//페이지 이동 버튼
$(".pageMaker_btn a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/board/list");
	moveForm.submit();
	
});

/*검색 버튼*/
$(".search_area button").on("click", function(e){
    e.preventDefault();
    let val = $("input[name='keyword']").val();
    moveForm.find("input[name='keyword']").val(val);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
});

</script>
</body>
</html>