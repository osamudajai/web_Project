<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어드민 FAQ 목록 페이지</title>
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

<script>
$(document).ready(function(){
	$('.cur_po').on('click', call1);
});

function call1() {
	var faq_num = $(this).attr('fn');

$.ajax({
	url: 'update',
	type: 'post',
	dataType: 'text',
	data:{faq_num : faq_num},
	success: function(){
	},
	error:function(){
	}
});	
}

$(document).ready(function(){
	document.getElementById('type').value = ${type};
	
	let tabname = ['dall', 'pay', 'delv', 'cn', 'ect'];
	let t = ${type};
	
	$('.tab2').addClass('tab1');
	$('.tab2').removeClass('tab2');
	
	$('#' + tabname[t - 1]).addClass('tab2');
	
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
function openCloseAnswer(id) {	//'que-1'

    const answerId = id.replace('que', 'ans');	 //'ans-1'
    const imgId = id.replace('que', 'img');		//'img-1'
    
    if(document.getElementById(answerId).style.display === 'block') {
    	document.getElementById(answerId).style.display = 'none';
    	/* document.getElementById('img1').src = "../resources/image/down_arrow.png" */
    } else {
    	document.getElementById(answerId).style.display = 'block';
    	/* document.getElementById('img1').src = "../resources/image/up_arrow.png"; */
    }
    
    /* alert($('#' + imgId).attr('src')); */
   	
    if($('#' + imgId).attr('src') == "../resources/image/down_arrow.png") {
    	$('#' + imgId).attr('src', "../resources/image/up_arrow.png");
    } else {
    	$('#' + imgId).attr('src', "../resources/image/down_arrow.png");
    };
   	
}
function showPaylist(n) {
	document.getElementById('type').value = n;
	
	/* let pay = document.getElementById('pay')
	if(pay.className === 'tab1') {
		pay.className = 'tab2';
		dall.className = 'tab2';
	} */
	
	var page = document.getElementById('page');
	/* form.submit(); */
	
	document.tab.submit();
}

/* $('#pay').click(function() {
	$('#all, #delv, #cn, #ect').removeClass();
	$('#pay').addClass('tab2');
	$('#all, #delv, #cn, #ect').addClass('tab1');
}); */


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
	<h2 style="font-family:Times New Roman;">Service Center</h2>

	    <!--고객센터 탭-->
	    <div style="display:flex; padding:30px; justify-content:center;">
		<div class="tabrad" style="font-size:20px;"><strong><a style="color:white;" href="admin_notice">&nbsp;NOTICE&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="admin_faq">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="">&nbsp;QNA&nbsp;</a></strong></div>
		</div>
	
	<!--리스트 제목 & 검색창-->
    <!-- <div id="div2">
        <div class="container_rv tb_tt">
            <h3 class="left-items" style="font-family:Times New Roman;">FAQ</h3>
        </div>
    </div> -->
	
	<br>
	<div id="div2" style="margin-top: 40px;">
	    <div style="display: flex; justify-content: left;">
	        <div id="dall" class="tab2" onclick="showPaylist(1)">&nbsp;전체&nbsp;</div>
	        <div id="pay" class="tab1" onclick="showPaylist(2)">&nbsp;주문/결제&nbsp;</div>
	        <div id="delv" class="tab1" onclick="showPaylist(3)">&nbsp;배송&nbsp;</div>
	        <div id="cn" class="tab1" onclick="showPaylist(4)">&nbsp;취소/환불/교환&nbsp;</div>
	        <div id="ect" class="tab1" onclick="showPaylist(5)">&nbsp;기타&nbsp;</div>
	    </div>
	</div>
	
		
	<!-- FAQ 목록 -->
	<div id="div3">
		<table class="tblist">
		    <colgroup>
		        <col width="20%" />
		        <col width="80%" />
		    </colgroup>
			<tr class="faq_thtd deletebl" style="border-bottom: 2px #212529 solid; border-top: none; font-weight: bold;">
	            <td>분류</td>
	            <td class="thtd">제목</td>
		   	</tr>
		   	<c:forEach var="faq" items="${faqlist}">
			   	<tr class="thtd deletebl">
			   		<td>${faq.list_cg}</td>
			   		<td class="thtd">
			   			<div class="container" id="que-${faq.faq_num}" onclick="openCloseAnswer(this.id)">
							<div class="deletebl question left-items"><span>Q.&nbsp;${faq.faq_title}</span></div>
							<div><img id="img-${faq.faq_num}" src="../resources/image/down_arrow.png"
							style="width: 30px; height: 30px;" class="cur_po" fn="${faq.faq_num}"></div>
			            </div>
						<div class="deletebl answer" id="ans-${faq.faq_num}">
						<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.&nbsp;${faq.faq_content}<br><br></div>
					</td>
			    </tr>
			</c:forEach>	    
		</table>
		<div class="tb_bottom_line"></div>
	</div><br>
		<a href="admin_faq_write"><button style="width: 40px; height: 40px" value="작성"></button></a>
    
    <!-- 검색폼(분류별) -->
    <div id="div2">
      	<form id="pagingForm" method="get" action="admin_faq" name="tab">
           	<div style="display: flex; justify-content: center;">
				<input type="hidden" name="page" id="page" />
				<select class="selectBox" name="type" id="type">
					<option value="1">=  전체  =</option>
					<option value="2">주문/결제</option>
					<option value="3">배송</option>
					<option value="4">취소/환불/교환</option>
					<option value="5">기타</option>
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

</div>
<br><br><br><br>

     
<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>
</body>
</html>