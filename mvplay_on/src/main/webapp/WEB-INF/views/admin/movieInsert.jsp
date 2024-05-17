<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>
<link rel="stylesheet" href="/resources/css/admin/movieInsert.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>영화등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/movieInsert" method="post" id="insertForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 제목</label>
					</div>
					<div class="form_section_content">
						<input name="movieTitle">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>포스터</label>
					</div>
					<div class="form_section_content">
						<input name="poster" readonly="readonly">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 소개</label>
					</div>
					<div class="form_section_content">
						<textarea name="movieContext" id="movieContext_textarea"></textarea>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 URL</label>
					</div>
					<div class="form_section_content">
						<input name="movieUrl">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 장르</label>
					</div>
					<div class="form_section_content">
						<input type="radio" name="mainGenre" value="코믹"/>코미디
						<input type="radio" name="mainGenre" value="호러"/>호러
						<input type="radio" name="mainGenre" value="로맨스"/>코믹
						<input type="radio" name="mainGenre" value="액션"/>코믹
						<input type="radio" name="mainGenre" value="Comic"/>코믹
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 이용등급 설정</label>
					</div>
					<div class="form_section_content">
						<input type="radio" name="movieCheck" value="구독"/>구독전용
						<input type="radio" name="movieCheck" value="구매"/>구매만 가능
						<input type="radio" name="movieCheck" value="대여"/>대여만 가능
						<input type="radio" name="movieCheck" value="구독대여"/>구매 + 대여
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 가격(구매,대여시에만)</label>
					</div>
					<div class="form_section_content">
						<input name="buyPrice" id="buyPrice" readonly="readonly">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>개봉일</label>
					</div>
					<div class="form_section_content">
					    <input name="movieDate" readonly="readonly">
					</div>
				</div>						
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>
	<script>
		function priceReadOnly() {
	        var radioValue = document.querySelector('input[name="movieCheck"]:checked').value;
	        
	        if (radioValue != '구독') {
	            document.getElementById('buyPrice').readOnly = false;
	        } else {
	            document.getElementById('buyPrice').readOnly = true;
	        }
	    }
		
		ClassicEditor
			.create(document.querySelector('#movieContext_textarea'))
			.catch(error=>{
				console.error(error);
		});
		

		const config = {
			dateFormat : 'yy-mm-dd',
			showOn : "button",
			buttonText : "날짜 선택",
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			yearSuffix : '년',
			changeMonth : true,
			changeYear : true
		}

		$(function() {
			$("input[name='movieDate']").datepicker(config);
		});
	</script>
</body>
</html>