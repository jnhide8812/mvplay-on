<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>구매 컨텐츠</h2>
	   <%-- <%@include file="../includes/header.jsp" %> --%>
            
                <div class="content_wrap">
                    <div class="content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">

                          <div class="form_section">
                             <div class="form_section_title">
                                <label>개별 구매</label>
                             </div>
                             <!--div poster도 넣어야됨...  -->
                             <div class="form_section_content">
                                <input type="hidden" name="movieTitle" value="<c:out value="${goodsInfo.movieTitle}"/>" >
                             </div>
                          </div>
                          <div class="form_section">     
                             <div class="form_section_content"><!--  개봉일? -->
                                <input type="hidden" value="<fmt:formatDate value='${goodsInfo.movieDate}' pattern='yyyy-MM-dd'/>" >
                             </div>
                          </div>                                                         
                          <div class="form_section">
                             <div class="form_section_content">
                                <input type="hidden "name="cate1" value="<c:out value="${goodsInfo.cate1}"/>" disabled>
                                 <input type="hidden" name="cate2" value="<c:out value="${goodsInfo.cate1}"/>" disabled>
                             </div>
                          </div>               
							<!-- 별점 -테이블에서 수정중임으로 추후 추가예정 -->
                         
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>소장</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="purcahse_movie" disabled>
                             </div>
                          </div>   
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>대여</label>
                             </div>
                             <div class="form_section_content">
                                <input type="hidden" id="rent_movie" disabled>
                             </div>
                          </div> 
                          
                          <h2>구매 방법</h2>             
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>책 소개</label>
                             </div>
                             <div class="form_section_content bit">
                                <textarea name="bookIntro" id="bookIntro_textarea" disabled>${goodsInfo.bookIntro}</textarea>
                             </div>
                          </div>              
                         <h2>결제방법</h2>
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>책 목차</label>
                             </div>
                             <div class="form_section_content bct">
                                <textarea name="bookContents" id="bookContents_textarea" disabled>${goodsInfo.bookContents}</textarea>
                             </div>
                          </div>
                         
                            <div class="btn_section">
                               <button id="purchaselBtn" class="btn">결제하기</button>
                          </div> 
                    </div>      

                   
                   <form id="moveForm" action="/결제 api로 이동?" method="get" >
                   <input type="hidden" name="pageNum" value="${cri.pageNum}">
                  <input type="hidden" name="amount" value="${cri.amount}">
                  <input type="hidden" name="keyword" value="${cri.keyword}">
                   </form>
                   
                </div>
                
            <%--  <%@include file="../includes/admin/footer.jsp" %> --%>
             
<script>
   
   $(document).ready(function(){
    	  let purchasePrice = 0; //소장 가격
    	  let rentPrice = 0; //대여 가격
    	  
    	  /* 값 삽입 */
    		$(".purchasePrice_span").text(purchasePrice.toLocaleString());
    		$(".rentPrice_span").text(rentPrice.toLocaleString());
     
    
 
      /* 목록 이동 버튼 */
      $("#cancelBtn").on("click", function(e){
         e.preventDefault();
         $("#moveForm").submit();   
      });   
      
      /* 수정 페이지 이동 */
      $("#modifyBtn").on("click", function(e){
         e.preventDefault();
         let addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">';
         $("#moveForm").append(addInput);
         $("#moveForm").attr("action", "/admin/goodsModify");
         $("#moveForm").submit();
      });
      
   });
</script>
	
	
</body>
</html>