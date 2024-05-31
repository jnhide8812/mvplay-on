<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvplay_on</title>
<link rel="stylesheet" href="/resources/css/admin/movieUpdate.css">
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
	<div class="wrapper">
		<div class="admin_content_wrap">
			<div class="admin_content_title">
				<span>영화등록</span>
			</div>
			<br>
			<div class="admin_content_main">
				<form action="/admin/movieUpdate" method="post" id="m_Update">
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 제목</label>
						</div>
						<br>
						<div class="form_section_content">
							<input type="text" name="movieTitle" value="${movieInfo.movieTitle}">
							<span id="warn_movieTitle">영화 제목을 입력해주세요.</span>
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
						<div class="form_section_content ct">
							<textarea name="movieContent" id="movieContent_textarea">${movieInfo.movieContent}</textarea>
						    <span id="warn_movieContent">영화 소개를 입력해주세요</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 URL</label>
						</div>
						<br>
						<div class="form_section_content">
							<input type="text" name="movieUrl" value="${movieInfo.movieUrl}">
							<span id="warn_movieUrl">영화URL을 입력해주세요</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 장르 1</label>
						</div>
						<br>
						<div class="form_section_content">
							<label class="radio"><input type="radio" name="cate1" value="코믹" onclick="cateReadOnly()"/>코믹</label>
						    <label class="radio"><input type="radio" name="cate1" value="호러" onclick="cateReadOnly()"/>호러</label>
						    <label class="radio"><input type="radio" name="cate1" value="로맨스" onclick="cateReadOnly()"/>로맨스</label>
							<label class="radio"><input type="radio" name="cate1" value="액션" onclick="cateReadOnly()"/>액션</label>
							<label class="radio"><input type="radio" name="cate1" value="미스터리" onclick="cateReadOnly()"/>미스터리</label>
							<br>
							<br>
							<label class="radio"><input type="radio" name="cate1" value="애니메이션" onclick="cateReadOnly()"/>애니메이션</label>
							<label class="radio"><input type="radio" name="cate1" value="판타지" onclick="cateReadOnly()"/>판타지</label>
							<label class="radio"><input type="radio" name="cate1" value="시대" onclick="cateReadOnly()"/>시대</label>
							<label class="radio"><input type="radio" name="cate1" value="음악" onclick="cateReadOnly()"/>음악</label>
							<label class="radio"><input type="radio" name="cate1" value="스포츠" onclick="cateReadOnly()"/>스포츠</label>
							<label class="radio"><input type="radio" name="cate1" value="SF" onclick="cateReadOnly()"/>SF</label>
						    <span id="warn_cate1">영화 장르1을 선택해주세요</span>
						</div>
						<br>
						<div class="form_section_title">
							<label>영화 장르 2</label>
						</div>
						<br>
						<div class="form_section_content">
							<input type="text" name="cate2" id="cate2" value="${movieInfo.cate2}" readonly="readonly">
						    <span id="warn_cate2">영화 장르2를 입력해주세요</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 이용등급 설정</label>
						</div>
						<br>
						<div class="form_section_content">
							<label class="radio"><input type="radio" name="movieCheck" value="0" onclick="priceReadOnly()"/>구독전용</label>
							<label class="radio"><input type="radio" name="movieCheck" value="1" onclick="priceReadOnly()"/>구매만 가능</label>
							<label class="radio"><input type="radio" name="movieCheck" value="2" onclick="priceReadOnly()"/>대여만 가능</label>
							<label class="radio"><input type="radio" name="movieCheck" value="3" onclick="priceReadOnly()"/>구매 + 대여</label>
						    <span id="warn_movieCheck">영화 이용등급을 선택해주세요</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 구매가격(구매,구매대여시에만)</label>
						</div>
						<br>
						<div class="form_section_content">
							<input type="text" name="buyPrice" id="buyPrice" value="${movieInfo.buyPrice}" readonly="readonly">
						    <span id="warn_buyPrice">영화 구매가격은 숫자 형식이어야 합니다</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>영화 대여가격(대여,구매대여시에만)</label>
						</div>
						<br>
						<div class="form_section_content">
							<input type="text" name="rentalPrice" id="rentalPrice" value="${movieInfo.rentalPrice}" readonly="readonly">
						    <span id="warn_rentalPrice">영화 대여가격은 숫자 형식이어야 합니다</span>
						</div>
					</div>
					<br>
					<div class="form_section">
						<div class="form_section_title">
							<label>개봉일</label>
						</div>
						<br>
						<div class="form_section_content">
						    <input type="text" name="movieDate" autocomplete="off" value="${movieInfo.movieDate}" readonly="readonly"/>
						    <span id="warn_movieDate">영화 개봉일을 선택해주세요</span>
						</div>
					</div>						
				</form>
				<form id="moveForm" method="get">
				    <input type="hidden" name="movieId" value='<c:out value="${movieInfo.movieId}"/>'>
				    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
				</form>
				<br>
				<div class="btn_Area">
					<button id="updateBtn">수정확정</button>
					<button id="deleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<footer>
	   <%@ include file="../includes/admin/footer.jsp"%>
	</footer>
	<script>
		ClassicEditor
			.create(document.querySelector('#movieContent_textarea'))
			.catch(error=>{
				console.error(error);
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
	                    rentalPriceInput.value = '0';
	                } else if (selectedValue === '2') {
	                    buyPriceInput.readOnly = true;
	                    rentalPriceInput.readOnly = false;
	                    buyPriceInput.value = '0';
	                } else if (selectedValue === '3') {
	                    buyPriceInput.readOnly = false;
	                    rentalPriceInput.readOnly = false;
	                } else {
	                    buyPriceInput.readOnly = true;
	                    rentalPriceInput.readOnly = true;
	                    buyPriceInput.value = '0';
	                    rentalPriceInput.value = '0';
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
		
		function selectCateRadioButton(value) {
		    var radioButtons = document.getElementsByName('cate1');
		    for (var i = 0; i < radioButtons.length; i++) {
		        if (radioButtons[i].value === value) {
		            radioButtons[i].checked = true;
		            break;
		        }
		    }
		}
		function selectPriceRadioButton(value) {
		    var radioButtons = document.getElementsByName('movieCheck');
		    for (var i = 0; i < radioButtons.length; i++) {
		        if (radioButtons[i].value === value) {
		            radioButtons[i].checked = true;
		            break;
		        }
		    }
		}

		// 페이지 로드시 실행되어야 할 코드
		window.onload = function() {
		    // 이전 페이지에서 넘어온 값 가져오기
		    var selectedCateValue = "${movieInfo.cate1}";
		    var selectedPriceValue = "${movieInfo.movieCheck}";

		    // 해당 값에 따라 라디오 버튼 선택
		    selectCateRadioButton(selectedCateValue);
		    selectPriceRadioButton(selectedPriceValue);
		};
		
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
		let moveForm = $("#moveForm");
		let m_Update = $("#m_Update");
		
		// 수정 버튼 클릭 시
		$("#updateBtn").on("click", function(e){
		    e.preventDefault();
		    m_Update.find("input[name='movieId']").remove(); // movieId input 제거
		    m_Update.append('<input type="hidden" name="movieId" value="${movieInfo.movieId}">'); // movieId input 재추가
		    
		    let titleCheck = false;
		    let contentCheck = false;
		    let urlCheck = false;
		    let cate1Check = false;
		    let cate2Check = false;
		    let checkCheck = false;
		    let buyCheck = false;
		    let rentalCheck = false;
		    let dateCheck = false;
		    
		    let movieTitle = $('input[name=movieTitle]').val();
		    let movieContent = $(".ct p").html();
		    let movieUrl = $('input[name=movieUrl]').val();
		    let cate2 = $('input[name=cate2]').val();
		    let buyPrice = $('input[name=buyPrice]').val();
		    let rentalPrice = $('input[name=rentalPrice]').val();
		    let movieDate = $('input[name=movieDate]').val();

		    let wMovieTitle = $('#warn_movieTitle');
		    let wMovieContent = $('#warn_movieContent');
		    let wMovieUrl = $('#warn_movieUrl');
		    let wCate1 = $('#warn_cate1');
		    let wCate2 = $('#warn_cate2');
		    let wMovieCheck = $('#warn_movieCheck');
		    let wBuyPrice = $('#warn_buyPrice');
		    let wRentalPrice = $('#warn_rentalPrice');
		    let wMovieDate = $('#warn_movieDate');
		    
		    if(movieTitle ===''){
		    	wMovieTitle.css('display', 'block');
		    	titleCheck = false;
		    } else{
		    	wMovieTitle.css('display', 'none');
		    	titleCheck = true;
		    }

		    if(movieContent != '<br data-cke-filler="true">'){
		    	
		    	wMovieContent.css('display', 'none');
		    	contentCheck = true;
		    	
		    } else{

		    	wMovieContent.css('display', 'block');
		    	contentCheck = false;
		    }
		    
		    if(movieUrl ===''){
		        wMovieUrl.css('display', 'block');
		        urlCheck = false;
		    } else{
		    	wMovieUrl.css('display', 'none');
		    	urlCheck = true;
		    }

		    
		    if(!document.querySelector('input[name="cate1"]:checked')){
		        wCate1.css('display', 'block');
		        cate1Check = false;
		    } else{
		    	wCate1.css('display', 'none');
		    	cate1Check = true;
		    }
		    
		    if(cate2 ===''){
		        wCate2.css('display', 'block');
		        cate2Check = false;
		    } else{
		    	wCate2.css('display', 'none');
		    	cate2Check = true;
		    }
		    
		    if(!document.querySelector('input[name="movieCheck"]:checked')){
		        wMovieCheck.css('display', 'block');
		        checkCheck = false;
		    } else{
		    	wMovieCheck.css('display', 'none');
		    	checkCheck = true;
		    }
		    
		    if(buyPrice === '' || isNaN(buyPrice)){
		        wBuyPrice.css('display', 'block');
		        buyCheck = false;
		    } else{
		    	wBuyPrice.css('display', 'none');
		    	buyCheck = true;
		    }
		    
		    if(rentalPrice === '' || isNaN(rentalPrice)){
		    	wRentalPrice.css('display', 'block');
		        rentalCheck = false;
		    } else{
		    	wRentalPrice.css('display', 'none');
		    	rentalCheck = true;
		    }
		    
		    if(movieDate ===''){
		        wMovieDate.css('display', 'block');
		        dateCheck = false;
		    } else{
		    	wMovieDate.css('display', 'none');
		    	dateCheck = true;
		    }
		    
		    if(titleCheck && contentCheck && urlCheck && cate1Check
		    		&& cate2Check && checkCheck && buyCheck
		    		&& rentalCheck && dateCheck){
		    	
		    	m_Update.submit(); // 폼 전송   
		        
		    } else{
		        return;
		    }
		    
		    
		});

		// 삭제 버튼 클릭 시
		$("#deleteBtn").on("click", function(e){
		    e.preventDefault();
		    moveForm.find("input[name='movieId']").remove(); // movieId input 제거
		    moveForm.append('<input type="hidden" name="movieId" value="${movieInfo.movieId}">'); // movieId input 재추가
		    moveForm.attr("action", "/admin/movieDelete"); // 액션 지정
		    moveForm.attr("method", "post"); // 메서드 지정
		    moveForm.submit(); // 폼 전송
		});
		
		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';
		
		if(delete_result == -1){
			alert("삭제 실패");
		}
		
		/* 수정 결과 경고창 */
		let update_result = '${update_result}';
		
		if(update_result == -1){
			alert("수정 실패");
		}
		
		
	</script>
</body>
</html>