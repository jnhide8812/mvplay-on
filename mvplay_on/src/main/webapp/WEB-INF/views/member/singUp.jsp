<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/signUp.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<div id = "sign_wrap">
	<form id="join_form" method="post">
		<div class="s_content">
			<h1>회원가입</h1>
			<ul class="sign">
				<li>
					<div class="mail_wrap">
						<label>이메일</label>
						<div class="mail_input_box">
							<input class="mail_input" name="memberMail">
						</div>
						<span class="final_mail_ck">이메일을 입력해주세요.</span> 
						<span class="mail_input_box_warn"></span>
						<div class="mail_check_wrap">
							<div class="mail_check_input_box" id="mail_check_input_box_false">
								<input class="mail_check_input" disabled="disabled" />
							</div>
							<div class="mail_check_button">
								<span>인증번호 전송</span>
							</div>
							<div class="clearfix"></div>
							<span id="mail_check_input_box_warn"></span>
						</div>
					</div>
				</li>
					<li>
						<div class="pw_wrap">
							<label>비밀번호</label>>
							<div class="pw_input_box">
								<input class="pw_input" name="memberPw"/>
							</div>
							<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
						</div>
						<div class="pwck_wrap">
							<div class="pwck_name">비밀번호 확인</div>
							<div class="pwck_input_box">
								<input class="pwck_input">
							</div>
							<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> 
							<span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
							<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
						</div>
					</li>
					<li>
						<div class="birth_wrap">
							<div class="birthday">
                               <label>생년월일</label>
                             </div>
                             <div class="form_section_content">
                                <input name="birthday" autocomplete="off" readonly="readonly">
                                <span class="birth_warn">생년월일을 선택해주세요.</span>
                             </div>
						</div>
					</li>
					<li>
						<div class="sign_button_wrap">
							<input type="submit" class="sign_button" value="가입하기"/>
						</div>
					</li>
					<li>
						<p>결제 정보요? 충분히 눌러보시고 입력해도 늦지 않아요.</p>
					</li>
				</ul>
			</div>
			<div class="s_footer">
				<div class="f_content">
					<p class="line1">
						<span class="e1">고객센터(이용 및 경제 문의) cs@watcha.co.kr</span>, 02-515-9985(유료)/<span class="e1">제휴 및 대외 협력 https://watcha.team/contact</span><br>
					</p>
					<p class="line2">
						주식회사 왓차/대표 박태훈/서울특별시 서초구 강남대로 343 신덕빌딩 3층 / 사업자등록번호 211-88-66013 / <span class="e2">통신판매업 신고번호 제 2019-서울서초-0965호</span> / 호스팅 서비스 제공자 아마존웹서비시즈코리아 유한회사 / 대표번호 02-518-9985 / <span class="e2">이용약관</span> / 개인정보 처리 방침 / 청소년 보호청책
					</p>
				</div>
			</div>
		</form>
	</div>
<script>
 /* 인증번호 이메일 발송 */
$(".mail_check_button").click(function(){
     var email = $(".mail_input").val();           //입력한 이메일
     var checkBox = $(".mail_check_input");	    //인증번호 입력란
     var boxWrap = $(".mail_check_input_box");		//인정번호 입력란 박스
     var warnMsg = $(".mail_input_box_warn");      //이메일 입력 경고글 
     alert("인증 코드가 입력하신 이메일로 전송 되었습니다.")
     
     /* 이메일 형식 유효성 검사 */
     if(mailFormCheck(email)) {
        warnMsg.html("이메일 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
     } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
     }

   $.ajax({
          
          type:"GET",
          url:"mailCheck?email=" + email,

          success:function(data){
       	   
       	  // console.log("data : " + data);
       	  checkBox.attr("disabled", false);
             boxWrap.attr("id", "mail_check_input_box_true");
             code = data;
          }
          
      });
  });
  
/*인증번호 비교*/
$(".mail_check_input").blur(function(){
     
     var inputCode = $(".mail_check_input").val();    //입력코드
     var checkResult = $("#mail_check_input_box_warn");   //비교 결과
      
     if(inputCode == code){                           
          checkResult.html("인증번호가 일치합니다");			//일치할 경우
          checkResult.attr("class", "correct");     
          mailnumCheck = true;
      } else {                                            
          checkResult.html("인증번호를 다시 확인해주세요.");		//일치하지 않을 경우
          checkResult.attr("class", "incorrect");
          mailnumCheck = false;
      } 
  });
  

/* 비밀번호 확인 일치 유효성 검사*/
$('.pwck_input').on("propertychange change keyup paste input", function(){
	
	var pw = $('.pw_input').val();
	var pwck = $('.pwck_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
		$('.pwck_input_re_1').css('display','block');
		$('.pwck_input_re_2').css('display','none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display','none');
		$('.pwck_input_re_2').css('display','block');
		pwckcorCheck = false;
	}
	
	
});

	/* 캘린더 위젯 적용 */

	/* 설정 */
	const config = {
		dateFormat : 'yy-mm-dd',
		showOn : "button",
		buttonText : "날짜 선택",
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		yearSuffix : '년',
		changeMonth : true,
		changeYear : true
	}

	/*캘린더*/
	$(function() {
		$("input[name='publeYear']").datepicker(config);
	});
</script>
</body>
</html>