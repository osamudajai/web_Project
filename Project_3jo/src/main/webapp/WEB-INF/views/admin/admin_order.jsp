<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/order_inquiry.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<link rel="stylesheet" href="../resources/main_style/main_style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
 <link rel="stylesheet" href="../resources/css/order_inquiry.css">
<title>관리자 주문 확인 페이지</title>
</head>
<script>
$(document).ready(function() {
   document.getElementById('type').value = ${type};
});
</script>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
   var form = document.getElementById('pagingForm');
   var page = document.getElementById('page');
   page.value = currentPage;
   form.submit();
}
</script>
<body>
<div class="header_container sticky-header">
	<div class="container-fluid">
	<div class="row align-items-center">
	    <jsp:include page="../header/header.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
	</div>
	</div>
	</div>

<div class="order_info1"></div>

<c:forEach var="row" items="${base_all}" varStatus="i">
	<div class="order_info_detail">
		<span id="order_info_detail">주문일자&nbsp;</span><span id="order_info_detail1">${row.order_id} &nbsp;&nbsp;&nbsp;</span>
		<span id="order_info_detail2">주문번호&nbsp;</span><span id="order_info_detail3">ORD ${row.r_boardnum}${row.order_id}******* &nbsp; ></span>
	</div>
	<div class="order_info_detail_line"></div>
	
	<div class="order_product_info">
		<div class="product_detail">
			<div class="brand_name">
				<span id="brand_name">${row.big_name}</span>
			</div>
			<div class="product_name">
				<span id="product_name">${row.pd_name}</span>
				
			</div>
			<span id="product_name">${row.po_id}</span>
			<div class="product_price_amount">
				<span id="product_price_amount">[ ${row.money}원 ] &nbsp; / &nbsp; ${row.amount}개</span>
			</div>
		</div>
				<div class="product_info_line"></div>
	</div>
	</c:forEach>
	
	<div id="navigator" align="center">                  
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp; 
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
	</div>
<!-- /페이지 이동 끝 -->                      
		
	<form id="pagingForm" method="get" action="admin_order">		
			<input type="hidden" name="page" id="page" onclick="pagingFormSubmit(1)"/>
	</form>
	
	<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>
	
</body>
</html>