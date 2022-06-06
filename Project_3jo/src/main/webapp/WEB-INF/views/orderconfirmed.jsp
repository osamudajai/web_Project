<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="resources/css/ordconfirmed.css"/>
<title>ODRER CONFIRMED2</title>
<script src="resources/js/orderjs.js" defer></script>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    
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
            <span class="mark_shoppingbag">01 SHOPPINGBAG</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="mark_order">02 ORDER</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="mark_confirmed">03 ORDER CONFIRMED</span>
        </div>
    </section>

    <section>
        <div class="confirm_box">
            <div class="confirm_text">
                <span>주문이 완료되었습니다.</span>
            <div class="confirm_box_line">
            </div>
            <section class="confirm_section2">
                <div class="confirm_order_num">
                    <span id="confirm_order_num1">주문번호</span>
                    <span id="confirm_order_num2">ORD**********</span>
                </div>
                <div class="confirm_shopname">
                    <span id="confirm_shopname"><i>#CHARMANT</i></span>
                </div>
            </section>
            </div>
        </div>
    </section>
   
   <div class="img1">
      <img src="resources/recommendation/logo1.png" class="img1-1">
   </div>
   
   <div class="thanks">
      Charmant을 이용해주셔서 감사합니다.
   </div>
   
   <div class="img2">
      <img src="resources/recommendation/logo-text.png" class="img2-1">
   </div>

    <section>
        <div class="submit">
         <input type="submit" id="submitbt" name="submitbt" value="계속 쇼핑하기"
         onclick="location.href='/Project_3jo'">
        </div>
    </section>
   <jsp:include page="footer/footer.jsp" >
          <jsp:param value="" name="test"/>
       </jsp:include>
</body>
</html>