<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/member/signUp.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

</head>
<body>
<div id="container">
	<div class="sign_wrap">
		<div class="member_h">
			<header>
				<div class="logo_w">
					<a href="/main"><img src="../resources/icon/logo_m.png" class="title_icon"></a>
				</div>
				<div class="login_button">
					<a href="/member/login">로그인</a>
				</div>
			</header>
		</div>
		<div class="s_content">
			<form id="sign_form" method="post"> 
				<h1>회원가입</h1>
				<ul class="sign">
					<li>
						<div class="mail_wrap">
							<div class="mail_input">
								<input class="sinput" name="userId" placeholder="이메일(example@gmail.com)">
							</div>
							<div class="mail_check">
								<div class="mail_check_input" id="mail_cehck_input_false">
									<input class="mail_ckinput" disabled="disabled" placeholder="인증번호">
								</div>
								<div class="mail_button">
									<span>인증번호 전송</span>
								</div>
								<div class="clearfix"></div>
								<span id="mail_check_input_warn"></span>
							</div>
						</div>
					</li>
					<li>
						<div class="pw_wrap">
							<div class="pw_input">
								<input class="sinput" name="upw" placeholder="비밀번호">
							</div>
							<div class="pwck_wrap">
								<div class="pwck_input">
									<input class="sinput" placeholder="비밀번호 확인">
								</div>
								<span class="pwck_input_re1">비밀번호가 일치합니다.</span>
								<span class="pwck_input_re2">비밀번호가 일치하지 않습니다.</span>
							</div>
						</div>
					</li>
					<li>
						<div class="birth_wrap">
							<div class="form_section_content">
								<input name="ubirth" autocomplete="off" readonly="readonly" class="sinput" placeholder="생년월일">
							</div>
						</div>
					</li>
					<li>
						<div class="sign_button_wrap">
							<input type="submit" class="sign_button" value="가입하기" />
						</div>
					</li>
					<li>
						<p class="cnt">결제 정보요? 충분히 눌러보시고 입력해도 늦지 않아요.</p>
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
//회원가입 버튼 (회원가입 기능 적용)
$(document).ready(function(){
	$(".sign_button").click(function(){
		$("#sign_form").attr("action","/member/signUp");
		$("#sign_form").submit();
	});
});

 

/* 캘린더 위젯 적용 */

	/* 설정 */
	const config = {
		dateFormat: 'yy-mm-dd',
		 prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    yearSuffix: '년',
	        changeMonth: true,
	        changeYear: true
		
}

	/*캘린더*/
	$(function() {
		$("input[name='ubirth']").datepicker(config);
	});
</script>
</body>
</html>