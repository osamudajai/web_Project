<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/order_inquiry.css">
<link rel="stylesheet" href="resources/css/board.css">
<title>나의 리뷰</title>
<script src="resources/jq/jquery-3.6.0.min.js"></script>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	
	form.submit();
}
function openCloseAnswer(id) {

    const answerId = id.replace('que', 'ans');
    const imgId = id.replace('que', 'img');	
    
    if(document.getElementById(answerId).style.display === 'block') {
    	document.getElementById(answerId).style.display = 'none';
    } else {
    	document.getElementById(answerId).style.display = 'block';
    }
   	
    if($('#' + imgId).attr('src') == "resources/image/down_arrow.png") {
    	$('#' + imgId).attr('src', "resources/image/up_arrow.png");
    } else {
    	$('#' + imgId).attr('src', "resources/image/down_arrow.png");
    }
   	
}

</script>

</head>
<body>
<div class="header_container sticky-header">
	<div class="container-fluid">
	<div class="row align-items-center">
	    <jsp:include page="header/header.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
	</div>
	</div>
	</div>

<section>
    <div class="marking">
        <span class="mark">MY PAGE</span>
    </div>
</section>    

<section>
	<div class="mypage_info">
		<span class="mypage_name" id="mypage_name" onclick="location.href='myPage'" style="cursor:pointer">${po_id}</span><br><br>
		<span class="mypage_herat">나의 하트</span><br><br><!-- 찜 기능 뺄 경우 장바구니로 대체  -->
		<span class="mypage_title" id="mypage_title_product">나의 쇼핑정보</span><br>
		<span class="mypage_content" id="product_check" onclick="location.href='order_inquiry'" style="cursor:pointer">주문한 상품 조회</span><br>
		<span class="mypage_content" id="product_review" onclick="location.href='myReview'" style="cursor:pointer">나의 리뷰</span><br><br>
		<span class="mypage_title" id="mypage_title_account">나의 계정설정</span><br>
		<span class="mypage_content" id="account_edit" onclick="location.href='update'" style="cursor:pointer">회원 정보수정</span><br>
		<span class="mypage_content" id="my_mileage" onclick="location.href='point'" style="cursor:pointer">마일리지 현황</span><br><br>
		<span class="mypage_title" id="mypage_title_customer">고객센터</span><br>
		<span class="mypage_content" id="my_inquiry" onclick="location.href='qna/main'" style="cursor:pointer">1:1 문의내역</span><br>
		<span class="mypage_content" id="notice" onclick="location.href='notice/main'" style="cursor:pointer">공지사항</span><br>
		<span class="mypage_content" id="faq" onclick="location.href='faq/main'" style="cursor:pointer">FAQ</span><br><br>	
		
		<div>
			<input type="button" class="mypage_go_inquiry" name="mypage_go_inquiry " onclick="location.href='qna/main'" style="cursor:pointer" value="1:1 문의하러가기">		
	</div>
	</div>
</section>

<section class="main">
		<div class="my_info">
      <div class="my_recommend">
         <div class="recommend">#CHARMANT &nbsp;
            <div class="recommendation_perfume"><span id="recommendation_perfume1">${po_id}</span>
            <div class="recommendation_perfume2"><span id="recommendation_perfume2" onclick="location.href='perfume_teller'" style="cursor:pointer">
            향수 추천받으러 가기</span></div></div>
         </div>         
      </div>
      <div class="my_mileage">
         <div class="my_mileage1" onclick="location.href='point'" style="cursor:pointer">마일리지 &nbsp;></div>
         <div class="my_mileage2"><img src="resources/recommendation/find5.png" class="img1"></div>
      </div>
   </div>
		
	<!-- <div class="order_info_detail_line"></div> 회색 선-->
	
	
	<!-- 구매후기 목록 -->
	<table class="tblist">
	    <colgroup>
	        <col width="20%" />
        	<col width="60%" />
        	<col width="20%" />
	    </colgroup>
		<tr class="thtd deletebl" style="border-bottom: 1.5px #212529 solid;">
			<td class="thtd deletebl">작성일</td>
            <td class="thtd">제목</td>
            <td class="thtd">구매한 상품</td>
	   	</tr>
	   	<c:forEach var="review" items="${reviewlist}">
		   	<tr class="thtd deletebl">
		   		<td class="thtd deletebl">${review.rv_date}</td>
		   		<td class="thtd">
		   			<div class="container" id="que-${review.rv_num}" onclick="openCloseAnswer(this.id)">
						<div class="deletebl question left-items"><span>&nbsp;${review.rv_title}</span>
						<c:if test="${review.rv_originalfile != null}">
						<img src="resources/image/img_yes.png" style="width:20px; height:20px;">
						</c:if>
						</div>
						<div><img id="img-${review.rv_num}" src="resources/image/down_arrow.png"
						style="width: 30px; height: 30px;" class="cur-po"></div>
		            </div>
					<div class="deletebl answer" id="ans-${review.rv_num}">
					<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${review.rv_content}<br>
					<c:if test="${review.rv_originalfile != null}">
						<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="showfile?rv_num=${review.rv_num}" style="width:10%; height:10%;">
					</c:if>
					<br><br></div>
				</td>
				<td class="thtd">${review.pd_name}</td>
		    </tr>
		</c:forEach>	    
	</table>
	
	<div class="product_info_line"></div>
	<div class="order_info1"></div><br><br>
	
	<form id="pagingForm" method="get" action="myReview">
	<input type="hidden" name="page" id="page" />
 	</form>
    
    <div id="navigator">
	<!-- 페이지 이동 부분 -->                      
		<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"><img src="resources/image/page_pprev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})"><img src="resources/image/page_prev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"></c:if>
				<a style="color: #212529;" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></c:if>
		</c:forEach>
		&nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})"><img src="resources/image/page_next.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"><img src="resources/image/page_nnext.png" style="width:20px; height:20px;"></a>
	</div>	
	<!-- /페이지 이동 끝 --><br><br>
	
</section>
<script src="resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="resources/main_js/main_js.js"></script>


</body>
</html>