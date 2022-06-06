<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의글 확인 페이지</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
<link rel="stylesheet" href="../resources/main_style/main_style.css">


<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	
	form.submit();
}
//체크박스 개별 모두 체크 시, 전체 체크 박스 체크
function checkSelectAll()  {
	const checkboxes  
	  = document.querySelectorAll('input[name="q_nums"]');
	const checked 
	  = document.querySelectorAll('input[name="q_nums"]:checked');
	const selectAll 
	  = document.querySelector('input[name="selectall"]');
	
	if(checkboxes.length === checked.length)  {
	  selectAll.checked = true;
	}else {
	  selectAll.checked = false;
	}
  
}
//전체 체크박스로 개별 모두 체크 또는 모두 체크 해제
function selectAll(selectAll)  {
    const checkboxes 
         = document.getElementsByName('q_nums');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked;
    })
}

function deleteCheck() {
	 var form = document.getElementById('q_num_delete');
	 if(confirm("정말 삭제하시겠습니까?") == true){
		 form.submit();
	 } else {
		 return false;
	 }
}
</script>

</head>
<body>
<!-- header영역 시작 -->
<div class="header_container sticky-header">
	<div class="container-fluid">
		<div class="row align-items-center">
		    <jsp:include page="../header/header.jsp" >
		    	<jsp:param value="" name="test"/>
		    </jsp:include>
		</div>
	</div>
</div>
<!-- header영역 종료 -->

<div id="div1">
  <br><br> 
  <h2 style="font-family:Times New Roman;">Service Center</h2>	
	<div style="display:flex; padding:30px; justify-content:center;">
		<div class="tabrad" style="font-size:20px;"><strong><a style="color:white;" href="<c:url value="/notice/main"/>">&nbsp;NOTICE&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="<c:url value="/faq/main"/>">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</a></strong></div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="tabrad"><strong><a style="color:white;" href="<c:url value="/qna/main"/>">&nbsp;QNA&nbsp;</a></strong></div>
	</div><br><br><br>
        <!--1:1문의 게시글-->
        <div class="div2_q">
            <div class="container">
                <h3 class="left-items">[${qna.list_cg}]&nbsp;&nbsp;</h3>
            </div>
        </div> <!-- div2 -->
        <!--게시글 영역 두 개-->
        <div class="div2_q">
            <div class="left">
                <hr class="hrcss_h">
                <div class="container">
                    <h4 class="left-items">${qna.q_title}</h4>
                    <p class="right-items">${qna.q_date}</p>
                </div><br>
                <div class="qna_textarea">${qna.q_content}</div> 
                
                <br><br>
	            
	            <div>
		            <c:if test="${qna.q_originalfile != null}">
					<img src="showfile?q_num=${qna.q_num}" style="width:25%; height:25%;">
					</c:if>
	             </div>
	        </div> <!-- left -->
	        
            <div class="right">
                <hr class="hrcss_h">
                <div class="container">
                    <h4 class="left-items">[답변] ${qna.q_title}</h4>
                    <p class="right-items">${qna.a_date}</p>
                </div><br>
                <div class="qna_textarea">
                	<c:if test="${qna.a_content != null}">
                	${qna.a_content}
                	</c:if>
                	<c:if test="${qna.a_content == null}">
                	<p>금방 답변 드리겠습니다.</p>
                	</c:if>
                </div><br><br>
            </div> <!-- right -->
        </div> <!-- div22 -->
</div>
	<!--1:1 문의 목록-->
	<div id="div3">
		
	<form method="post" action="delete" id="q_num_delete">
	    <table class="tblist">
	        <colgroup>
	            <col width="11%" />
	            <col width="49%" />
	            <col width="11%" />
	            <col width="10%" />
	            <col width="11%" />
	            <col width="18%" />
	        </colgroup>
	        <tr class="thtd deletebl" style="border-bottom: 2px #212529 solid; border-top: none; font-weight: bold;">
	            <td>분류</td>
	            <td class="thtd">제목</td>
	            <td class="thtd">등록일</td>
	            <td class="thtd">답변여부</td>
	            <td class="thtd">답변일</td>
	            <td class="thtd" style="vertical-align: middle;">선택&nbsp;&nbsp;<input type="checkbox" name="selectall" onclick="selectAll(this)"></td>
	        </tr>
	        
        <c:forEach var="qna" items="${qnalist}">
			<tr class="thtd deletebl">
				<td>${qna.list_cg}</td>
				<td class="thtd cur-po"><a style="color:#212529;" href="read?q_num=${qna.q_num}">${qna.q_title}</a></td>
				<td class="thtd">${qna.q_date}</td>
				<td class="thtd">${qna.a_status}</td>
				<td class="thtd">${qna.a_date}</td>
				<td class="thtd">
					<input type="checkbox" name="q_nums" id="check" value="${qna.q_num}" onclick="checkSelectAll()">
				</td>
			</tr>
		</c:forEach>
	    </table>
	    <div class="tb_bottom_line"></div>
	</form>
	</div><br> 
    <!-- 검색폼(분류별) -->
    <div class="div2_q">
      	<form id="pagingForm" method="get" action="main" name="tab">
           	<div style="display: flex; justify-content: left;">
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