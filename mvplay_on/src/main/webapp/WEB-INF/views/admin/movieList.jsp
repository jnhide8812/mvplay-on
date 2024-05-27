<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>
<link rel="stylesheet" href="/resources/css/admin/movieList.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<header>
		<%@ include file="../includes/admin/header.jsp"%>
	</header>
	<div class="admin_content_wrap">
		<div class="movie_table_wrap">
			<table class="movie_table">
				<thead>
					<tr>
						<td class="td_column">영화번호</td>
						<td class="td_column">영화제목</td>
						<td class="td_column">메인장르</td>
						<td class="td_column">개봉일자</td>
						<td class="td_column">이용등급</td>
					</tr>
				</thead>
				<c:forEach items="#{mvList}" var="mvList">
					<tr>
						<td><c:out value="${mvList.movieId}"></c:out></td>
						<td><a class="move" href='<c:out value="${mvList.movieId}"/>'>
						    <c:out value="${mvList.movieTitle}"></c:out></a></td>
						<td><c:out value="${mvList.cate1}"></c:out></td>
						<td><fmt:formatDate value="${mvList.movieDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${mvList.movieCheck}"></c:out></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/movieList" method="get">
				<div class="search_input">
					<input type="text" name="keyword"
						value='<c:out value="${page.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${page.cri.pageNum}"></c:out>'>
					<input type="hidden" name="amount" value='${page.cri.amount}'>
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>
		<!-- 페이지이동 -->
		<div class="page_wrap">
			<ul class="page">
				<!-- 이전 버튼 -->
				<c:if test="${page.prev}">
					<li class="page_btn prev"><a href="${page.pageStart - 1}">이전</a>
					</li>
				</c:if>
				<!-- 페이지 번호 -->
				<c:forEach begin="${page.pageStart}" end="${page.pageEnd}" var="num">
					<li class="page_btn ${page.cri.pageNum == num ? 'active':''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:if test="${page.next}">
					<li class="page_btn next"><a href="${page.pageEnd + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<form id="moveForm" action="/admin/movieList" method="get">
			<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
			<input type="hidden" name="amount" value="${page.cri.amount}">
			<input type="hidden" name="keyword" value="${page.cri.keyword}">
		</form>
	</div>
	<footer>
		<%@ include file="../includes/admin/footer.jsp"%>
	</footer>
	<script>
		let moveForm = $('#moveForm');
		 
		/* 페이지 이동 버튼 */
		$(".page_btn a").on("click", function(e){
		    
		    e.preventDefault();
		    
		    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		    
		    moveForm.submit();
		});
		
		let searchForm = $('#searchForm');

		/* 영화 검색 버튼 동작 */
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
		
		// 영화 상세 페이지 이동
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='movieId' value='"+$(this).attr('href') + "'>");
			moveForm.attr("action", "/admin/movieDetail");
			moveForm.submit();
			
		});
		
		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("삭제 완료");
		}
		
		/* 수정 결과 경고창 */
		let update_result = '${update_result}';
		
		if(update_result == 1){
			alert("수정 완료");
		}
	</script>
</body>
</html>