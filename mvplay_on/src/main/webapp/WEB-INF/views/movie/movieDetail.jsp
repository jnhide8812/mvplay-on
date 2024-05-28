<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVPlayer</title>
<link rel="stylesheet" href="../resources/css/movietest.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script>

</script>  
  
</head>
<body>
<div id = "container">
<input type="hidden" value="${movieInfo.movieId}" name="movieId">
	<!-- 헤더 -->
	<header>
	<%@include file="../includes/header.jsp" %>
	</header>
		<!-- 네비 (왼쪽 사이드 메뉴) -->
		<nav>
		<%@include file="../includes/nav.jsp" %>
		</nav>
		<!-- 메인 content -->
		<div class="main_content">
			<div class="">
				<div class="">
					<img alt="" src="${movieInfo.poster}">
					<div>
						<button id="likeBtn" class="btn like_btn">보고싶어요</button>
						<button id="ratingBtn" class="btn rating_btn">평가하기</button>
					</div>
				</div>
				
				<div>
					<div>
						<!-- 영화 제목 -->
						<h1><input type="text" id="movieTitle" name="movieTitle" value="${movieInfo.movieTitle}" disabled="disabled" /></h1>
					</div>
					<div> 
					<ul>
						<!-- 영화 평점 -->
						<li>
						<label>평균 </label>
						<c:out value="${movieInfo.rating}"></c:out>
						<label>점</label>
						<!-- 영화 개봉일 -->
						<fmt:formatDate value="${movieInfo.movieDate}" pattern="yyyy년"></fmt:formatDate>
						<!-- 영화 장르 -->
						<c:out value="${movieInfo.cate1}"></c:out>, <c:out value="${movieInfo.cate2}"></c:out>
						</li>
					</ul>
					</div>
					<div>
						<!-- 영화 줄거리 -->
						<input name="movieContent" value='<c:out value="${movieInfo.movieContent}"></c:out>' disabled="disabled" />
					</div>
					<div>
						<button id="subscribeBtn" class="btn">구독하기</button>
						<button id="buyBtn" class="btn buy_btn">구매하기</button>
					</div>
					
					
					<!-- 댓글 영역 -->
					<div class="reply_subject">
						<h2>리뷰</h2>
					</div>
					
					<c:if test="${member != null}">
						<div class="reply_button_wrap">
							<button>리뷰 쓰기</button>
							<!-- <button onclick="replyWrite()">리뷰 쓰기</button> -->
						</div>
					</c:if>		
					
					<div class="reply_not_div">
						
					</div>
						<ul class="reply_content_ul">
						</ul>
					
					<div class="repy_pageInfo_div"> 
						<ul class="pageMaker">
						</ul>
					</div>
					
					
			<!--<div id="reply">
				 <ol class="replyList">
				  <c:forEach items="${repList}" var="repList">
				   <li>
				    <p>
				    <span class="glyphicon glyphicon-user"></span>
				     ${repList.writer}
				     (<fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />)
				    </p>
				    
				    <p>${repList.content}</p>
				    
				    <p>                
					   <button type="button" class="replyUpdate btn btn-warning btn-xs" data-rno="${repList.replyNum}">수정</button>
					   <button type="button" class="replyDelete btn btn-danger btn-xs" data-rno="${repList.replyNum}">삭제</button>
					   
					   <script>					    
					    $(".replyDelete").click(function(){
					     self.location = "/movie/replyDelete?movieId=${read.movieId}"
					      + "&replyNum=" + $(this).attr("data-replyNum");   
					    });         
					   </script>
					</p>
				    
				  </li>
				 </c:forEach>     
				</ol>
				
				<section class="replyForm">
				<form role="form" method="post" autocomplete="off" class="form-horizontal">
			
				<input type="hidden" id="replyNum" name="replyNum" value="${repList.replyNum}" readonly="readonly" />
				
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
				</div>
				 
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<textarea id="content" name="replyContent" class="form-control"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="repSubmit btn btn-success">작성</button>
					</div>
					<script>
						var formObj = $(".replyForm form[role='form']");
						        
						$(".repSubmit").click(function(){
						 formObj.attr("action", "replyWrite");
						 //formObj.attr("action", "movieDetail");
						 formObj.submit();
						});
					</script>
				</div>
			</form>
		</section>
	</div> -->
		</div>
	</div>
		
		</div>
		<!-- 푸터 -->
		<%@include file="../includes/footer.jsp" %>
	</div>  <!-- id="container" -->
<script>
/* 리뷰쓰기 */
//온클릭 버전 (차후 불필요하게 될 시 삭제)
/*
 function replyWrite() {
	const userId = '${member.userId}';
	const movieId = '${movieInfo.movieId}';
		
	console.log("userId : "+${member.userId});
	console.log("movieId 2 : "+${movieInfo.movieId});
	
	let popUrl = "/movie/replyWrite/" + userId + "?movieId=" + movieId;
	console.log(popUrl);
	let popOption = "width = 490px, height=400px, top=300px, left=300px, scrollbars=yes";
	
	window.open(popUrl,"리뷰 쓰기",popOption);
}
*/

//버튼 눌러서 연결
$(".reply_button_wrap").on("click", function(e){
	
	e.preventDefault();
	
	const userId = '${member.userId}';
	const movieId = '${movieInfo.movieId}';
	
	console.log("userId : "+${member.userId});
	console.log("movieId 2 : "+${movieInfo.movieId});
	
/*
	$.ajax({
		data : {
			userId : userId,
			movieId : movieId
		},
		url : '/reply/check',
		type : 'POST',
		success : function(result){

			if(result === '1'){
				alert("이미 등록된 리뷰가 존재 합니다.")
			} else if(result === '0'){ */
				
				let popUrl = "/movie/replyWrite/" + userId + "?movieId=" + movieId;
				console.log(popUrl);
				let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"리뷰 쓰기",popOption);					
			/*}				
			
		}
	});	*/		

	
});


/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
let replyListInit = function(){
	$.getJSON("/reply/list", cri , function(obj){
		
		makeReplyContent(obj);
		
	});		
}	

/* 리뷰 수정 버튼 */
$(document).on('click', '.update_reply_btn', function(e){
		
		e.preventDefault();
		let replyNum = $(this).attr("href");		 
		let popUrl = "/replyUpdate?replyNum=" + replyNum + "&movieId=" + '${movieInfo.movieId}' + "&userId=" + '${member.userId}';	
		let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
		
		window.open(popUrl,"리뷰 수정",popOption);			
	 
});	

/* 리뷰 삭제 버튼 */
$(document).on('click', '.delete_reply_btn', function(e){

	e.preventDefault();
	let replyNum = $(this).attr("href");	
	
	$.ajax({
		data : {
			replyNum : replyNum,
			movieId : '${movieInfo.movieId}'
		},
		url : '/reply/delete',
		type : 'POST',
		success : function(result){
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
});	

/* 댓글(리뷰) 동적 생성 메서드 */
function makeReplyContent(obj){
	
	if(obj.list.length === 0){
		$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
		$(".reply_content_ul").html('');
		$(".pageMaker").html('');
	} else{
		
		$(".reply_not_div").html('');
		
		const list = obj.list;
		const pf = obj.pageInfo;
		const userId = '${member.userId}';		
		
		/* list */
		
		let reply_list = '';			
		
		$(list).each(function(i,obj){
			reply_list += '<li>';
			reply_list += '<div class="comment_wrap">';
			reply_list += '<div class="reply_top">';
			/* 아이디 */
			reply_list += '<span class="id_span">'+ obj.movieId+'</span>';
			/* 날짜 */
			reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
			/* 평점 */
			reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
			if(obj.movieId === userId){
				reply_list += '<a class="update_reply_btn" href="'+ obj.replyNum +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyNum +'">삭제</a>';
			}
			reply_list += '</div>'; //<div class="reply_top">
			reply_list += '<div class="reply_bottom">';
			reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
			reply_list += '</div>';//<div class="reply_bottom">
			reply_list += '</div>';//<div class="comment_wrap">
			reply_list += '</li>';
		});		
		
		$(".reply_content_ul").html(reply_list);				
	}
}
</script>
</body>
</html>