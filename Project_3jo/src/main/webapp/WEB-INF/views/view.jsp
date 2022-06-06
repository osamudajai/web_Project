<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_view</title>
<link rel="stylesheet" href="../../resources/main_style/main_style.css">
<link rel="stylesheet" href="../../resources/css/view.css">
<link rel="stylesheet" href="../../resources/css/board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
<script>
//tabMenu스크롤 이동
 jQuery(document).ready(function($) {
   $(".scroll").click(function(event){            
   event.preventDefault();
   $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
   });
   
   document.getElementById('type').value = '1';
   callReview(1);
/*    $('#callR').on('click', callReview); */
   
}); 

//수량에 따른 가격변경
function changeCnt(op, total) {
    var cnt = 1;
    var ocIndex = document.getElementById('ocoption').options[document.getElementById('ocoption').selectedIndex].value;
    var price = document.getElementById("hPrice").value;
    var textSpan =  document.getElementById("pdcnt");   
   var textSpanValue = document.getElementById("pdcnt").innerText; //상품수량
   var obj2 = document.getElementById("total");      
   var obj2Value = document.getElementById("total").innerText;      //총 합산금액
   
   var point = document.getElementById("hpoint").value;         //적립금
   var obj3 = document.getElementById("totalPoint");            //적립금 합계
    if(op == "+"){
       //sum = parseInt(textSpanValue) + cnt;
       //alert(pointValue);
       var sum = parseInt(textSpanValue) + cnt;   //sum = 수량 + 1
       textSpan.innerText = sum;
       obj2.innerText =  (parseInt(ocIndex) + parseInt(price)) * sum;
       obj3.innerText = parseInt(point) * sum;      //적립금합계 = 적립금 * 수량
    }else{
       //alert(parseInt(textSpanValue));
       //alert(textSpan = parseInt(textSpanValue) - cnt);
       //alert(obj2.innerText = textSpan.innerText * total);
        if(parseInt(textSpanValue) > 1) { 
          textSpan.innerText = parseInt(textSpanValue) - cnt;
          var sum2 = parseInt(textSpanValue) - cnt;   //sum2 = 수량 - 1
          obj2.innerText = (parseInt(price) + parseInt(ocIndex)) * sum2;   
          obj3.innerText = parseInt(point) * sum2;//적립금합계 = 적립금 * 수량
        } 
    }
}

//select옵션 value값으로 가져오기
function updateTotal(pdtcnt){
   var ocIndex = document.getElementById('ocoption').options[document.getElementById('ocoption').selectedIndex].value;
   var obj2 = document.getElementById("total");   //총 합산가격
   var price = document.getElementById("hPrice").value;   //상품가격
   var textSpan =  document.getElementById("pdcnt").innerText;   //수량
   
   obj2.innerText = parseInt(ocIndex) + parseInt(price);
   
}

</script>

<script>   
 	$(document).ready(function() {

	    $('.ba_bt').on('click', call1);
	});
 	
	function call1() {
		var pd_id = $(this).attr('pd');
		var textSpanValue = document.getElementById("pdcnt").innerText;
		var obj2Value = document.getElementById("total").innerText; 
		var selected = document.getElementById('ocoption').options[document.getElementById('ocoption').selectedIndex].value;

		 if(selected == 1){
		      alert("[필수]용량을 선택해 주십시오!");
		      return ;
		      
		 }
		 else{
 		$.ajax({
			url: '../../ba_insert', //컨트롤러의 함수값
			type: 'post',  //타입
			dataType: 'text', // 물어보기
			data:{pd_id : pd_id, amount : textSpanValue, mlmoney : obj2Value},
			success: function(){
					alert('장바구니에 담겼습니다!')
					var text = $('#total').text();
			         $('#TotalPrice').text(text);      //총 합계가격
			         var textSpan = $('#pdcnt').text();
			         $('#infoCnt').text(textSpan);      //선택한 수량
			         var selectml = $("#ocoption option:checked").text();   
			         $('#infoml').text(selectml);       //선택한 용량
			         $("#cartmodal").show();
			        
			},
			error:function(x,e){
	            if(x.status==500){
					
		            alert('로그인이 필요한 서비스입니다!!');

		            location.reload('/join&loginForm.jsp');
		            //월요일 질문하기

	            }
			}
		});
	}
}
	 function closeModal() {
  	   $('#cartmodal').hide();
  	};
//서버 호출
</script>

<script>
//구매후기, 문의 게시판
/* function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	
	
	form.submit();
	
	callReview();
} */
//토글
function openCloseAnswer(id) {

    const answerId = id.replace('que', 'ans');
    const imgId = id.replace('que', 'img');	
    
    if(document.getElementById(answerId).style.display === 'block') {
    	document.getElementById(answerId).style.display = 'none';
    } else {
    	document.getElementById(answerId).style.display = 'block';
    }
   	
    if($('#' + imgId).attr('src') == "../../resources/image/down_arrow.png") {
    	$('#' + imgId).attr('src', "../../resources/image/up_arrow.png");
    } else {
    	$('#' + imgId).attr('src', "../../resources/image/down_arrow.png");
    }
   	
}
//구매후기 데이터 ajax	
function callReview(page) {
	
	var type = document.getElementById('type').value;
	var searchText = document.getElementById('searchText').value;
	var pd_id = $('.ba_bt').attr('pd');
	var pd_name = $('.ba_bt').attr('pn');
	
	$.ajax({
		url: 'callreview',
		type: 'GET',
		dataType : "json", 
		data: {'type': type, 'searchText': searchText, 'page': page, 'pd_id': pd_id, 'pd_name': pd_name},
		success: function(reviewmap) {
			repeatcall(reviewmap);
		},
		error: function(e) {
			alert('에러');
			alert(JSON.stringify(e));
		}
	});	
}

//구매후기 목록 출력
function repeatcall(reviewmap) {
	
	//목록
	var str = '<div id="div3">';
		str += '<table class="tblist">';
		str += '<tr class="thtd deletebl" style="border-bottom: 2px #212529 solid; border-top: none; font-weight: bold;">';
		str += '<td>번호</td>';
		str += '<td class="thtd">제목</td>';
		str += '<td class="thtd">작성자</td>';
		str += '<td class="thtd">작성일</td>';
		str += '</tr>';
	$.each(reviewmap.reviewList, function(index, rvpost){
		str += '<tr class="thtd deletebl">';
		str += '<td>' + rvpost.rv_num + '</td>';
		str += '<td class="thtd">';
		str += '<div class="container_rv" id="que-' + rvpost.rv_num + '" onclick="openCloseAnswer(this.id)">';
		str += '<div class="deletebl question left-items"><span>&nbsp;' + rvpost.rv_title +'</span>';
			if(rvpost.rv_originalfile != null){
				str += '<img src="../../resources/image/img_yes.png" style="width:20px; height:20px;">';
			}
		str	+= '</div>';
		str += '<div><img id="img-' + rvpost.rv_num +'" src="../../resources/image/down_arrow.png" style="width: 30px; height: 30px;" class="cur-po"></div></div>';
		str += '<div class="deletebl answer" id="ans-' + rvpost.rv_num + '"><br><br>&nbsp;&nbsp;&nbsp;' + rvpost.rv_content + '<br>';
			if(rvpost.rv_originalfile != null){
				str += '<br><br>&nbsp;&nbsp;&nbsp;';
				str += '<img src="showfile?rv_num=' + rvpost.rv_num + '" style="width:10%; height:10%;">';
			}
		str	+= '<br><br></div>';
		str += '</td>';
		str += '<td class="thtd">' + rvpost.po_id + '</td>';
		str += '<td class="thtd">' + rvpost.rv_date + '</td>';
		str += '</tr>';
	});
	str += '</table>';
	str += '<div class="tb_bottom_line"></div>';
	str	+= '</div>';
	
	//목록 출력 영역에 내용 삽입
    $('#callReveiw').html(str);
	
	//페이징
	var pagestr = '<div id="navigator">';
	pagestr += '<a href="javascript:callReview(' + (reviewmap.pageinfo.currentPage - reviewmap.pageinfo.pagePerGroup) + ')"><img src="../../resources/image/page_pprev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;';
	pagestr += '<a href="javascript:callReview(' + (reviewmap.pageinfo.currentPage - 1) + ')"><img src="../../resources/image/page_prev.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;';
	
	for (var i = reviewmap.pageinfo.startPageGroup; i <= reviewmap.pageinfo.endPageGroup; i++) {
		pagestr += '<a class="page_nm" href="javascript:callReview(' + i + ')">' + i + '</a>&nbsp';
	}
	
	pagestr += '&nbsp;&nbsp;';
	pagestr += '<a href="javascript:callReview(' + (reviewmap.pageinfo.currentPage + 1) + ')"><img src="../../resources/image/page_next.png" style="width:20px; height:20px;"></a> &nbsp;&nbsp;';
	pagestr += '<a href="javascript:callReview(' + (reviewmap.pageinfo.currentPage + reviewmap.pageinfo.pagePerGroup) + ')"><img src="../../resources/image/page_nnext.png" style="width:20px; height:20px;"></a>';
	pagestr += '</div><br><br><br><br>';
	
    //목록 출력 영역에 내용 삽입
    $('#callPage').html(pagestr);

}

</script>

</head>
<body>
<div class="header_container sticky-header">
   <div class="container-fluid">
         <div class="row align-items-center">
          <jsp:include page="header/header.jsp" >
             <jsp:param value="" name="test"/>
          </jsp:include>
         </div>
   </div>
</div>  
<!-- 상단 시작(상품이미지, 상품정보) -->
<div style="width:1080px; margin-top:100px; margin:0 auto;">
   <!-- 상품 이미지 및 상품 정보 보기 영역 시작 -->
   <table width="100%" cellpadding="5">
   <tr align="center">
   <td width="450" valign="top">
   <!-- 상품이미지 시작 -->
      <div id="d_pdtImg" >
         <table width="100%" >
         <tr>
         <td align="center" valign="middle">
            <img src="../../resources/img/${list[0].big_name}/${list[0].br_name}/${list[0].pd_img1}" width="100%" height="400"/>
         </td>
         </tr>
         <tr>
         <td align="center">
            <img src="../../resources/img/${list[0].big_name}/${list[0].br_name}/${list[0].pd_img1}" width="50" height="50"/>
         </td>
         </tr>
         </table>
      </div>
   <!-- 상품이미지 종료 -->
   </td>
   <!-- 상품정보 시작 -->
   <td width="*" valign="top">
      <form name="frmPdt" action="" method="post">
      <input type="hidden" name="piid" value="prada rapam o d perfume" />
      <input type="hidden" name="pd_price" id="occnt" value="1" />
      
       <div id="d_pdtDetailInfo">
         <h4 style="margin:0px;">${list[0].pd_name}</h4>      
         <span class="origin_cost">원가 : <fmt:formatNumber value="${list[0].origin_cost}" pattern="###,###" />원</span>
         <hr/>
         <table width="100%" id="t_pdtDetailInfo" cellpadding="3">
            <tr>
            <th width="35%"><span id="th_price">판매가</span></th><td width="*"><span class="pd_price" id="pd_price">
                     <strong><fmt:formatNumber value="${list[0].pd_cost}" pattern="###,###"/>원</strong></span></td>
                     <input type="hidden" id="hPrice" value="${list[0].pd_cost}">
             <tr>
               <th><span id="th_point">적립금</span></th><td><span class="pd_point" id="pd_point"><strong>
               <fmt:formatNumber value="${list[0].pd_cost*list[0].pd_save}" pattern="00"/>원(${list[0].pd_save}%)</strong>
               &nbsp;&nbsp;&nbsp;
               <strong>적립금 합계 :</strong>
               <span id="totalPoint" value="${list[0].pd_cost*list[0].pd_save}"></span>원
               <input type="hidden" id="hpoint" value="${list[0].pd_cost*list[0].pd_save}"></span></td>
            </tr>
            <tr>
               <th><span id="th_del_price">배송비</span></th><td><span class="del_price"><strong>2,500원(100,000원 이상 구매시 Free)</strong></span></td>
            </tr>
            <tr>
               <th>수량</th>
               <td>
               <label  for="inputid">
                  <input type="button" class="btn" value="-" id="inputid" onclick="changeCnt(this.value, ${list[0].pd_cost});"/>
                  <span id="pdcnt" id="amount_${list[0].pd_id}">1</span>
                  <input type="button" class="btn" value="+" id="inputid" onclick="changeCnt(this.value, ${list[0].pd_cost});"/>
                  </label>
               </td>
            </tr>
            <tr>
            <th>용량</th>
            <td>
                <select name="ocoption" id="ocoption" onchange="updateTotal()">                
                  <option value="1">[필수]옵션을 선택해 주세요.</option>
                  <!-- 상품 용량이 하나만 있을 시 -->
                  <c:if test="${list[0].ml_price2 == 0 and list[0].ml_price3 == 0}">
                     <option value="0" id="ml_price1">
                        ${list[0].ml_id1}ml(<fmt:formatNumber value="0" pattern="###,###"/>원)</option>
                  </c:if>
                  <!-- 상품 용량이 두개 있을 시 -->
                  <c:if test="${list[0].ml_price1 != 0 and list[0].ml_id2 != 30 and list[0].ml_id3 == 30}">
                     <option value="0" id="ml_price1">
                        ${list[0].ml_id1}ml(+<fmt:formatNumber value="0" pattern="###,###"/>원)</option>               
                     <option value="${list[0].ml_price2}" id="ml_price1">
                        ${list[0].ml_id2}ml(+<fmt:formatNumber value="${list[0].ml_price2}" pattern="###,###"/>원)</option>
                  </c:if>
                  <!-- 상품 용량이 세개 다 있을 시 -->
                  <c:if test="${list[0].ml_price2 != 0 and list[0].ml_price3 != 0}">
                     <option value="0" id="ml_price1">
                        ${list[0].ml_id1}ml(+<fmt:formatNumber value="0" pattern="###,###"/>원)</option>               
                     <option value="${list[0].ml_price2}" id="ml_price2">
                        ${list[0].ml_id2}ml(+<fmt:formatNumber value="${list[0].ml_price2}" pattern="###,###"/>원)</option>
                     <option value="${list[0].ml_price3}" id="ml_price3">
                        ${list[0].ml_id3}ml(+<fmt:formatNumber value="${list[0].ml_price3}" pattern="###,###"/>원)</option>
                  </c:if>   
               </select>
            </td>
            </tr>
            <tr>
               <td colspan="2">
               <hr />
               </td>
            </tr>
            <tr>
               <td colspan="2" align="right">
                  <strong>총 구매가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="total">${list[0].pd_cost}</span>원</strong> 
                  <hr />
               </td>
            </tr>
            <!-- 상품정보 종료 -->
            <tr>
               <td colspan="2" align="center">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" class="btn btnLeft ba_bt" pd="${list[0].pd_id}" pn="${list[0].pd_name}" value="CART" onclick="cartBuy();">
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
         </table>
      </div>
      </form>
   </td>
   </tr>
   </table>
       <!-- 모달창 영역 시작 -->
    <div id="cartmodal" class="searchModal">
      <div class="search-modal-content">
      <div class="row" width="200">
         <div class="col-sm-12" style="width:100px;" >
            <div class="row" style="display:block;">
               <div class="col-sm-12" style=" width:50%;">
                  <div style="width:250px;">
                     <img src="../../resources/img/${list[0].big_name}/${list[0].br_name}/${list[0].pd_img1}" 
                     width="233" style="padding-left:20px; padding-top:20px; border-radius:35px;">
                  </div>         
               </div>
               <div style=" width:300px; height:200px; margin-left:270px; margin-top:-220px;">
                  <table width="100%">
                     <tr>
                        <td style="font-family:'Times New Roman'; font-size:20px;">${list[0].pd_name}</td>
                     </tr>
                     <tr>
                        <td>cnt : <span id="infoCnt"></span></td>                     
                     </tr>
                     <tr>
                        <td>ml : <span id="infoml"></span></td>
                     </tr>
                     <tr>
                        <td>TotalPrice : <span id="TotalPrice"></span>won</td>                           
                     </tr>
                  </table>
               </div>
            </div>
         </div>
      </div><br>
          <div class="modalClose" onClick="closeModal()">
            <span class="pop_bt modalCloseBtn" style="font-size: 15pt;">continue shopping</span>
         </div>
         <div class="modalMove" onClick="location.href='../../ba_list'">
            <span class="pop_bt modalCloseBtn" style="font-size: 15pt;">go cart</span>
         </div>      
      </div>
   </div>   
</div>
   <!-- 모달창 영역 종료 -->
<!-- 해당상품과 조건이 떨어지는 연관상품 보기 영역 시작 -->
   <br><br><br>
   <h1 align="center" style="font-family:'Times New Roman';">related products</h1>
   <div class="related_products">
      <!-- 1번째 상품 -->
      <c:forEach var="i" items="${relatedList}">
          <div class="related_img">
             <img src="../../resources/img/${i.big_name}/${i.br_name}/${i.pd_img1}" alt=""
                 onclick='location.href="<c:url value = '/product/'/>list/view?cata=${i.big_name}&cataSmall=${i.br_name}&pdID=${i.pd_name}&season=${i.season}&weather=${i.weather}&sunmoon=${i.sunmoon}";' style="cursor:pointer;">
                  <div class="text">
                     <h2>${i.pd_name}</h2>
                      <p><fmt:formatNumber value="${i.pd_cost}" pattern="###,###" /><span>원</span></p>
                  </div>
          </div>
       </c:forEach>
   </div>
   <!-- 연관상품 영역 종료 -->
   <br /><br /><br />
   <!-- 탭 메뉴 영역 시작 -->
   <div class="d_tabMenu" id="pdtDetailInfo">   
   <ol>
      <li><a href="#pdtDetailInfo" class="scroll">INTRO</a></li>
      <li><a href="#deliveryGuide" class="scroll">GUIDE</a></li>
      <li><a href="#reviewPdt" class="scroll">REVIEW</a></li>
   </ol>
   </div>
   <!-- 탭 메뉴 영역 종료 -->

   <br /><br /><br>
   <h4 align="center" style="font-size:40px;">Intro</h4>
   <!-- 상품상세정보 설명이미지 시작 -->
      <div style="width:1080px; margin-left:20%;">
         <img src="../../resources/img/${list[0].big_name}/${list[0].br_name}/${list[0].desc_img}" alt="설명이미지" />
      </div>   
   <!-- 상품상세정보 설명이미지 종료 -->
   
   <!-- 탭 메뉴 영역 시작 -->
   <div class="d_tabMenu" id="deliveryGuide">
   <ol>
      <li><a hre
      f="#pdtDetailInfo" class="scroll">INTRO</a></li>
      <li><a href="#deliveryGuide" class="scroll">GUIDE</a></li>
      <li><a href="#reviewPdt" class="scroll">REVIEW</a></li>
   </ol>
   </div>
   <!-- 탭 메뉴 영역 종료 -->
   <br /><br />
   <h4 align="center" style="font-size:40px;">Guide</h4>
   <!-- 배송안내 시작 -->
   <div id="d_deliveryGuide">
   <table width="800" height="250">
      <tr>
         <th width="15%" height="80" valign="top">
            - 주문 전 확인
         </th>
         <td width="*" valign="top">
         <ul>
            <li>단순 변심으로 이한 반품 및 교환, 수취거부, 3일 이상의 장기 부재, 전화번호 오류, 주소지 불분명, 
            출고 후 주소 변경 등으로 반송되는 경우는 1박스당 왕복 배송비가 부과되므로 주문 전 반드시 다시 한번 확인해 주세요!</li>
         </ul>
         </td>
      </tr>
      <tr>
         <th height="*" valign="top">
         - 배송안내
         </th>
         <td valign="top">
         <ul>
            <li>상품 출고 후 수령까지 평균 배송기간은 1-3일(휴일제외)입니다.</li>
            <li>재고량, 기상악화, 배송지 오기재, 연락불가 등 3-7일 정도 지연될 수 있습니다.</li>
            <li>재고부족, 입고지연 등으로 발송이 지연될 경우 고객님께 별도로 연락을 드리고 있습니다.</li>
            <li>주말 및 공휴일은 발송되지 않습니다.</li>
            <li>배송조회는 상품 발송 후 익일부터 송장번호로 조회 가능합니다.</li>
            <li>제주도/도서산간/기타 섬지역 등은 도선료가 추가 부과되며, 자동결제 또는 개별안내 드리고 있습니다.</li>
            <li>도선료는 박스당 5,000~10,000원 결제가 이뤄지며 미결제 시 임의 취소 또는 배송이 지연될 수 있습니다.</li>
         </ul>
         </td>
      </tr>
   </table>
   </div>
   <!-- 배송안내 종료 -->
   
   <br /><br /><br /><br />
   <!-- 탭 메뉴 영역 시작 -->
   <div class="d_tabMenu" id="reviewPdt">
   <ol>
      <li><a href="#pdtDetailInfo" class="scroll">INTRO</a></li>
      <li><a href="#deliveryGuide" class="scroll">GUIDE</a></li>
      <li><a href="#reviewPdt" class="scroll">REVIEW</a></li>
   </ol>
   </div>
   <!-- 탭 메뉴 영역 종료 -->
   <br /><br /><br/>
   <!-- 상품구매평 시작 -->
   
		<div id="callReveiw"></div>
		
		<br><br>
	    <!-- 검색폼(제목/내용) -->
	    <div id="div2">
	         <form id="pagingForm" method="get" action="list">
	           	<div style="display: flex; justify-content: center;">
					<input type="hidden" name="page" id="page" />
					<select class="selectBox" name="type" id="type">
						<option value="1">=전체=</option>
						<option value="2">포토후기</option>
						<option value="3">일반후기</option>
					</select>
					<input type="text" size="40" placeholder="검색어를 입력하세요." id="searchText" name="searchText" style="margin-left:16px;" value="${search.searchText}" />
					<div class="cur_po search_btt" id="callR" onclick="callReview(1)">검색</div>
				</div>
			</form>
	    </div><br><br><!-- /검색폼 -->
		    
		<div id="callPage"></div>
		
   <!-- 상품구매평 종료 -->   
   
<br /><br />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="../../resources/main_js/countdown.js"></script>
    <script src="../../resources/main_js/main_js.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</body>
</html>