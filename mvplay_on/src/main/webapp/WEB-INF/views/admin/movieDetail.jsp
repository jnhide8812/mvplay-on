<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>
<link rel="stylesheet" href="/resources/css/admin/movieDetail.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
</head>
<body>
	<header>
		<%@ include file="../includes/admin/header.jsp"%>
	</header>
	<div class="wrapper">
		<div class="admin_content_wrap">
			<div class="admin_content_subject">
				<span>영화상세</span>
			</div>
			<br>
			<div class="admin_content_main">
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 제목</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="movieTitle"
							value="<c:out value="${movieInfo.movieTitle}"/>" readonly>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>포스터</label>
					</div>
					<br>
					<div class="form_section_content">
	                    <img src="/resources/img/${movieInfo.poster}" width="300px">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 소개</label>
					</div>
					<br>
					<div class="form_section_content">
						<textarea name="movieContent" id="movieContent_textarea" readonly>${movieInfo.movieContent}</textarea>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 URL</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="movieUrl"
							value="<c:out value='${movieInfo.movieUrl}'/>" readonly>
						<pre>${movieInfo.movieUrl}</pre>					
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 장르 1</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="cate1"
							value="<c:out value="${movieInfo.cate1}"/>" readonly>
					</div>
					<br>
					<div class="form_section_title">
						<label>영화 장르 2</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="cate2"
							value="<c:out value="${movieInfo.cate2}"/>" readonly>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 이용등급 설정</label>
					</div>
					<br>
					<div class="form_section_content">
						<c:if test="${movieInfo.movieCheck == '0'}">
						    <h2>구독</h2>
						</c:if>
						<c:if test="${movieInfo.movieCheck == '1'}">
						    <h2>구매</h2>
						</c:if>
						<c:if test="${movieInfo.movieCheck == '2'}">
						    <h2>대여</h2>
						</c:if>
						<c:if test="${movieInfo.movieCheck == '3'}">
						    <h2>구매+대여</h2>
						</c:if>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 구매가격</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="buyPrice"
							value="<c:out value="${movieInfo.buyPrice}"/>" readonly>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 대여가격</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="rentalPrice"
							value="<c:out value="${movieInfo.rentalPrice}"/>" readonly>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>개봉일</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="text" name="movieDate"
							value="<fmt:formatDate value='${movieInfo.movieDate}' pattern='yyyy-MM-dd'/>" readonly>
					</div>
				</div>
				<form id="moveForm" method="get">
					<input type="hidden" name="movieId" value='<c:out value="${movieInfo.movieId}"/>'>
				    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
				</form>
				<br>
				<div class="btn_section">
					<button id="updateBtn">수정</button>
					<button id="listBtn">목록</button>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../includes/admin/footer.jsp"%>
	</footer>
	<script>
	    let moveForm = $("#moveForm");
	    
	    // 수정 페이지 이동
		$("#updateBtn").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.attr("action", "/admin/movieUpdate");
			moveForm.submit();
			
		});
		
		//목록 페이지로 돌아가기
		$("#listBtn").on("click", function(e){
			
			e.preventDefault();
			
			$("input[name=movieId]").remove();
			moveForm.attr("action", "/admin/movieList")
			moveForm.submit();
			
		});
	
	
		ClassicEditor
			.create(document.querySelector('#movieContent_textarea'))
			.catch(error=>{
				console.error(error);
		});
	</script>	
</body>
</html>