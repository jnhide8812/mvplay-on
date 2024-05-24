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
	<div class="askboard">
		<h1>문의 게시판</h1>
		<div class="table_wrap">
			<a href="/board/enroll" class="top_btn">문의하기</a>
			<table>
				<thead>
					<tr>
						<th class="bno">번호</th>
						<th class="title">제목</th>
						<th class="writer">작성자</th>
						<th class="regdate">작성일</th>
						<th class="updatedate">수정일</th>
					</tr>
				</thead>
					<tr>
						<td><c:out value="${list.bno}"></c:out></td>
						<td><c:out value="${list.title}"></c:out></td>
						<td><c:out value="${list.writer}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
					</tr>
			</table>
		</div>
	</div>
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
 		}
    });
 
</script>
</body>
</html>