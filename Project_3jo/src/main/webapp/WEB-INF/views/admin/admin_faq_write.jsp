<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 작성 페이지</title>
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
	<script src="../resources/js/jquery-3.6.0.js"></script>

</head>
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
<div id="div1">
	<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
	<form id="admin_faq_write" action="admin_faq_write"  method="post" >
	<br><br><br>
	
	<!--구매 후기 작성 폼-->
	<hr class="hrcss">
	    <div id="div_notice">
	        <br>
	        <div class="container">
		    	<h3 class="left-items">1:1문의 작성&nbsp;&nbsp;</h3>
	            <p class="left-items">
					<input type="hidden" name="page" id="page" />
					<input type="radio" name="list_cg" value="주문/결제" checked>"주문/결제"
					<input type="radio" name="list_cg" value="배송">"배송"
					<input type="radio" name="list_cg" value="취소/환불/교환" >"취소/환불/교환"
					<input type="radio" name="list_cg" value="기타">"기타"
				</p>
			<p class="right-items"></p>
        	</div>
	
		<!--어드민 faq 문의 작성란-->
        <div class="notice_area">
            <table class="qna_write">
                <colgroup>
                    <col width="15%" />
                    <col width="2%" />
                    <col width="83%" />
                </colgroup>
                <tr>
                    <td>제목</td>
                    <td>&nbsp;</td>
                    <td><input name="faq_title" id="faq_title" style="width:100%;"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>&nbsp;</td>
                    <td><textarea name="faq_content" id="faq_content" style="width:100%; height: 300px; resize:none;"></textarea></td>
                </tr>
            </table>
        </div><br>    

        <br>
        <hr class="hrcss">

        <!--등록/취소 버튼-->
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                <input type="submit" value="등록">
<!--                 <input type="hidden" value="dd" name="a_status"> -->
                <td>&nbsp;</td>
            </tr>
        </table>
        <br>
        <br>
	
	<br><br><br><br>
	</form>
</div>

<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

