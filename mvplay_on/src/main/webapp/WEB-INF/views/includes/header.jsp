<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="resources/css/includes/header.css">
		<header>
			<div class="top_content">
				<form action="searchc.do" class="sc">
				<div class="search">
                	<input type="text" placeholder="작품명을 입력해주세요" name="searchText" class="main_search">
                	<input type ="button" onclick="location.href='search.do'" class="search_icon">
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
$("#myinfo").on("click",function(e){
	e.preventDefault();
	$("#moveForm").submit();
});
</script>