<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 확인 및 작성</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<link rel="stylesheet" href="../resources/main_style/main_style.css">
</head>
<body>
<script src="../resources/jq/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	document.getElementById('type').value = ${type};
});
</script>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>

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
    <br>
    <br>
    <h2>어드민 전용 고객센터</h2>
    <br>
       <div style="display:flex; padding:30px; justify-content:center;">
		<div class="tabrad" style="font-size:20px;"><strong><a style="color:white;" href="admin_notice">&nbsp;NOTICE&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="admin_faq">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="admin_QNA">&nbsp;QNA&nbsp;</a></strong></div>
	</div>
    <br><br>

    <br>
    <!--리스트 제목 & 검색창-->
    <div id="div2">
        <div class="container">
            <h3 class="left-items">&nbsp;공지사항</h3>
        </div>
    </div>

    <!--공지사항 목록-->
    <div id="div3">
        <table class="tblist">
            <colgroup>
                <col width="11%" />
                <col width="69%" />
                <col width="20%" />
            </colgroup>
            <tr class="thtd deletebl">
                <td>번호</td>
                <td class="thtd">제목</td>
                <td class="thtd">게시일자</td>
            </tr>
        <c:forEach var="notice" items="${noticelist}">
			<tr class="thtd deletebl">
				<td>${notice.nt_num}</td>
				<td class="thtd cur-po"><a class="a1" href="read?nt_num=${notice.nt_num}">${notice.nt_title}</a></td>
				<td class="thtd">${notice.nt_date}</td>
				<td><a style="color: red;" href="noticedelete?nt_num=${notice.nt_num}">삭제</a></td>
			</tr>
		</c:forEach>       
        </table>
    </div><br><br>

    
    <!-- 검색폼 -->
    <div id="div2">
        <div class="container">
            <p class="right-items">
                <form id="pagingForm" method="get" action="admin_notice">
					<input type="hidden" name="page" id="page" />
					<select name="type" id="type">
						<option value="1">=전체=</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
					</select>
					<input type="text"  name="searchText" value="${search.searchText}" />
					<input type="button" onclick="pagingFormSubmit(1)" value="검색">
				</form></p>
        </div>
    </div><br><br><!-- /검색폼 -->
     <p><a href="admin_notice_write">글쓰기</a></p>
    
	<div id="navigator">
	<!-- 페이지 이동 부분 -->                      
		<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"><img src="../resources/image/page_pprev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})"><img src="../resources/image/page_prev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"></c:if>
				<a class="page_nm" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></c:if>
		</c:forEach>
		&nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})"><img src="../resources/image/page_next.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"><img src="../resources/image/page_nnext.png" style="width:20px; height:20px;"></a>
	
	<!-- /페이지 이동 끝 -->                      
	
	<br><br>

	</div>
	
	<br><br><br><br>
	
<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

</body>
</html>