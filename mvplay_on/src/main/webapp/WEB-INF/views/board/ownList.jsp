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
 	<%@include file="../includes/header.jsp" %>
 	<div class="middle">
		<div class="askboard">
			<h1 class="ask">문의 게시판</h1>
			<div class="table_wrap">
				<div class="mv_en">
					<a href="/board/enroll" class="top_btn">문의하기</a>
				</div>
				<c:if test="${listCheck != 'empty' }">
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
					<c:forEach items="${ownList }" var="ownList">
						<tr>
							<td><c:out value="${ownList.ano}"></c:out></td>
							<td>
								<a class="move" href='/board/get?ano=<c:out value="${ownList.ano}"/>'>
	                        		<c:out value="${ownList.title}"/>
	                    		</a>
								</td>
							<td><c:out value="${ownList.userId}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ownList.regDate}"/></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ownList.updateDate}"/></td>
							<td>${ownList.answerCk}</td>
						</tr>
					</c:forEach>
				</c:if>
				</table>
					<!-- 게시글 없음 -->
					<c:if test="${ownListCheck =='empty' }">
						<div class="table_empty">
							등록된 내용이 없습니다. 
						</div>
					</c:if>
			</div>
		</div>
	</div>  <!-- middle -->
	<%@include file="../includes/footer.jsp" %>
</div>  <!-- container -->

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




</script>
</body>
</html>