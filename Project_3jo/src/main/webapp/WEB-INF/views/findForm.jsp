<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css" />
<script src="resources/js/jquery-3.3.1.min.js"></script>

<script>
//아이디 찾기 폼 검사
function formCheck() {
	var email = document.getElementById('email');

	if (email.value.length < 3 || email.value.length > 30) {
		alert("이메일은 3~30자로 입력하세요.");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<section>
        <div class="imgBx">
            <img src="resources/image/perfume.jpg" alt="">
        </div>
	<div class="contentBx">
       	<div class="formBx">
<form id="loginForm" action="findid" name="findid" method="post" onSubmit="return formCheck();">
<div class="inputBx">
	<span>이메일을입력해주세요</span>
	<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" maxlength="30" size="20" />
	<input type="submit" value="id찾기">
</div>
</form>

			<c:if test="${check == 1}">
			<script>
				opener.document.findid.email.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>

			<c:if test="${check == 0 }">
			<label>찾으시는 아이디는 ${id} 입니다.</label>
			<div class="form-label-group">
				 <a href="join_loginForm">로그인하러가기</a>
				</div>
			</c:if>
</div>
</div>
</section>
</body>
</html>