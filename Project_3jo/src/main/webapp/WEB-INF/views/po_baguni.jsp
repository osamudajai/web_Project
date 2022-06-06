<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8"> <!-- 추가할부분 --> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 추가할부분 --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">
    <script src="resources/main_js/main_js.js"></script>
	<script src="resources/js/jquery-3.6.0.js"></script>
	
<title>상품장바구니 목록</title>
<style type = "text/css">
	body.sijunBody {
	background-color: #f5f5f0;
	font-size: 13pt;
	min-width: 1480px;
	width: 100%;
	padding: 50px0 ;
	}
	
	#frame {
	width: 80%;
	margin: 0 auto ;
	padding: 50px 50px;
	background-color: #fff;
	}
	
	#frame2{
	border-bottom: solid 1px #e0e0eb;
	padding-bottom: 10px;
	
	}
	
	.ba_home{
	flast : right;
	}
	
	table.calculation1{
	clear: both;
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt;
	}
	
	table.calculation1 th{
	border: solid 1px #e0e0eb;
	padding: 10px 0;
	}
	
	table.calculation1 td{
	border: solid 1px #e0e0eb;
	text-align: center;
	}
	
	table.calculation2 {
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt; 
	}
	
	table.calculation2 th {
	border: solid 1px #e0e0eb;
	}
	
	table.calculation2 td{
	border: solid 1px #e0e0eb;
	text-align: center;
	}
	
	.price{
	font-size: 20pt;
	font-weight: bold;
	}
	
	.lifont{
	font-size: 10pt;
	color: gray;
	}
	
	.btn{
	border: none;
	color: white;
	padding: 5px 10px;
	font-size: 13px;
	cursor: pointer;
	border-radius: 5px; 
	}
	
	.default{
	background-color: #fff;
	border: solid 1px gray;
	color: black;
	}
	
	.default:hover {
	background: #ddd;
	}
	
	.backbtn{
	background: #fff;
	border: solid 1px gray;
	}
	
	
	.btnfloat{
	float: left;
	}
	
	.btnfloat2{
	float: right;
	}
	
	.clearboth{
	clear: both;
	}
	
	.footerbtn{
	float: right;
	font-weight: bolder;
	font-size:12pt;
	border-radius: 3px;  
	}
	
	#allProduct, #productClear, #footerbtn{
	padding: 11px 25px;
	}
	
	#allProduct{
	margin-left: 140px;
	background-color: #264d73;
	color: #fff;
	font-weight: bold;
	font-size: 12pt;
	}
	
	#productClear{
	background-color: gray;
	color: #fff;
	font-weight: bold;
	font-size: 12pt;
	}
	
	.aa:hover{
	cursor: pointer;
	}
	
	.bott {
    display: inline-block;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    text-shadow: 0 1px 1px rgba(0,0,0,.3);
    -webkit-border-radius: .5em; 
    -moz-border-radius: .5em;
    border-radius: .5em;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.bott:hover {
    text-decoration: none;
}
.bott:active {
    position: relative;
    top: 1px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	 // 리스트 페이지로 이동
    $("#btnList").click(function(){
        location.href="/";
    });

    $("#btnDelete").click(function(){
        if(confirm("장바구니를 비우시겠습니까?")){
            location.href="delete_all";
        }
    });

    
    $('.ba_bt').on('click', call1);

});

function call1() {
	var cart_id = $(this).attr('ca');
	var amount = document.getElementById('amount_'+cart_id).value; 
	var pd_id = $(this).attr('pd');
	 /* alert(cart_id);
	alert(amount);
	alert(pd_id); 
	 */
$.ajax({
	url: 'ba_update', //컨트롤러의 함수값
	type: 'post',  //타입
	dataType: 'text', // 물어보기
	data:{pd_id : pd_id, amount : amount, cart_id : cart_id},
	success: function (){
			alert('값이 수정되었습니다!')
	},
	error:function(){
		
	},
});	
}
function f5(){
	location.reload()
}



function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="q_nums"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="q_nums"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

//전체 체크박스
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('q_nums');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

/* function orderCheck(){
	var form = document.getElementById('form1');
	const checkboxes 
    = document.getElementsByName('q_nums');

	if('q_nums'== null){
	alert('장바구니 체크후 이용해주세요!')
	return false;
		}
	if(confirm("체크한 상품 결제 진행하시겠습니까?")== true){
	form.submit();
		}
	else{
	return false;
	}
}
 */	
function goOrder(){
	//1. 장바구니에 담긴 상품이 없는 경우
	var form = document.getElementById('form1');
	var chk=$('input[name="q_nums"]');
	if(chk.length==0){	
		return;
	}
	//2. 담긴 상품이 있다면 체크박스 갯수 만큼 반복문 돌면서 체크한 상품과 체크 안된 상품을 구분하여, 체크 안된 상품의 주문 수량은 서버쪽에 적송되지 않도록 disabled 처리한다.
	var cnt =0;
	$.each(chk,function(i,ch){
		if($(ch).is(":checked")){
			cnt++;
			$('#check'+(i+1)).prop('disabled',false);//비활성화
		}else{
			//체크 안된 상품의 주문 수량 비활성화 
			$('#check'+(i+1)).prop('disabled',true);//비활성화
		}
	});

	if(cnt==0){
		alert('주문할 상품을 체크하세요');
		$('input[name="q_nums"]').prop('disabled',false);//비활성화
		return;	
	}
	form.submit();
}


</script>
</head>


<body class="sijunBody">

<div class="header_container sticky-header">
	<div class="container-fluid">
	<div class="row align-items-center">
	    <jsp:include page="header/header.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
	</div>
	</div>
	</div>

	
	<div id="frame2">
	
	</div>
	<br/>

    <span style="font-size: 16pt; font-weight: bold;">${po_id}님의 장바구니</span>
    <span></span>
    
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
            <a href="product/list?cata=woman&cataSmall=chanel"><button type="button" id="">상품목록으로 이동하기</button></a>
        </c:when>
        <c:otherwise>
        
        <form name="form1" id="form1" method="post" action="order">
        
            <table class="calculation1">
            
            <thead>
            
                <tr>
                <th><span>카트번호
                 선택<input type="checkbox" name="selectall" value="selectall" onclick="selectAll(this)">
                </span>
                </th>
	    		<th><span>상품명</span></th>
	    		<th style="width: 300px;"><span></span></th>
	    		<th>수량</th>
	    		<th>상품 값 합계</th>
	    		<th>배송구분</th>
	    		<th>삭제</th>
	    		</tr>
	    	</thead>
	    	
	    	 <tbody>
                <c:forEach var="row" items="${map.list}" varStatus="i">
                <tr style="height: 90px; background-color:#fff ">
                	<td>
    				<label>
					<input type="checkbox" name="q_nums" id="check" value="${row.cart_id}" onclick="checkSelectAll()">
					</label>
					</td>
	               
                    <td style="text-align: left; text-align: center; border-right: none;">
                        ${row.pd_name}
                    </td>
                    <td style="border-left: none; border-right: none;"><img style="width: 80%;" src="">
                   
                    <fmt:formatNumber pattern="###,###,###" value="${row.money}" />
                   
                    </td>
                    <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
                    
                        <input type="number" style="width: 40px" name="amount" id="amount_${row.cart_id}" value="${row.amount}" min="1">
                        <input type="button" class="ba_bt" value="수정" ca="${row.cart_id}" pd="${row.pd_id}"><!-- 이놈을 이벤트 처리해서 ajax  -->
                        <input type="hidden" name="cart_id" value="${row.cart_id}">
                        
                    </td>
                    
                    <td>
                    <div id="btn_f5" onclick="f5()" style="padding-left: 10px;">
                        <fmt:formatNumber pattern="###,###,###" value="${row.totalmoney}"/>	
                     </div>    
                    </td>
                    
				    <td>기본 배송</td>
                    <td>
                        <a href="ba_delete?cart_id=${row.cart_id}">삭제</a>
                    </td>
                   </tr> 
                </c:forEach>
                <tr>
                    <td colspan="10" align="center">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.totalPrice}"/><br>
                    </td>
                </tr>
            </tbody>	    
            </table>	
             	 
            <input type="hidden" name="count" value="${map.count}">
            <div style="text-align: center;">
             <a href="product/list?cata=woman&cataSmall=chanel" style="color: black;"><button type="button" class="bott" id="ba_list">상품목록으로 이동하기</button></a>
   			<button type="button" class="bott" id="btnDelete">장바구니 비우기</button>
   			<button type="button" class="bott" id="go_order" onclick="goOrder()">상품결제 페이지로 이동</button>
 
   			</div>
        </form>
        </c:otherwise>
    </c:choose>
   
   
   <br/><br/><br/><br/><br/><br/><br/><br/>
<jsp:include page="footer/footer.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>    
</body>
</html>