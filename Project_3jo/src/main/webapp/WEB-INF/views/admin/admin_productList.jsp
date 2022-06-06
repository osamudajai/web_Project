<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록 페이지</title>
<style>
table{margin:0 auto;}
th{background-color:gray;}
#total{
	font-weight:bolder;
}
</style>
<script src="../resources/jq/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/main_style/main_style.css">
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
<!-- 헤더 영역 시작 -->
<div class="header_container sticky-header">
   <div class="container-fluid">
	   <div class="row align-items-center">
	       <jsp:include page="../header/header.jsp">
	          <jsp:param value="" name="test"/>
	       </jsp:include>
	   </div>
   </div>
</div>
<!-- 헤더 영역 종료 -->   
<!-- 바디 영역 시작 -->
<div id="div1">
    <br><br>  
    <h2 style="font-family:Times New Roman;" align="center">Select Product</h2>
    <br><br>
	<form action="admin_productList" method="get">
		<table width="1000" align="center" cellpadding="5">	
			<tr>
			<td id="total" align="left">TOTAL : <span style="color:red;">${navi.totalRecordsCount}</span></td>
			</tr>	
			<tr>
			<th width="15%" id="pd_id" name="pd_id" style="text-align:center;">pd_number</th>
			<th width="10%" id="big_name" name="big_name" style="text-align:center;">대분류명</th>
			<th width="15%" id="br_name" name="br_name" style="text-align:center;">브랜드명</th>
			<th width="20%" id="pd_name" name="pd_name" style="text-align:center;">상품명</th>
			<th width="20%" id="pd_cost" name="pd_cost" style="text-align:center;">상품가격</th>
			<th width="*" name="pd_date" style="text-align:center;">상품등록일</th>
			</tr>
			<c:forEach var="i" items="${adminList}">
			<tr>
			    <td style="text-align:center;">${i.pd_id}</td>
				<td style="text-align:center;">${i.big_name}</td>
				<td style="text-align:center;">${i.br_name}</td>
				<td style="text-align:center;">${i.pd_name}
				</td>
				<td style="text-align:center;"><fmt:formatNumber value="${i.pd_cost}" pattern="###,###"/></td>
				<td style="text-align:center;">${i.pd_date}</td>
			</tr>
			</c:forEach>
		</table>
		<br><br>
			<!-- 페이지 이동 부분 -->
    <div id="navigator" align="center">                  
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp; 
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
	</div>
<!-- /페이지 이동 끝 -->                      
	</form>
		
	<form id="pagingForm" method="get" action="select">		
			<input type="hidden" name="page" id="page" onclick="pagingFormSubmit(1)"/>
	</form>
</div>
</body>
</html>