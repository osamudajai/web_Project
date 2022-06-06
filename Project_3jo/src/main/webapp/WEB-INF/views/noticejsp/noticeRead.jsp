<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시글 읽기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<link rel="stylesheet" href="../resources/main_style/main_style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    
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
	<br><br>
	<h2 style="font-family:Times New Roman;">Service Center</h2>

    <!--고객센터 탭-->
    <div style="display:flex; padding:30px; justify-content:center;">
		<div class="tabrad" style="font-size:20px;"><strong><a style="color:white;" href="<c:url value="/notice/main"/>">&nbsp;NOTICE&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="<c:url value="/faq/main"/>">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="<c:url value="/qna/main"/>">&nbsp;QNA&nbsp;</a></strong></div>
	</div><br><br><br>
	
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
	
	<br>
	
	
	<!--공지사항 목록 불러오기-->
    <div id="div2">
        <div class="container_rv tb_tt">
            <h3 class="left-items" style="font-family:Times New Roman;">Notice</h3>
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
            <tr class="thtd deletebl" style="border-bottom: 2px #212529 solid; border-top: none; font-weight: bold;">
                <td>번호</td>
                <td class="thtd">제목</td>
                <td class="thtd">게시일자</td>
            </tr>
        <c:forEach var="notice" items="${noticelist}">
			<tr class="thtd deletebl">
				<td>${notice.nt_num}</td>
				<td class="thtd cur-po"><a style="color:#212529;" href="read?nt_num=${notice.nt_num}">${notice.nt_title}</a></td>
				<td class="thtd">${notice.nt_date}</td>
			</tr>
		</c:forEach>       
        </table>
        <div class="tb_bottom_line"></div>
    </div><br>
    
    <!-- 검색폼(제목/내용) -->
    <div id="div2">
         <form id="pagingForm" method="get" action="main">
           	<div style="display: flex; justify-content: center;">
				<input type="hidden" name="page" id="page" />
				<select class="selectBox" name="type" id="type">
					<option value="1">=전체=</option>
					<option value="2">제목</option>
					<option value="3">내용</option>
				</select>
				<input type="text" size="40" placeholder="검색어를 입력하세요." name="searchText" style="margin-left:16px;" value="${search.searchText}" />
				<div class="cur_po search_btt" onclick="pagingFormSubmit(1)">검색</div>
			</div>
		</form>
    </div><br><br><!-- /검색폼 -->
    
	<div id="navigator">
	<!-- 페이지 이동 부분 -->                      
		<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"><img src="../resources/image/page_pprev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})"><img src="../resources/image/page_prev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"><b></c:if>
				<a class="page_nm" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></b></c:if>
		</c:forEach>
		&nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})"><img src="../resources/image/page_next.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"><img src="../resources/image/page_nnext.png" style="width:20px; height:20px;"></a>
	<!-- /페이지 이동 끝 -->                      
	<br><br>
	</div>
	<br><br><br><br>
	
	
</div>

<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

</body>
</html>