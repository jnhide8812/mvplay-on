<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<link rel="stylesheet" href="/resources/css/basic/style.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="container">
	<div class="my">
		<%@include file="../includes/header.jsp" %>
		<%@include file="../includes/nav.jsp" %>
		<div class="my_wrap">
			<div class="sub">
				<h1>마이 페이지</h1>
			</div>
			<div class="inf_wrap">
				<fieldset class="buy">
					<legend><span class="mtit">이용권</span></legend>
					<nav class="mine">
						<ul class="p_info">
							<li>
								<label><span class="sub_tt">상세 정보</span></label>
							</li>
							<li>
								<div class="receipt">
									<c:if test="${member.ugrade == '1'}">
										<div class="ugrade">
											<span class="sub_type">구독권 없음</span>
										</div>
									</c:if>
									<c:if test="${member.ugrade == '2'}">
										<div class="ugrade">
											<span class="sub_type">베이직</span>
											<span class="hd">Full HD</span>
										</div>
									</c:if>
									<c:if test="${member.ugrade == '3'}">
										<div class="ugrade">
											<span class="sub_type">프리미엄</span>
											<span class="hd">Ultra HD 4K</span>
										</div>
									</c:if>
								</div>
							</li>
							<li>
								<button type="button" onclick="location.href='/purchase/subscribe1'" class="pbtn">이용권 변경 ></button>
							</li>
						</ul>
						<ul class="final_date">
							<li>
								<label><span class="sub_tt">결제 예정일</span></label>
							</li>
							<li><input type="text" class="expired" name="expired" value="${subscribePayment.expiredDate}" readonly="readonly"></li>
						</ul>
					</nav>
				</fieldset>
				<fieldset class="own">
					<legend><span class="mtit">계정</span></legend>
					<nav class="mine">
						<ul class="p_info">
							<li class="mm">
								<label><span class="sub_tt">이메일</span></label>
								<input type="text" name="memberemail" value="${member.userId}" readonly="readonly" class="mail">
							</li>
							<li>
								<div class="pw_change">
									<button id="pw_btn" class="pbtn">비밀번호 변경 ></button>
								</div>
							</li>
						</ul>
					</nav>
				</fieldset>
			</div>
			<div class="ask_button_wrap">
				<a href="/board/ownList" class="ask_btn">문의하기</a>
			</div>
		</div> 
		<%@include file="../includes/footer.jsp" %>
	</div>
</div>

</body>
</html>