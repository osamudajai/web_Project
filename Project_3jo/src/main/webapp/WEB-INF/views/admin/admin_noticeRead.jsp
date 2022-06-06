<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<link rel="stylesheet" href="../resources/main_style/main_style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
</head>
<body>


<!-- 페이지 이동 스크립트  -->

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
	<br><br>
	<h2>고객센터</h2>
	<br>
    <!--고객센터 탭-->
    <table id="upper_tab">
        <tr>
            <td class="tm"><a href="admin_notice">&nbsp;공지사항&nbsp;</a></td>
            <td class="t"><a href="">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</a></td>
            <td class="t"><a href="">&nbsp;1:1 문의&nbsp;</a></td>
        </tr>
    </table>
	<br><br><br>
	
	<!--공지사항 게시글-->
	<hr class="hrcss">
	    <div id="div_notice">
	        <br>
	        <div class="container">
	            <h3 class="left-items">${notice.nt_title}</h3>
	            <p class="right-items">${notice.nt_date}</p>
	        </div>
	    </div><br>
	
	    <div class="notice_area">
	        <pre>${notice.nt_content}</pre>
	    </div><br><br><br>
	<hr class="hrcss">
	
	<br><br><br><br>
	
	
	<!--목록 불러오기-->
   
		
<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

	
</div>
</body>
</html>