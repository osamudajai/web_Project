<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매후기 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value = "/" />resources/css/board.css" />
<script src="<c:url value = "/" />resources/jq/jquery-3.6.0.min.js"></script>

<script>
//글쓰기폼 확인
$(document).ready(function() {
	
	$("#rv_content").keyup(function(){
        var cmt =  $(this).val();   // 이벤트를 일으킨 컨트롤(this)의 value를 cmt에 저장
        if (cmt.length > 650) alert("650자 이내로 입력하세요.");
        // 입력한 글자가 200자가 넘으면 경고 메시지를 띄워줌

        cmt = cmt.substring(0, 650);      // 입력한 값들 중 650자 까지만 잘라옴
        $(this).val(cmt);   			 // 이벤트를 일으킨 컨트롤(this)의 value에 cmt를 넣음
        $("#output").text(cmt.length);  // 현재 글자 개수 출력
     });

});
function formCheck() {
	var rv_title = document.getElementById('rv_title');
	var rv_content = document.getElementById('rv_content');
	
	if (rv_title.value.length < 5) {
		alert("제목을 5자 이상 입력하세요.");
		rv_title.focus();
		rv_title.select();
		return false;
	}
	if (rv_title.value.length > 30) {
		alert("제목이 너무 깁니다(30자 제한).");
		rv_title.focus();
		rv_title.select();
		return false;
	}
	if (rv_content.value.length < 5) {
		alert("내용을 5자 이상 입력하세요.");
		rv_content.focus();
		rv_content.select();
		return false;
	}
		return reviewFormSubmit(); //조건 모두 만족하면 submit 함수 호출
}

	function reviewFormSubmit() {
		var form = document.getElementById('write');
		form.submit();
	}
</script>

</head>
<body>

<div id="div1">
	<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
	<form id="write" action="write"  method="post" 
	enctype="multipart/form-data" onsubmit="return formCheck();" style="text-align: -webkit-center;">
		<input type="hidden" name="pd_id" value="${pd_id}">
		<input type="hidden" name="pd_name" value="${pd_name}">
		<br><br><br>
	
	<!--구매 후기 작성 폼-->
	<hr class="hrcss" style="width: 58%;">
	    <div id="div_notice">
	        <br>
	        <div class="container">
	            <h3 class="left-items" style="text-align: center;">구매 후기 작성</h3>
	        </div>
	    </div><br><hr class="hrcss" style="width: 58%;"><br>
	
	<!--구매 후기 작성란-->
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
                    <td><input name="rv_title" id="rv_title" style="width:100%;"></td>
                </tr>
                <tr>
                    <td>내용<br>(<span id="output">0</span>/ 650)</td>
                    <td>&nbsp;</td>
                    <td><textarea name="rv_content" id="rv_content" style="width:100%; height: 300px; resize:none;"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2"></td>
                    <td><input type="file" name="upload"></td>
                </tr>
            </table>
        </div><br>    
        

        <br>
        <hr class="hrcss" style="width: 58%;">
	<br/><br/><br/><br/><br/>
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                <div style="display: flex; justify-content: center;">
                <div class="cur_po search_btt" style="margin-right:4px; padding-bottom: 6px;" onclick="formCheck()">등록</div>
						<div class="cur_po search_btt" style="padding-bottom: 6px;" onclick="location.href='myPage'">취소</div>
						</div>
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

</body>
</html>