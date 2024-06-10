<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="/resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<!-- slide js -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
#player iframe{
width: 1200px;
height: 678px;

}

</style>
</head>
<body>
<div id = "container">
<!-- 헤더 -->
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/nav.jsp" %>
<div class="main_content">
		

<pre id="player">${movieInfo.movieUrl}</pre>
		
		
		
</div> <!-- main-content -->
<!-- FOOTER -->
<%@include file="../includes/footer.jsp" %>
</div> <!-- id="container" -->
</body>
</html>