<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매후기 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<script src="../resources/jq/jquery-3.6.0.min.js"></script>


<script>
//글쓰기폼 확인
function formCheck() {
	var rv_title = document.getElementById('rv_title');
	var rv_content = document.getElementById('rv_content');
	
	if (rv_title.value.length < 5) {
		alert("제목을 입력하세요.");
		rv_title.focus();
		rv_title.select();
		return false;
	}
	if (rv_content.value.length < 5) {
		alert("내용을 입력하세요.");
		rv_content.focus();
		rv_content.select();
		return false;
	}
	return true;
}
</script>

</head>
<body>

<div id="div1">
	<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
	<form id="writeform" action="write"  method="post" 
	enctype="multipart/form-data" onsubmit="return formCheck();">
	<input type="hidden" name="rv_num" value="${reviewlist.rv_num}">
	<br><br><br>
	
	<!--구매 후기 작성 폼-->
	<hr class="hrcss">
	    <div id="div_notice">
	        <br>
	        <div class="container">
	            <h3 class="left-items">구매 후기 수정</h3>
	        </div>
	    </div><br><hr class="hrcss"><br>
	
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
                    <td>내용</td>
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
        <hr class="hrcss">

        <!--등록/취소 버튼-->
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                <input type="submit" value="수정">
                <input type=button value="취소" onclick="qna_list()">
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