<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>

<link rel="stylesheet" href="/resources/css/admin/movieInsert.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>
	<header>
	   <%@ include file="../includes/admin/header.jsp"%>
	</header>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>영화등록</span>
		</div>
		<br>
		<div class="admin_content_main">
			<form action="/admin/movieInsert" method="post" id="m_Insert">
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 제목</label>
					</div>
					<br>
					<div class="form_section_content">
						<input name="movieTitle">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>포스터</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="file" id ="fileItem" name='poster' style="height: 30px;">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 소개</label>
					</div>
					<br>
					<div class="form_section_content">
						<textarea name="movieContent" id="movieContext_textarea"></textarea>
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 URL</label>
					</div>
					<br>
					<div class="form_section_content">
						<input name="movieUrl">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 장르 1</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="radio" name="cate1" value="코믹" onclick="cateReadOnly()"/>코미디
						<input type="radio" name="cate1" value="호러" onclick="cateReadOnly()"/>호러
						<input type="radio" name="cate1" value="로맨스" onclick="cateReadOnly()"/>로맨스
						<input type="radio" name="cate1" value="액션" onclick="cateReadOnly()"/>액션
						<input type="radio" name="cate1" value="미스터리" onclick="cateReadOnly()"/>미스터리
					</div>
					<br>
					<div class="form_section_title">
						<label>영화 장르 2</label>
					</div>
					<br>
					<div class="form_section_content">
						<input name="cate2" id="cate2" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 이용등급 설정</label>
					</div>
					<br>
					<div class="form_section_content">
						<input type="radio" name="movieCheck" value="0" onclick="priceReadOnly()"/>구독전용
						<input type="radio" name="movieCheck" value="1" onclick="priceReadOnly()"/>구매만 가능
						<input type="radio" name="movieCheck" value="2" onclick="priceReadOnly()"/>대여만 가능
						<input type="radio" name="movieCheck" value="3" onclick="priceReadOnly()"/>구매 + 대여
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 구매가격(구매,구매대여시에만)</label>
					</div>
					<br>
					<div class="form_section_content">
						<input name="buyPrice" id="buyPrice" value="0" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>영화 대여가격(대여,구매대여시에만)</label>
					</div>
					<br>
					<div class="form_section_content">
						<input name="rentalPrice" id="rentalPrice" value="0" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>개봉일</label>
					</div>
					<br>
					<div class="form_section_content">
					    <input name="movieDate" autocomplete="off" readonly="readonly"/>
					</div>
				</div>						
			</form>
			<br>
			<div class="btn_section">
				<button id="insertBtn">등 록</button>
			</div>
		</div>
	</div>
	<footer>
	   <%@ include file="../includes/admin/footer.jsp"%>
	</footer>
	<script>
	
		// insertBtn 버튼 요소를 가져오기
	    var insertBtn = document.getElementById("insertBtn");
	
	    // 버튼에 클릭 이벤트를 추가
	    insertBtn.addEventListener("click", function(event) {
	        var a1 = document.getElementById("m_Insert");
			alert(a1.movieDate);
	        a1.submit();
	    });

	
		function priceReadOnly() {
	        var movieCheckRadios = document.getElementsByName('movieCheck');
	        var buyPriceInput = document.getElementById('buyPrice');
	        var rentalPriceInput = document.getElementById('rentalPrice');
	
	        for (var i = 0; i < movieCheckRadios.length; i++) {
	            if (movieCheckRadios[i].checked) {
	                var selectedValue = movieCheckRadios[i].value;
	
	                if (selectedValue === '1') {
	                    buyPriceInput.readOnly = false;
	                    rentalPriceInput.readOnly = true;
	                } else if (selectedValue === '2') {
	                    buyPriceInput.readOnly = true;
	                    rentalPriceInput.readOnly = false;
	                } else if (selectedValue === '3') {
	                    buyPriceInput.readOnly = false;
	                    rentalPriceInput.readOnly = false;
	                } else {
	                    buyPriceInput.readOnly = true;
	                    rentalPriceInput.readOnly = true;
	                }
	                return; // 종료
	            }
	        }
	    };
		
		function cateReadOnly() {
            var radio = document.getElementsByName('cate1');
            var input = document.getElementById('cate2');

            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    input.readOnly = false;
                    return; // 다른 조건을 확인할 필요 없이 종료
                }
            }
            // 아무것도 선택되지 않은 경우 readonly 유지
            input.readOnly = true;
        };
		
		ClassicEditor
			.create(document.querySelector('#movieContext_textarea'))
			.catch(error=>{
				console.error(error);
		});
		
		$(function() {
			
			$("input[name='movieDate']").datepicker(config);
			
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
		};
		
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e){
			
			let formData = new FormData();
			let fileInput = $('input[name="poster"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){
				
				return false;
				
			}
            
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '/admin/uploadAjax',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json'
			});
	
		});
		
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}

	</script>
</body>
</html>