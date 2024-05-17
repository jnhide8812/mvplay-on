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
				<form action="searchc.do" class="sc">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="searchText" class="main_search">
                	<input type ="button" onclick="location.href='search.do'" class="search_icon">
                </div>
                </form>
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
			<div class="n_wrap">
				<div class="logo_w">
					<a href="/main">로고</a>
				</div>
			</div>
			<div class="m_wrap">
				<ul class="up">
					<li>
						<a href="#">
							<img src="resources/icon/sub_icon.png" class="side_icon">
							<span class="menu_name">구독</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="resources/icon/pay_icon.png" class="side_icon">
							<span class="menu_name">개별 구매</span>
						</a>
					</li>
				</ul>
				<hr>
				<ul class="down">
					<li>
						<a href="#">
							<img src="resources/icon/star_icon.png" class="side_icon">
							<span class="menu_name">평가</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="resources/icon/b_icon.png" class="side_icon">
							<span class="menu_name">보관함</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- 메인 content -->
		<div class="main_content">
		<!-- 영화 신작 -->
			<div class="mnew">
				<h1>new</h1>
				<img src="icon/f_icon.png">
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
									<li><a href="#">왓챠피디아 서비스 이용 약관</a></li>
									<li><a href="#" class="ef1">개인정보 처리 방침</a></li>
									<li><a href="#" class="ef1">고객센터</a></li>
									<li><a href="#">채용정보</a></li>
								</ul>
							</nav>
						</div>
						<div class="f_middle">
							<ul>
								<li>
									<span class="name">고객센터(이용 및 결제 문의)</span>
									<span class="bar">|</span>
									<span class="r_side">cs@watcha.co.kr/02-515-9985 (유료)</span>
								</li>
								<li>
									<span class="name">왓챠 기업용 서비스 문의</span>
									<span class="bar">|</span>
									<span class="r_side">b2b-sales@watcha.com / 기업용 서비스 제안서 다운로드</span>
								</li>
								<li>
									<span class="name">제휴 및 대외 협력</span>
									<span class="bar">|</span>
									<span class="r_side"><a href="http://watcha.team/contact">http://watcha.team/contact</a></span>
								</li>
								<li>
									<span class="name">B2B 구독권 구매 문의</span>
									<span class="bar">|</span>
									<span class="r_side">푸드마케팅(jinu1005@coopnc.com)</span>
								</li>
							</ul>
						</div>
						<div class="f_right">
							<nav>
								<ul class="sns_wrap">
									<li>
										<a href="#">
											<img src="icon/f_icon.png" class="ft_sns">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="icon/t_icon.png" class="ft_sns">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="icon/i_icon.png" class="ft_sns">
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class="f_bottom">
							<p class="address">
							주식회사 왓챠 | 대표 박태훈 | 서울특별시 서초구 강남대로 343 신덕빌딩 3층<br>
							사업자등록번호 211-88-66013 | <span>통신판매업 신고번호 제 2019-서울서초-0965호</span><br>
							호스팅 서비스 제공자 아마존웹서비시즈코리아 유한회사<br>
							WATCHA Copyright@2024 by Watch, Inc.All rights reserved.
							</p>
						</div>  
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