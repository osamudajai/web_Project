<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h1>[ 공지사항 작성 폼 ]</h1>

<form action="admin_notice_write" method="post">

<table>
<tr>
	<th>공지 사항 제목</th>
	<td><input type="text" name="nt_title" id="nt_title" maxlength="10" required="required"></td>
</tr>

<tr>
	<th>공지 사항 내용</th>
	<td><textarea name="nt_content" id="nt_content" required="required"></textarea></td>
</tr>

<tr>
	<td colspan="2" align="center"><input type="submit" value="저장">
</tr>
</table>
</form>
<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

</body>
</html>