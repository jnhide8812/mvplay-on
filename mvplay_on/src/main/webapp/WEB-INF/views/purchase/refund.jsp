<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>환불 정보 보기</title>

</head>
<body>
	<div id="container">

		<h2>환불 신청</h2>
		<br>
		<div class="wrap">

			<!-- 영화 구매 정보 영역 -->
			<div class="purchase_table_area">
				<%@ include file="../includes/header.jsp"%>
				<%--  <%@include file="../includes/nav.jsp"%>  --%>
				<form action="/purchase/refund" method="post" id="refundForm">
					    <input type="hidden" name="id" value='<c:out value="${refundInfo.id}"/>'> 
						<input type="hidden" name="movieId" value='<c:out value="${refundInfo.movieId}"/>'> 
						<input type="hidden" name="userId" value='<c:out value="${refundInfo.userId}"/>'>

					<table class="table_purchase">

						<tr>
							<th>영화 제목 : </th>
							<td><c:out value="${refundInfo.movieTitle}" /></td>
						</tr>
						<tr>
							<th>구매일 : </th>
							<td><fmt:formatDate value="${refundInfo.startDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th>환불 예정 금액 : </th>
							<td><c:out value="${refundInfo.buyPrice}" /></td>
						</tr>
					</table>
				</form>
				<button id="refundBtn">환불신청</button>
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
    $("#refundBtn").on("click", function() {
        // 환불 요청 버튼 클릭 시, form submit
        $("#refundForm").submit();
        alert("환불신청이 완료되었습니다");
    });
});
</script>
</body>
</html>
