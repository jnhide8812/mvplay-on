<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/basic/style.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type="text/css">
  	/* 창 여분 없애기 */
  	body{
  		margin : 0;
  		padding: 0;
  	}
  	.rp_wrapper {
  		width: 490px;
  		height: 359px;
  		background-color: #000000;
  		margin: 0 auto;
  		overflow: hidden;
  	}
  	/* 전체 배경화면 색상 */
  	.wrapper_div{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;	
  	}
 	/* 팝업창 제목 */
  	.subject_div{
	    width: 100%;
	    background-color: #7b8ed1;
	    color: white;
	    padding: 10px;
	    font-weight: bold;
	    font-size: 16px;
  	}
  	
  	/* 컨텐츠, 버튼 영역 padding */
  	.content_div {
  		padding-top: 20px
  	}
  	.input_wrap{
  		padding: 30px;
  	}
  	.btn_wrap{
  		padding: 5px 30px 30px 30px;
  		text-align: center;
  		display:flex;
  		flex-direction: row;
  		justify-content: cener;
  		align-items: center;
  	}

  	/* 버튼 영역 */
  	.btn_wrap a {
		cursor: pointer;	
		font-size: 16px;
  		font-weight: 500;
  		line-height: 20px;
  		padding: 6px 40px;
  		margin: 0 6px;
  	}
  	.cancel_btn{
  	    display: inline-block;
	    background-color: #5A5A5E;
	    padding-top: 10px;
	    color: #EBEBEB;
	    border-radius: 40px;
  	}
  	.enroll_btn{
   	    display: inline-block;
	    background-color: #f82f62;
	    color: #fff;
	    font-size: 15px; 
	    border-radius: 40px;
	    	
  	}

	/* 책제목 영역 */
	.bookName_div h2{
		margin : 0;
	}
  	/* 평점 영역 */
  	.rating_div{
  		padding-top: 10px;
  	}
  	.rating_div h4{
  		margin : 0;
  	}
  	/*select{
  	margin: 15px;
    width: 100px;
    height: 40px;
    text-align: center;
    font-size: 16px;
    font-weight: 600;  	
  	}*/
  	/* 리뷰 작성 영역 */
  	textarea{
		width: 460px;
	    height: 100px;
	    border: 1px solid #dadada;
	    padding: 12px 8px 12px 8px;
	    font-size: 15px;
	    color: #84868D;
	    resize: none;
	    margin-top: 10px;  	
  	}
  	
  
</style>
</head>
<body>
<div class="rp_wrapper">
	<input type="hidden" value="${movieInfo.movieId}" name="movieId">
	
	<div class="wrapper_div">
			<div class="subject_div">
				리뷰 쓰기
			</div>
			<div class="input_wrap">
				
				<!-- <div class="rating_div">
					<h4>평점</h4>
					<select name="rating">
						<option value="0.5">0.5</option>
						<option value="1.0">1.0</option>
						<option value="1.5">1.5</option>
						<option value="2.0">2.0</option>
						<option value="2.5">2.5</option>
						<option value="3.0">3.0</option>
						<option value="3.5">3.5</option>
						<option value="4.0">4.0</option>
					</select>
				</div>-->
				<div class="content_div">
					<textarea name="replyContent"></textarea>
				</div>
			</div>
			
			<div class="btn_wrap">
				<a class="enroll_btn">등록</a>		
				<a class="cancel_btn">취소</a>
			</div>
		
	</div>
</div> <!-- rp_wrapper -->
	
	<script>
	$(document).ready(function(){
		console.log(${movieInfo.movieId});
	});
	
	/* 취소 버튼 */
	$(".cancel_btn").on("click", function(e){
		window.close();
	});	
	
	/* 등록 버튼 */ 
	$(".enroll_btn").on("click", function(e){
		const movieId = '${movieId}';
		const userId = '${member.userId}';
		//const rating = $("select").val();
		const replyContent = $("textarea").val();
		const data = {
				movieId : movieId,
				userId : userId,
				//rating : rating,
				replyContent : replyContent
		}
		console.log("movieId 2 : "+ movieId);
		$.ajax({
			data : data,
			type : 'POST',
			url : '/movie/replyWrite',
			success : function(result){
				
				/* 댓글 초기화 */
				$(opener.location).attr("href", "javascript:replyListInit();");
				
				window.close();
			}
			
		});
		
	});
	
	</script>
	
</body>
</html>