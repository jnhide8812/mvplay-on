<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="../resources/css/member/myPage.css">
</head>
<body>
<div id="container">
	<%@include file="../includes/header.jsp" %>
	<div class="my_wrap">
		<fieldset>
			<legend>이용권</legend>
			<ul class="p_info">
				<li>
					<label>상세 정보</label>
				</li>
				<li>
					<div class="receipt">
						<c:if test="${member.ugrade == '1'}">
							<div class="ugrade">
								구독권 없음
							</div>
						</c:if>
						<c:if test="${member.ugrade == '2'}">
							<div class="ugrade">
								베이직
							</div>
						</c:if>
						<c:if test="${member.ugrade == '3'}">
							<div class="ugrade">
								프리미엄
							</div>
						</c:if>
					</div>
				</li>
				<li><a href="sub_button">이용권 구매 ></a></li>
			</ul>
			<ul class="final_date">
				<li>
					<label>결제 예정일</label>
				</li>
				<li><input type="text" class="expired" name="expired" value="${subscribePayment.expiredDate}" readonly="readonly"></li>
			</ul>
		</fieldset>
		<fieldset>
			<legend>계정</legend>
			<ul>
				<li>
					<label>이메일</label>
					<input type="text" name="memberemail" value="${member.userId}" readonly="readonly">
				</li>
				<li>
					<div class="pw_change">
						<a href="/member/findPass">비밀번호 변경></a>
					</div>
				</li>
			</ul>
		</fieldset>
		<div class="ask_button_wrap">
			<div class="ask_button">
				<a href="#">문의하기</a>
			</div>
		</div>
	</div> 
	<%@include file="../includes/footer.jsp" %>
</div>
</body>
</html>