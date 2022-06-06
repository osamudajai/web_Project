<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매후기 목록</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<script src="../resources/jq/jquery-3.6.0.min.js"></script>
<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	
	form.submit();
}
function openCloseAnswer(id) {

    const answerId = id.replace('que', 'ans');
    const imgId = id.replace('que', 'img');	
    
    if(document.getElementById(answerId).style.display === 'block') {
    	document.getElementById(answerId).style.display = 'none';
    } else {
    	document.getElementById(answerId).style.display = 'block';
    }
   	
    if($('#' + imgId).attr('src') == "../resources/image/down_arrow.png") {
    	$('#' + imgId).attr('src', "../resources/image/up_arrow.png");
    } else {
    	$('#' + imgId).attr('src', "../resources/image/down_arrow.png");
    }
   	
}

</script>

</head>
<body>

<div id="div1">
	<br><br><br>
	
	<!--리스트 제목 & 검색창-->
	<div id="div2-2">
	    <div><h3>&nbsp;구매 후기</h3></div>
	</div>
	<br>
		
	<!-- 구매후기 목록 -->
	<div id="div3">
		<table class="tblist">
		    <colgroup>
		        <col width="10%" />
		        <col width="50%" />
		        <col width="17%" />
		        <col width="23%" />
		    </colgroup>
			<tr class="thtd deletebl">
	            <td>번호</td>
	            <td class="thtd">제목</td>
	            <td class="thtd">작성자</td>
	            <td class="thtd">작성일</td>
		   	</tr>
		   	<c:forEach var="review" items="${reviewlist}">
			   	<tr class="thtd deletebl">
			   		<td>${review.rv_num}</td>
			   		<td class="thtd">
			   			<div class="container" id="que-${review.rv_num}" onclick="openCloseAnswer(this.id)">
							<div class="deletebl question left-items"><span>Q.&nbsp;${review.rv_title}</span></div>
							<div><img id="img-${review.rv_num}" src="../resources/image/down_arrow.png"
							style="width: 30px; height: 30px;" class="cur-po"></div>
			            </div>
						<div class="deletebl answer" id="ans-${review.rv_num}">
						<br><br>&nbsp;&nbsp;A.&nbsp;${review.rv_content}<br><br></div>
					</td>
					<td class="thtd">${review.po_id}</td>
					<td class="thtd">${review.rv_date}</td>
					
			    </tr>
			</c:forEach>	    
		</table>
	</div>
    
    <!-- 전체/포토후기 조건 검색 -->
    <div id="div2">
        <div class="container">
            <p class="left-items">
                <form id="pagingForm" method="get" action="list">
					<input type="hidden" name="page" id="page" />
					<select name="type">
						<option value="1">=전체=</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
					</select>
					<input type="text"  name="searchText" value="${search.searchText}" />
					<input type="button" onclick="pagingFormSubmit(1)" value="검색">
				</form></p>
			<p class="right-items">
				<form>
					<input type="button" onClick="location.href='write'" value="글쓰기">
				</form>
			</p>	
        </div>
    </div><br><br><!-- /포토후기 조건 검색 -->
    
    
    <div id="navigator">
	<!-- 페이지 이동 부분 -->                      
		<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;
		
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"><b></c:if>
				<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></b></c:if>
		</c:forEach>
		&nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
	<!-- /페이지 이동 끝 --><br><br>
	</div>
	<br><br><br><br>

</div>
<br><br><br><br>

</body>
</html>