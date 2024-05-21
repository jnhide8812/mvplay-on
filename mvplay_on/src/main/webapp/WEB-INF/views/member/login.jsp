<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<div id="container">
	<div class="l_wrap">
		<div class="member_h">
			<header>
				<div class="logo_w">
					<a href="/main"><img src="../resources/icon/logo_m.png" class="title_icon"></a>
				</div>
				<div class="sign_button">
					<a href="/member/signUp">회원가입</a>
				</div>
			</header>
		</div>
		<div class="login_main">
			<form id="login_form" method="post" class="l_box">
				<ul>
					<li class="login_top">
						<div class="l_title">
							<h1>로그인</h1>
						</div>
						<div class="find">
							<a href="findId.do">아이디 찾기</a>
							<span class="mf">|</span>
							<a href="findPass.do">비밀번호 찾기</a>
						</div>
					</li>
					<li>
						<input type="text" placeholder="이메일(example@gmail.com)" name="userId"
						class="login_input">
					</li>
					<li>
						<input type="password" placeholder="비밀번호를 입력해주세요"
						name="upw" class="login_input">
					</li>
					<c:if test="${result == 0}">
						<div class = "login_warn">이메일 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>
					<li>
						<input type="button" value="로그인" class="login_button">
					</li>
				</ul>
			</form>
		</div>
		<div class="s_footer">
			<div class="f_content">
				<p class="line1">
					<span class="e1">고객센터(이용 및 경제 문의) cs@watcha.co.kr</span>,
						02-515-9985(유료)/<span class="e1">제휴 및 대외 협력
						https://watcha.team/contact</span><br>
				</p>
				<p class="line2">
					주식회사 왓차/대표 박태훈/서울특별시 서초구 강남대로 343 신덕빌딩 3층 / 사업자등록번호 211-88-66013 /
					<span class="e2">통신판매업 신고번호 제 2019-서울서초-0965호</span> / 호스팅 서비스 제공자
					아마존웹서비시즈코리아 유한회사 / 대표번호 02-518-9985 / <span class="e2">이용약관</span>
					/ 개인정보 처리 방침 / 청소년 보호청책
				</p>
			</div>
		</div>
	</div>
</div>
	<script>
	/*로그인 버튼 클릭 메서드*/
	$(".login_button").click(function(){
		//alert("로그인 버튼 작동");
		
		/*로그인 메서드 서버 요청*/
		$("#login_form").attr("action", "/member/login");
		$("#login_form").submit();
	});
</script>
</body>
</html>