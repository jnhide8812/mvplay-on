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
			<div class="posterFrame">
				<div class="poster">
					<!-- <img src="/resources/img/${movieInfo.poster}" width="300px"> -->
					<img class="moviePoster" alt="임시 포스터 입니당" src="/resources/img/듄.png" width="300px">	
				</div>
				
				<div class="textArea_movieInfo">
					<div class="inlineBlock">
						<!-- 영화 제목 -->
						<h1 class="movieTitle">${movieInfo.movieTitle}</h1>
					</div>
					<div> 
						<ul>
							<!-- 영화 평점 -->
							<li class="lavel">
							<label>평균 <c:out value="${movieInfo.rating}"></c:out>점</label>
							</li>
							<!-- 영화 개봉일 -->
							<li class="lavel">
							<fmt:formatDate value="${movieInfo.movieDate}" pattern="yyyy년"></fmt:formatDate>
							</li>
							<!-- 영화 장르 -->
							<li class="lavel">
							<c:out value="${movieInfo.cate1}"></c:out>, <c:out value="${movieInfo.cate2}"></c:out>
							</li>
						</ul>
					</div>
						<div class="inlineBlock">
							<!-- 영화 줄거리 -->
							<div class="movieContent">
							${movieInfo.movieContent}
							</div>
						</div>
					<div class="buttons">
						<div class="inlineBlock">
							<button id="subscribeBtn" class="btn" onclick="location.href='../purchase/vod?movieId=${movieInfo.movieId}'">구독하기</button>
							<button id="buyBtn" class="btn_buy_btn" onclick="location.href='../purchase/subscribe${member.ugrade}?movieId=${movieInfo.movieId}'">구매하기</button>
							<c:if test="${member.ugrade == 0}">
							<p>관리자 전용 각 단계 이동 버튼</p>
							<button id="buyBtn_1" class="btn_buy_btn" onclick="location.href='../purchase/subscribe1?movieId=${movieInfo.movieId}'">구매하기(일반회원)</button>
							<button id="buyBtn_2" class="btn_buy_btn" onclick="location.href='../purchase/subscribe2?movieId=${movieInfo.movieId}'">구매하기(베이직)</button>
							<button id="buyBtn_3" class="btn_buy_btn" onclick="location.href='../purchase/subscribe3?movieId=${movieInfo.movieId}'">구매하기(프리미엄)</button>
							</c:if>
						</div>
					</div>
					<div class="buttons">
						<%@include file="rating.jsp" %>
						<button id="likeBtn" class="btn_like_btn">보고싶어요</button>
					<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/4xnsmyI5KMQ?si=_oi5Mhmnp7wnfJeB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe> -->
					</div>					
				</div>
			</div>	
					<!-- 댓글 영역 -->
				<div class="replyArea">	
					<div class="reply_subject">
						<h2>리뷰</h2>
					</div>
					
					<c:if test="${member != null}">
						<div class="reply_button_wrap">
							<button>리뷰 쓰기</button>
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
				let popOption = "width = 490px, height=360px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"리뷰 쓰기",popOption);					
			/*}				
			
		}
	});	*/		

	
});


//리뷰 리스트
const movieId = '${movieInfo.movieId}';	
	$.getJSON("/movie/list", {movieId : movieId}, function(obj){
		
		makeReplyContent(obj);
		
	});

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
		url : '/movie/delete',
		type : 'POST',
		success : function(result){
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
});	

/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
let replyListInit = function(){
	$.getJSON("/movie/list", cri , function(obj){
		
		makeReplyContent(obj);
		
	});		
}	

/* 댓글(리뷰) 동적 생성 메서드 */
function makeReplyContent(obj){
		if(obj.list.length === 0){
			$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
			$(".reply_content_ul").html('');
		} else {
			$(".reply_not_div").html('');
			
			const list = obj.list;
			const pf = obj.pageInfo;
			const userId = '${member.userId}';
			
			console.log("댓글 정보들 : "+obj.regDate);
			
			/* list */
			
			let reply_list = '';			
			
			$(list).each(function(i,obj){
				reply_list += '<li>';
				reply_list += '<div class="comment_wrap">';
				reply_list += '<div class="reply_top">';
				/* 아이디 */
				reply_list += '<span class="id_span">'+ obj.userId+'</span>';
				/* 날짜 */
				reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
				/* 평점 */
				reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
				if(obj.movieId === userId){
					reply_list += '<a class="update_reply_btn" href="'+ obj.replyNum +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyNum +'">삭제</a>';
				}
				reply_list += '</div>'; //<div class="reply_top">
				reply_list += '<div class="reply_bottom">';
				reply_list += '<div class="reply_bottom_txt">'+ obj.replyContent +'</div>';
				reply_list += '</div>';//<div class="reply_bottom">
				reply_list += '</div>';//<div class="comment_wrap">
				reply_list += '</li>';
				console.log("댓글 정보들 : "+obj.regDate);
				console.log("댓글 번호들 : "+obj.replyNum);
			});
			
			$(".reply_content_ul").html(reply_list);
		}
}

/*보고 싶어요
$(".btn_like_btn").on('click', function(e){
	
	e.preventDefault();
	
	const userId = '${member.userId}';
	const movieId = '${movieInfo.movieId}';
	
	console.log("userId for like : "+${member.userId});
	console.log("movieId  for like : "+${movieInfo.movieId});
	
	if(userId === ""){
		alert("로그인 후 이용하실 수 있습니다.");
	}	
});

//구매
$(".btn_buy_btn").on('click', function(e){
	
	e.preventDefault();
	
	const userId = '${member.userId}';
	const movieId = '${movieInfo.movieId}';
	
	console.log("userId for buy : "+${member.userId});
	console.log("movieId for buy : "+${movieInfo.movieId});
	
	if(userId === ""){
		alert("로그인 후 이용하실 수 있습니다.");
	} else {
		$.ajax({
			data : {
				userId : userId,
				movieId : movieId
			},
			url : '/purchase/vod',
			type : 'POST',
			success : function(result){
				if(result === '1'){
				alert("이미 등록된 리뷰가 존재 합니다.")
				} else if(result === '0'){ 
						
				let popUrl = "/movie/replyWrite/" + userId + "?movieId=" + movieId;
				console.log(popUrl);
				let popOption = "width = 490px, height=360px, top=300px, left=300px, scrollbars=yes";
							
				window.open(popUrl,"리뷰 쓰기",popOption);					
					}				
					
				}
			});
		}
	
});

//구독
$(".btn").on('click', function(e){
	e.preventDefault();
	
	const userId = '${member.userId}';
	const movieId = '${movieInfo.movieId}';
	
	console.log("userId for subscribe : "+${member.userId});
	console.log("movieId for subscribe : "+${movieInfo.movieId});
	
	if(userId === ""){
		alert("로그인 후 이용하실 수 있습니다.");
	}
	
});

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
			} else if(result === '0'){ 
				
				let popUrl = "/movie/replyWrite/" + userId + "?movieId=" + movieId;
				console.log(popUrl);
				let popOption = "width = 490px, height=360px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"리뷰 쓰기",popOption);					
			/*}				
			
		}
	});		

	
});
*/
</script>
</body>
</html>