<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/ordercss.css">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<script>
window.onload = function(){
	document.getElementById("address_kakao").addEventListener("click", function(){ //우편번호 클릭시 API 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("r_zip").value = data.zonecode; // 주소 넣기
				document.getElementById("r_add1").value = data.address; // 주소 넣기
				document.querySelector("input[name=r_add2]").focus(); //상세입력 포커싱
			}
		}).open();
	});
}
</script>

<script src="resources/js/order.js" defer></script>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

$(document).ready(function(){
	  var index = '<c:out value="${fn:length(order_ed)}" />'; 
	  var index2 = '<c:out value="${fn:length(order_ed)}" />'; 
	  /* var textSpanValue = document.getElementById('money_'+index).value;  */
	  /* var textSpanValue = $('#money_'+index).html();  */
	  var total = 0;
	  var totalma = 0;
	  
	/* 	for(var i = 0; i<index ; i++){
		total += '<c:out value="${order_ed[i].totalmoney}" />';
		alert(i);
		alert('<c:out value="${order_ed[i].totalmoney}" />');
		} */

	<c:forEach items="${order_ed}" var="i">
	totalma += ${i.savapoint};
	</c:forEach>
	$('#mileageoutput2').text(totalma);
	$('#mileageoutput3').val(totalma);
	
	

	<c:forEach items="${order_ed}" var="i">
		total += ${i.totalmoney};
	</c:forEach>
	 $('#product_price2').text(total);
	 $('#product_price3').val(total);
	/* alert(index); */
   	/* alert(index);
   	alert(textSpanValue);
   	alert('<c:out value="${order_ed[0].totalmoney}" />'); */
  /*  for(){
      sum += ($('#money_'+index).text());
   }

   */


	   
});
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
	<!-- onsubmit="return fromCheck();" -->
<form id="order" name="order" action="orderconfirmed"  method="post">
	<input type="hidden" name="po_id" id="po_id" value="${order_ed[0].po_id}">
    <section>
    <div class="marking">
        <span class="mark_shoppingbag">01 SHOPPINGBAG</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_order">02 ORDER</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_confirmed">03 ORDER CONFIRMED</span>
    </div>
    
    <div class="container">
        <div class="order">
            <div class="orderinfo">
                <div id="orderinfo">
                    <div id="orderinfo_content">
                        <span id="title">배송정보</span>
                        <span id="required"><span id="indicate">*</span>표시는 필수입력 항목</span>
                    </div>
                </div>
                <div id="order_content">

                    <table class="table_content">
                        <tr>
                            <th>수령인&nbsp;<span id="indicate">*</span></th>
                            <td><input type="text" class="r_name" id="r_name" name="r_name"></td>
                        </tr>
                        <tr>
                            <th>배송지&nbsp;<span id="indicate">*</span></th>
                            <td>
                                <input type="text" class="r_zip" id="r_zip" name="r_zip" placeholder=" 우편번호" readonly/>
                                
                            </td>
                            <td id="td1">
                                <input type="button" class="address_kakao" id="address_kakao" name="address_kakao" value="우편번호 검색">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" class="r_add1" id="r_add1" name="r_add1" placeholder=" 주소" readonly/></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" class="r_add2" placeholder=" 상세주소" name="r_add2" /></td>
                        </tr>
                        <tr>
                            <th>연락처1&nbsp;<span id="indicate">*</span></th>
                            <td><input type="tel" class="r_phone1" id="r_phone1" name="r_phone1"/></td>
                        </tr>
                        <tr>
                            <th>연락처2&nbsp;<span id="indicate2">*</span></th>
                            <td><input type="tel" class="r_phone2" id="r_phone2" name="r_phone2"/></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <select class="r_msg" name="r_msg">
                                    <option value="배송시 요청사항을 선택해 주세요.">배송시 요청사항을 선택해 주세요.</option>
                                    <option value="부재시 문앞에 놓아주세요.">부재시 문앞에 놓아주세요.</option>
                                    <option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
                                    <option value="부재시 전화 또는 문자 주세요.">부재시 전화 또는 문자 주세요.</option>
                                    <option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
                                    <option value="파손 위험상품입니다. 배송시 주의해주세요.">파손 위험상품입니다. 배송시 주의해주세요.</option>
                                    <option value="배송전에 연락주세요.">배송전에 연락주세요.</option>
                                    <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
              
        </div>
    </div>
    <div class="container2">    
            
        <div class="mileage">
            <div>
                <div id="mileageinfo">
                    <span id="title">마일리지</span>&nbsp;<span class="span_mg">보유 마일리지</span>
                    <span id="span_totalmg">${member_po.rmpoint}</span><span id="span_totalmg1">원</span>
                </div>
            </div>
            <table class="mileage_content">
                <tr>
                    <th>마일리지</th>
                    <td><input type="text" class="mileage_table" onkeyup='printName()'
                        id="mileage_table" name="po_use" placeholder="0"></td>
      <!--               <td><input type="button" class="mileagebt" name="meileagebt" value="모두 사용"></td> -->
                </tr>
            </table>
           
            <br><br><br><span id="order_notice" class="order_notice">결제 시 상호명은 <span id="order_notice1">#TEAM3</span>로 표기되니 참고 부탁드립니다.</span>
         </div>
    </div>
    </section>
    <section>
        <div class="section">
            <div class="product_info" >
                <span id="product_info"> 주문상품 정보 /</span>
            </div>
    	
            <div class="info_line"></div>
            <div class="product_0">
            	<div class="contents">
       			
       			<div class="product">
       			
			
    		<c:forEach var="row" items="${order_ed}" varStatus="i">
       				<!-- 여기서부터 반복 시작 -->
       				<div class="product_box">
                    	
                    		<input type="hidden" name="cart_id" value="${row.cart_id}">
                        	<img src="resources/img/${row.big_name}/${row.br_name}/${row.pd_img1}" name="pd_img1" class="order_img" alt="My Image">
                        	<input type="hidden" name="pd_img1" value="resources/img/${row.big_name}/${row.br_name}/${row.pd_img1}">                	
                        		<div>
                        			<br><p class="order_brand_name">${row.br_name}</p>
                        			<br><p class="order_product_name">${row.pd_name}</p>
                        			<input type="hidden" name="pd_id" value="${row.pd_id}">   
                        			<br><p class="order_option"><span class="oreder_option_1">300ml / ${row.amount}</span></p>
                        			<input type="hidden"  name="amount" value="${row.amount}">   
        <p class="order_amount">가격&nbsp;&nbsp;&nbsp;&nbsp;<span class="oreder_option_2" id="money_${i.index}">${row.totalmoney}</span> 원</p>
        							<p class="order_product_name" id="savapoint_${i.index}">적립 예정 금액 / ${row.savapoint}</p>
                        			<input type="hidden" name="money" class="ba_bt"  value="${row.money}" pd="money_${i.index}">
                         		</div>
                    </div>
                          
                    <!-- 여기까지 반복 -->
			
			 </c:forEach>
                </div>
                                  
                </div>                

            </div>
                <!-- 여기까지 반복 -->
            
    
            <div class="info_line2"></div>
            
            <div class="product_content">
                <span class="product_price1">총 상품 금액</span>
                <span class="product_price2" id="product_price2"></span>
                <span class="product_price3"> 원</span>
             <input type="hidden"  id="product_price3"/>   	
            </div>
            <div class="product_content">
                <span class="product_mileage">마일리지 사용</span>
                <span class="product_mileage2">- <span id="mileageoutput"></span>P</span>
            </div>
            <div class="product_content">
                <span class="product_discount">적립될 금액</span>
                <span class="product_discount2">+ <span id="mileageoutput2"></span>원</span>
                <input type="hidden" name="savapoint" id="mileageoutput3">
            </div>
    
            <div class="product_content">
                <span class="product_fee">배송비</span>
                <span class="product_fee2">+ <span></span>원</span>
            </div>
            <div class="product_content">
                <span class="product_total">총 결제금액</span>
                
                <input type="text" class="p_totalprice" id="p_totalprice" name="totalprice" readonly></input>
                <span class="product_total2" id="product_total2">원</span>
            </div>
    
            <div class="notice1">
                <span>개인정보 제 3자 제공사항에 대해 확인하였으며 결제에 동의합니다.</span>
            </div>

            <div class="wrap">
                <a href="#pop_info_1" class="notice2">개인정보 제 3자 제공동의 보기</a><br>
              
              
                <div id="pop_info_1" class="pop_wrap" style="display:none;">
                  <div class="pop_inner">
                    <div class="popup">
                    <h2 class="dsc">개인정보 제3자 제공 동의</h2><br>
                    <p>
                        (주)3조는 거래 당사자간의 원활한 의사소통 및 배송, 상담 등의 거래이행을 위해
                        최소한의 범위내에서 개인정보를 입점 업체 판매자 및 배송 업체에 아래와 같이 제공합니다.<br><br>
                        결제 진행 시 아래와 같은 내용에 동의하는 것으로 간주합니다.
                    </p>
                    <br>
                    <ul>
                        <li>개인정보를 제공 받는자 : 스테디 에브리웨어, 토마스모어, 나이키, 에스로우</li>
                    </ul>
                    <ul>
                        <li>제공되는 개인정보 항목</li>
                        <p id="p">- 구매자 정보: 성명, ID, 전화번호, 메일주소, 상품 구매정보</p>
                        <p id="p">- 수령자 정보: 성명, 전화번호, 배송지 주소</p>
                    </ul>
                    <ul>
                        <li>개인정보를 제공받는 자의 이용 목적 : 판매자와 구매자 간 원활한 거래의 진행, <br>고객 상담 및 불만처리, 
                            상품과 경품 배송을 위한 배송지 확인 및 배송처리
                        </li>
                    </ul>
                    <ul>
                        <li>개인정보를 제공받는 자의 정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.</li>
                    </ul>
                    <ul>
                        <li>동의 거부 시 불이익 : 동의를 거부할 수 있으며 개인정보 제공에 동의하지 않는 <br>경우 거래가 제한됩니다.</li>
                    </ul>
                    </div>
                    <button type="button" class="btn_close"><img id="exit" src="resources/image/exit.png"></button>
                  </div>
                </div>
              
            </div>
    
    
        </div>
    </section>

    <section>

        <div class="submit">
         <input type="button" class="submitbt" id="submitbt" name="submitbt" onclick="paybtn()" value="CHECK OUT">
        </div>
        
	</section>

    </form>
    
    <script>

    function paybtn(){
        
        var total = $('#p_totalprice').val();

    	let name = document.getElementById("r_name");
        let add = document.getElementById("r_zip");
        let add1 = document.getElementById("r_add1");
        let phone = document.getElementById("r_phone1");
        let point = document.getElementById("mileage_table");
        var rm_point = ${member_po.rmpoint};
        

        if(name.value == '') {
            alert('이름을 입력해주세요.');

            return false;
        }

        if(add.value == '' || add1.value == '') {
            alert('주소를 입력해주세요.');

            return false;
        }

        if(phone.value == '') {
            alert('전화번호를 입력해주세요.');

            return false;
        }


        if(point.value > rm_point){
			alert('주문 상품액보다 마일리지가 초과합니다!')
			 return false;
            }
		        
    	var order = $("#order").serialize();
    	
    	var IMP = window.IMP; // 생략가능
    	IMP.init('imp80318325');	//아임포트 관리자계정
    	//결제 시스템을 실행시키는 함수
      	IMP.request_pay({
          	pg: 'kakao',
            /*
            'kakao' - 카카오페이
            'payco' - 페이코
            'html5_inicis - 이니시스(웹표준)'
       		*/
       		
    		pay_method: 'card',
    		merchant_uid: 'merchant_' + new Date().getTime(),
    		
    		name: '${order_ed[0].pd_id}', //결제창에서 보일 이름
    		amount: total, //제품 가격
    		/* buyer_email: 'ysch0902@naver.com',
            buyer_name: '${po_id}',
            buyer_tel: '${phone}',
            buyer_add: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456', */
        
            /* m_redirect_url: 'https://www.yourdomain.com/payments/complete' */
                
    		}, function (rsp) {
    			console.log(rsp);
    			if (rsp.success) {
    				var msg = '결제가 완료되었습니다.';
    				msg += '고유ID : ' + rsp.imp_uid;
    				msg += '상점 거래ID : ' + rsp.merchant_uid;
    				msg += '결제 금액 : ' + rsp.paid_amount;
    				msg += '카드 승인번호 : ' + rsp.apply_num;
					
    				// 컨트롤러에 데이터를 전달하여 DB에 입력
                    // 결제내역을 사용자에게 보여주기 위해 필요
    			        
    			    	$.ajax({
    						url : "/Project_3jo/orderconfirmed",
    						type : "POST",
    						data : order,
    						dataType : "json",
    						success : function(result){
    							if(result == "y") {
    								alert(msg);
    								location.href = "/Project_3jo/orderconfirmed"; 
    							}else{
    								alert("디비입력실패");
    								return false;
    							}
    						},
    						error : function(a,b,c){}
    					});
                   		
    			} else {
    				var msg = '결제에 실패하였습니다.';
    				msg += '에러내용 : ' + rsp.error_msg;
    				alert(msg);
					location.href = "/Project_3jo/ba_list"
						return false;
    			}
    		alert(msg);
    		document.location.href="/Project_3jo/orderconfirmed";
    		});


        }
</script>
<script src="resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="resources/main_js/main_js.js"></script>
    
    </body>
    
</html>