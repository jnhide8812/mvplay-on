<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id = "containter">
	<div class="wrap">
	<!-- 헤더 -->
		<header>
			<div class="top_content">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="searchText" class="main_search">
                	<input type ="button" onclick="location.href='search.do'" class="search_icon">
                </div>
                <c:if test="${member == null}">     <!-- 로그인 X -->
					<div class="login_area">
						<ul class="l_area">
							<li class="lg"><a href="/member/login">로그인</a></li>
							<li class="join_button"><a href="/member/signUp">회원가입</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${member != null}">		<!-- 로그인 O -->
					<ul class="after_login">
					<c:if test="${member.ugrade == 0}">
					<!-- 관리자 계정 -->
						<li class="manager"><a href="/admin/main">관리자 페이지</a></li>
					</c:if>
						<li><a id="logout_button">로그아웃</a></li>
						<li><a href="/member/mypage">My</a></li>
					</ul>
				</c:if>
			</div>
		</header>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<nav>
			<h1>navi-menu</h1>
		</nav>
		<!-- 메인 content -->
		<div class="main_content">
		<!-- 영화 신작 -->
			<div class="mnew">
				<h1>new</h1>
			</div>
		<!-- 영화 랭킹 -->
			<div class="mranking">
				<h1>ranking</h1>
			</div>
		</div>
		<!-- 푸터 -->
		<footer>
			<div class="footer_wrap">
				<div class="r_wrap">
					<div class="f_right">
						<div class="f_top">
							<nav class="top">
								<ul>
									<li>왓챠피디아 서비스 이용 약관</li>
									<li></li>
									<li class="effect">개인정보 처리 방침</li>
									<li></li>
									<li class="effect">왓챠 서비스 이용 약관</li>
									<li></li>
									<li>고객센터</li>
									<li></li>
									<li>채용정보</li>
								</ul>
							</nav>
						</div>
						<div class="f_middle">
							<ul>
								<li>고객센터(이용 및 결제 문의)</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="l_wrap">
					<div class="sns_wrap">
						<ul class="sns">
							<li><a href="#">f</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>    <!-- class="wrap" -->
</div>  <!-- id="container" -->
<script>
/*로그아웃 버튼 적용 */
 $("#logout_button").click(function(){
	//alert("버튼작동");
	$.ajax({
		type:"POST",
		url:"/member/logout.do",
		success:function(data){
			//alert("로그아웃 성공");
			document.location.reload();
		}
	}); //ajax 
 });
 
</script>
</body>
</html>