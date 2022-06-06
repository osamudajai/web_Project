<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="resources/css/myPage.css">
<title>마이 페이지</title>

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
        <span class="mark" style="background-color: white;" onclick="location.href='myPage'">MY PAGE</span>
    </div>
</section>    

<section>
   <div class="mypage_info">
      <br><br><br>
      <%-- <span class="mypage_name" id="mypage_name" onclick="location.href='myPage'" style="cursor:pointer">${po_id}</span><br><br> --%>
      <!-- <span class="mypage_herat">나의 하트</span><br><br>찜 기능 뺄 경우 장바구니로 대체  -->
      <span class="mypage_title" id="mypage_title_product">나의 쇼핑정보</span><br>
      <span class="mypage_content" id="product_check" onclick="location.href='order_inquiry'" style="cursor:pointer">주문한 상품 조회</span><br>
      <span class="mypage_content" id="product_review" onclick="location.href='myReview'">나의 리뷰</span><br><br>
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
      
</section>

<section class="section1">
        <div class="confirm_info_box">
            <div class="confirm_info">
                <span id="info1">최근주문</span><span id="info2" onclick="location.href='order_inquiry'" style="cursor:pointer">더 보기 &nbsp;></span>
                <div class="info_box_line">
                    <div class="confirm_info_sort">
                        <div id="sort1">주문일</div>
                        <div id="sort2">주문내역</div>
                        <div id="sort3">주문번호</div>
                        <div id="sort4">결제금액</div>
                    </div>
                    
                    <!-- 여기서부터 반복시작 -->
                    <c:forEach var="row" items="${base}" varStatus="i">
                    <div class="confirm_info_sort0">
                    
                    <div>
                    <div class="confirm_info_sort1">
                        <div id="sort1-1">
                            ${row.order_id}
                        </div>
                        <div id="sort2-1">
                            <img src="resources/img/${row.big_name}/${row.br_name}/${row.pd_img1}" id="sort_product_img" alt="My Image">
                            <div id="sort_name">${row.pd_name}&nbsp;<span id="sort_name_option"></span></div>
                        </div>
                        <div id="sort3-1">
                            <div id="sort_ordnum"><span id="ordnum">ORD ${row.r_boardnum}**********</span></div>
                        </div>
                        <div id="sort4-1">
                            <div id="sort_price"><span id="sort_price"><fmt:formatNumber value="${row.money}" pattern="###,###"/>원</span></div>
                            <%-- <fmt:formatNumber value="${row.money}" pattern="###,###"/> --%>
                        </div>
                    </div>
                    </div>
                    
                    </div>
                    </c:forEach>
                    <!-- 여기까지 반복 -->
                    
                </div>
            </div>
        </div>

    </section>     
    
    <script src="resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="resources/main_js/main_js.js"></script>
      
<jsp:include page="footer/footer.jsp" >
          <jsp:param value="" name="test"/>
       </jsp:include>
    </body>
</body>
</html>