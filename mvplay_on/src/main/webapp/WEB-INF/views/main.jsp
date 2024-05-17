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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<div id = "containter">
	<div class="wrap">
		<header>
			<div class="top_content">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="searchText" class="main_search">
                	<input type ="button" onclick="location.href='search.do'" class="search_icon">
                </div>
				<div class="login_area">
					<ul class="l_area">
						<li class="lg"><a href="/member/login">로그인</a></li>
						<li class="join_button"><a href="/member/signUp">회원가입</a></li>
					</ul>
				</div>
			</div>
		</header>
		<nav>
			<h1>navi-menu</h1>
		</nav>
		<div class="main_content">
			<div class="mnew">
				<h1>new</h1>
			</div>
			<div class="mranking">
				<h1>ranking</h1>
			</div>
		</div>
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
	</div>
</div>
</body>
</html>