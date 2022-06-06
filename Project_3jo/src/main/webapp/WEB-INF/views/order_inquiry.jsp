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
<title>주문상세</title>

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
			<input type="button" class="mypage_go_inquiry" name="mypage_go_inquiry " value="1:1 문의하러가기" onclick="location.href='qna/main'" 
			 style="cursor:pointer">
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
	
	<div class="info_modify">
		<span id="info_modify">주문상품 조회</span>
	</div>
	<div class="line"></div>
	
	<div class="order_info">
		<span id="order_info">상품정보</span>
	</div>
	<div class="order_info1"></div>
	
	<!-- 여기서부터 반복시작 -->
	<div class="product_box">
	<c:forEach var="row" items="${base_all}" varStatus="i">
	<div class="order_info_detail">
		<span id="order_info_detail">주문일자&nbsp;</span><span id="order_info_detail1">${row.order_id} &nbsp;&nbsp;&nbsp;</span>
		<span id="order_info_detail2">주문번호&nbsp;</span><span id="order_info_detail3">ORD ${row.r_boardnum}${row.order_id} &nbsp; ></span>
	</div>
	<div class="order_info_detail_line"></div>
	
	<div class="order_product_info">
		<div class="product_img">
			<span id="product_img"><img src="resources/img/${row.big_name}/${row.br_name}/${row.pd_img1}" class="product_img" alt="My Image"></span>
		</div>
		<div class="product_detail">
			<div class="brand_name">
				<span id="brand_name">${row.big_name}</span>
			</div>
			<div class="product_name">
				<span id="product_name">${row.pd_name}</span>
			</div>
			<div class="product_price_amount">
				<span id="product_price_amount">[ ${row.money}원 ] &nbsp; / &nbsp; ${row.amount}개</span>
			</div>
		</div>
		
		<div class="product_detail2">
			<div class="button_review">
				<input type="button" class="button_review1" id="button_review1" name="button_review1" value="리뷰쓰기" onClick="location.href='write?pd_id=${row.pd_id}&pd_name=${row.pd_name}'">
			</div>
			<div class="button_request">
				<a href="<c:url value="/qna/main"/>"><input type="button" class="button_requset1" id="button_requset1" name="button_requset1" value="1:1문의"></a>
			</div>
		</div>
		<div class="product_info_line"></div>
	</div>
	</c:forEach>
	</div>
	<!-- 여기까지 반복 -->
	<div class="line2"><br></div>
   
   <div class="img1-1">
      <img src="resources/recommendation/logo1.png" onclick="location.href='myPage'" style="cursor:pointer" class="img1-2">
   </div>
</section>

</body>
</html>