<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 구독 여부에 따라 버튼에 차이 두기 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>제목</div>
	<div>별점 넣는 란<input <c:out />></div>
	<ul>
		<li>별점을 리스트로?</li>
		<li>개봉일</li>
		<li>러닝타임</li>
		<li>장르</li>
	</ul>
	<div>
	<span></span>
	</div>
	<div>
		<button>구독하기</button>
		<button>구매하기</button>
	</div>
</div>
</body>
</html>