<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 구독 여부에 따라 버튼에 차이 두기 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>제목</div>
	<div>별점 넣는 란<input <c:out />></div>
	<ul>
		<li>별점을 리스트로?</li>
		<li>개봉일</li>
		<li>러닝타임</li>
		<li>장르</li>
	</ul>
	<div>
	<span></span>
	</div>
	<div>
		<button>구독하기</button>
		<button>구매하기</button>
	</div>
	
	<!-- 댓글 -->
	<div>
		<ul>
		<c:forEach items="${replyList}" var="replyList">
			<li>
				<p>
				<span></span>
				${replyList.userId}
				(<fmt:formatDate value="${replyList.regDate}" pattern="yyyy-MM-dd"/>)
				</p>
				
				<p>${replyList.content}</p>
				
				<p>                
				   <button type="button" class="replyUpdate btn btn-warning btn-xs" data-movieNum="${replyList.replyNum}">수정</button>
				   <button type="button" class="replyDelete btn btn-danger btn-xs" data-movieNum="${replyList.replyNum}">삭제</button>
				   
				   <script>
				    $(".replyUpdate").click(function(){
				     self.location = "/movie/replyUpdate?replyNum=${read.replyNum}"
				      + "&movieNum=" + $(this).attr("data-movieNum");          
				    });
				    
				    $(".replyDelete").click(function(){
				     self.location = "/movie/replyDelete?replyNum=${read.replyNum}"
				      + "&movieNum=" + $(this).attr("data-movieNum");   
				    });         
				   </script>
				</p>
				
			</li>
		</c:forEach>
		</ul>
		
		<section class="replyForm">
			<form role="form" method="post" autocomplete="off" class="form-horizontal">
			
				<input type="hidden" id="replyNum" name="replyNum" value="${read.replyNum}" readonly="readonly" />
				
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
				</div>
				 
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<textarea id="replyContent" name="replyContent" class="form-control"></textarea>
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
						 formObj.submit();
						});
					</script>
				</div>
			</form>
		</section>
	</div>
</div>
</body>
</html>