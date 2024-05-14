<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/signUp.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<div id = "container">
	<div class="wrap">
		<div class="subject">
			<h1>회원가입</h1>
		</div>
		<div class="mail_wrap">
			<div class="mail_name">이메일</div> 
			<div class="mail_input_box">
				<input class="mail_input">
			</div>
			<div class="mail_check_wrap">
				<div class="mail_check_input_box">
					<input class="mail_check_input">
				</div>
				<div class="mail_check_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input class="pw_input">
			</div>
		</div>
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div>
			<div class="pwck_input_box">
				<input class="pwck_input">
			</div>
		</div>
		<div class="birth_section">
			<div class="birth_section_title">
				<label>생년월일</label>
			</div>
			<div class="birth_section_content">
				<input name="birth" autocomplete="off" readonly="readonly">
			</div>
		</div>
		<div class="join_button_wrap">
			<input type="button" class="signup_button" value="가입하기">
		</div>
	</div>
</div>
<script>
	/* 캘린더 위젯 적용 */
	
	/* 설정 */
	   const config = {
	      dateFormat: 'yy-mm-dd',
	      showOn : "button",
	      buttonText:"날짜 선택",
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
	     $( "input[name='publeYear']" ).datepicker(config);
	 });
</script>
</body>
</html>