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
			<fieldset>
				<legend>이용권</legend>
				<nav class="ticket">
					<ul class="p_info">
						<li>
							<label>상세 정보</label>
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
							<button id="sub_btn" class="pbtn">이용권 변경></button>
						</li>
					</ul>
					<ul class="final_date">
						<li>
							<label>결제 예정일</label>
						</li>
						<li><input type="text" class="expired" name="expired" value="${subscribePayment.expiredDate}" readonly="readonly"></li>
					</ul>
				</nav>
			</fieldset>
			<fieldset>
				<legend>계정</legend>
				<ul class="p_info">
					<li>
						<label>이메일</label>
						<input type="text" name="memberemail" value="${member.userId}" readonly="readonly">
					</li>
					<li>
						<div class="pw_change">
							<button id="pw_btn" class="pbtn">비밀번호 변경></button>
						</div>
					</li>
				</ul>
			</fieldset>
			<div class="ask_button_wrap">
				<button id="boardBtn" class="abtn">문의하기</button>
			</div>
		</div> 
		<%@include file="../includes/footer.jsp" %>
	</div>
</div>

</body>
</html>