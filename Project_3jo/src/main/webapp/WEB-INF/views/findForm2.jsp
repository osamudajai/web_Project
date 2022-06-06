<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css" />
<script src="resources/js/jquery-3.3.1.min.js"></script>

<script>
//아이디 찾기 폼 검사
function formCheck() {
	var po_id = document.getElementById('po_id');

	if (po_id.value.length < 3 || po_id.value.length > 10) {
		alert("아이디는 3~10자로 입력하세요.");
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
<form action="findpw" name="findpw" method="post" onSubmit="return formCheck();">
<div class="inputBx">
	<span>아이디를 입력해주세요</span>
	<input type="text" name="po_id" id="po_id" placeholder="아이디를 입력해주세요" maxlength="20" size="20" />
	<input type="submit" value="id찾기">
</div>
</form>

			<c:if test="${check == 1}">
			<script>
				opener.document.findpw.po_id.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>

			<c:if test="${check == 0 }">
			<label>찾으시는 비밀번호는 ${pw} 입니다.</label>
			<div class="form-label-group">
				 <a href="join_loginForm">로그인하러가기</a>
				</div>
			</c:if>
</div>
</div>
</section>
</body>
</html>