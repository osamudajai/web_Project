<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
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
<link rel="stylesheet" href="resources/css/point.css">
<title>포인트 페이지</title>
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

	<div class="mileage_status">
		<span id="mileage_status">마일리지 현황</span>
	</div>
	<div class="line"></div>
	
	<div class="mileage_info">
		<div class=mileage_info_box>
			<div class="mileage_info1"><span id="mileage_info">현재 마일리지</span></div>
			<div class="mileage_info1"><span id="mileage_info">--</span></div>
			<div class="mileage_info1"><span id="mileage_info">사용 누적 마일리지</span></div>
		</div>
		<div class=mileage_info_box1>
			<div class="mileage_info2"><span id="mileage_info">${member_po1.rmpoint} point</span></div>
			<div class="mileage_info2"><span id="mileage_info">--</span></div>
			<div class="mileage_info2"><span id="mileage_info">${member_po2.all_use} point</span></div>
		</div>
		
		<div class="mileage-rule"><li>마일리지는 부여된 해로부터 3년 이내에 사용하셔야 합니다.</li></div>
	</div>
	
	<div class="mileage_spending_status">
		<span id="mileage_spending_status">마일리지 사용</span>
	</div>
	<div class="mileage_rule2"><li>마일리지는 사용하신 내역입니다.</li></div>
	<div class="line"></div>
	
	<div class="mileage_spending">
		<div class=mileage_spending_box>
			<div class="mileage_spending_info1"><span id="mileage_spending_info">적용일자</span></div>
			<div class="mileage_spending_info1"><span id="mileage_spending_info">적용내용</span></div>
			<div class="mileage_spending_info1"><span id="mileage_spending_info">사용 마일리지</span></div>
			<div class="mileage_spending_info1"><span id="mileage_spending_info">관련주문번호</span></div>
		</div>
		
		<!-- 반복시작 -->
		<c:forEach var="point" items="${member_po}" varStatus="i">
		<div class=mileage_spending_box1>
			<div class="mileage_spending_info2"><span id="mileage_spending_info">${point.usedate}</span></div>
			<div class="mileage_spending_info2"><span id="mileage_spending_info">주문사용</span></div>
			<div class="mileage_spending_info2"><span id="mileage_spending_info">${point.usepoint}</span></div>
			<div class="mileage_spending_info2"><span id="mileage_spending_info">ORD ********</span></div>
		</div>
		</c:forEach>
		<!-- 반복 끝 -->
		
	</div>
	
	<div class="mileage_rule3_box">
		<span class="mileage_rule3">마일리지 사용기준 및 사용기한</span>
		<div class= "mileage_rule3_detail_box">
			<div class="mileage_rule3_detail1"><li>마일리지는 구매금액 제한없이 현금처럼 사용하실 수 있습니다.</li></div>
			<div class="mileage_rule3_detail2"><li>마일리지는 부여된 해로부터 3년 이내에 사용하셔야 합니다.</li></div>
			<div class="mileage_rule3_detail3"><li>추가문의 사항은 1:1 문의를 통해 질문해주시기 바랍니다.</li></div>
		</div>
	</div>

</section>

</body>
</html>