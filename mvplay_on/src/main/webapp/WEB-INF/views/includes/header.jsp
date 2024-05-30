<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="/resources/css/includes/header.css">
		<header>
			<div class="top_content">
				<form action="/movie/movieSearch" class="sc" method="get" id="movieSearch">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="keyword" class="main_search">
                	<input type ="button" class="search_icon">
                	<!-- <input type="hidden" name="pageNum"> -->
                </div>
                </form>
                <c:if test="${member == null}">     <!-- 로그인 X -->
					<div class="login_area">
						<ul class="l_area">
							<li class="lg"><a href="/member/login">로그인</a></li>
							<li class="join_button"><a href="/member/signUp">회원가입</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${member != null}">		<!-- 로그인 O -->
					<ul class="after_login">
					<c:if test="${member.ugrade == 0}">
					<!-- 관리자 계정 -->
						<li class="manager">
							<a href="/admin/main">관리자 페이지</a>
						</li>
					</c:if>
						<li>
							<button id="logout_button" class="lout">로그아웃</button>
						</li>
						<li>
							<button id="myinfo" class="move">My</button>
						</li>
					</ul>
				</c:if>
			</div>
		</header>
		<form id="moveForm" action="/member/myPage" method="get">
			<input type="hidden" name="userId" value="${cri.userId}">
		</form>
<script>

var moveForm = $("#moveForm");

/*로그아웃 버튼 적용 */
$("#logout_button").click(function() {
	//alert("버튼작동");
	$.ajax({
		type : "POST", 
		url : "/member/logout.do",
		success : function(data) {
			//alert("로그아웃 성공");
			document.location.reload();
		}
	}); //ajax 
});


/*마이페이지 이동*/
$("#myinfo").click(function(){
   
   location.href="/member/myPage"
   
});

let movieSearch = $('#movieSearch');

/* 영화 검색 버튼 동작 */
$("#movieSearch input[type='button']").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!movieSearch.find("input[name='keyword']").val()){
		alert("제목을 입력하십시오");
		return false;
	}
	
	//movieSearch.find("input[name='pageNum']").val("1");
	movieSearch.submit();
	
});


</script>