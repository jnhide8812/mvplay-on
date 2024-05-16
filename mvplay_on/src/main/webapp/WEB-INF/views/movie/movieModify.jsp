<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
<div id = "containter">
	<div class="wrap">
		<nav>
			<h1>navi-menu</h1>
		</nav>
		<header>
			<div class="top_content">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="searchText" class="main_search">
                	<input type ="button" onclick="location.href='search.do'" class="search_icon">
                </div>
				<div class="login_area">
					<ul class="l_area">
						<li><a href="/member/login">로그인</a></li>
						<li class="join_button"><a href="/member/signUp">회원가입</a></li>
					</ul>
				</div>
			</div>
		</header>
		
		<div class="main_content">
			<div class="mnew">
				<h1>new</h1>
			</div>
			<div class="mranking">
				<h1>ranking</h1>
			</div>
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
	</div>
</div>
</body>
</html>