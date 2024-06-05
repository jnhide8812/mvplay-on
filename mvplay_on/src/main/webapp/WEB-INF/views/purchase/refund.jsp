<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="content_wrap">

		<h2>환불 신청</h2>
		<br>
		<div class="wrap">

			<!-- 영화 구매 정보 영역 -->
			<div class="purchase_table_area">
				<%@ include file="../includes/header.jsp"%>
				<%-- <%@include file="../includes/nav.jsp"%> --%>
				<form action="/purchase/refund" method="post" id="refundForm">

					<input type="hidden" name="id"
						value='<c:out value="${refundInfo.id}"/>'> <input
						type="hidden" name="refundPrice"
						value='<c:out value="${refundInfo.buyPrice}"/>'> <input
						type="hidden" name="userId"
						value='<c:out value="${refundInfo.userId}"/>'>

					<table class="table_purchase">

						<tr>
							<th>영화 제목</th>
							<td><c:out value="${refundInfo.movieTitle}" /></td>
						</tr>
						<tr>
							<th>구매일</th>
							<td><fmt:formatDate value="${refundInfo.startDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th>환불 금액</th>
							<td><c:out value="${refundInfo.buyPrice}" /></td>
						</tr>
						<tr>

						</tr>





					</table>
				</form>
				<button id="refundBtn">환불 신청</button>
			</div>
		</div>
		<!-- wrap -->

	</div>
	<!-- admin_content_wrap -->

	<footer>
		<%@ include file="../includes/footer.jsp"%>
	</footer>

<script>
$(document).ready(function() {
	alert("환불 페이지");

$("#refundBtn").on("click",function(){
	alert("환불신청이 완료되었습니다");
}
}


</script>
</body>
</html>