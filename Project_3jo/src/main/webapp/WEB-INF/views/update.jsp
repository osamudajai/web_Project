<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/update_form.css">
<title>업데이트폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/order.js" defer></script>
<script>
window.onload = function(){
   document.getElementById("address_kakao").addEventListener("click", function(){ //우편번호 클릭시 API 발생
      new daum.Postcode({
         oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("address").value = data.zonecode; // 주소 넣기
            document.getElementById("address2").value = data.address; // 주소 넣기
            document.querySelector("input[name=address3]").focus(); //상세입력 포커싱
         }
      }).open();
   });
}
</script>

<script>

function btn_submit(){

   

   $.ajax({
      url: "/Project_3jo/update",
      type: "POST",
      data: $("#update").serialize(),
      dataType: "text",
      success: function(){
         
         
         location.href = "/Project_3jo/update";
      
   }
});
   
}

function btn_confirm(){

   let password = document.getElementById('password');
    let password2 = document.getElementById('password2');
   let cur_pw = document.getElementById("cur_pw");

   if(cur_pw.value == '') {
      alert('현재 비밀번호를 입력해주세요.');
      return false;
   }

   if(cur_pw.value != ${member.password}) {
      alert('현재 비밀번호가 틀립니다.');
      return false;
   }

   if(password.value == '') {
      alert('신규 비밀번호를 입력해주세요.');
      return false;
   }

   if(password2.value == '') {
      alert('재입력 비밀번호를 입력해주세요.');
      return false;
   }

   if(password.value != password2.value) {
      alert('신규 비밀번호와 재입력 비밀번호가 같지 않습니다.');
      return false;
   }

   if(${member.password} == password.value) {
      alert('현재 비밀번호와 신규 비밀번호가 동일합니다.');
      return false;
   }

   confirm('비밀번호를 변경하시겠습니까?');

   

   $.ajax({
      url: "update_pw",
      type: "POST",
      data: $("#update2").serialize(),
      dataType: "text",
      success: function(){
         
         alert('비밀번호가 성공적으로 변경되었습니다.');
         location.href = "/Project_3jo/update";
      
   },
   error : function(er){
      alert(JSON.stringify(er))
      },
});
   
}
</script>



<script>
   function formCheck() {
   let address = document.getElementById('address');
   let address2 = document.getElementById('address2');
   let address3 = document.getElementById('address3');
   
   if(address.value != '' && address3.value == '') {
      alert('새 주소를 입력해주세요.');
      return false;
      }
   
   return true;
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

<section>
    <div class="marking">
        <span class="mark" style="background-color: white;" onclick="location.href='myPage'">MY PAGE</span>
    </div>
</section>    

<section>
   <div class="mypage_info">
      <br><br><br>
      <%-- <span class="mypage_name" id="mypage_name" onclick="location.href='myPage'" style="cursor:pointer">${po_id}</span><br><br> --%>
      <!-- <span class="mypage_herat">나의 하트</span><br><br>찜 기능 뺄 경우 장바구니로 대체  -->
      <span class="mypage_title" id="mypage_title_product">나의 쇼핑정보</span><br>
      <span class="mypage_content" id="product_check" onclick="location.href='order_inquiry'" style="cursor:pointer">주문한 상품 조회</span><br>
      <span class="mypage_content" id="product_review">상품 리뷰</span><br><br>
      <span class="mypage_title" id="mypage_title_account">나의 계정설정</span><br>
      <span class="mypage_content" id="account_edit" onclick="location.href='update'" style="cursor:pointer">회원 정보수정</span><br>
      <span class="mypage_content" id="my_mileage" onclick="location.href='point'" style="cursor:pointer">마일리지 현황</span><br><br>
      <span class="mypage_title" id="mypage_title_customer">고객센터</span><br>
      <span class="mypage_content" id="my_inquiry" onclick="location.href='qna/main'" style="cursor:pointer">1:1 문의내역</span><br>
      <span class="mypage_content" id="notice" onclick="location.href='notice/main'" style="cursor:pointer">공지사항</span><br>
      <span class="mypage_content" id="faq" onclick="location.href='faq/main'" style="cursor:pointer">FAQ</span><br><br>   
      <div>
         <input type="button" class="mypage_go_inquiry" name="mypage_go_inquiry " value="1:1 문의하러가기" onclick="location.href='qna/main'" 
          style="cursor:pointer">
      </div>
   </div>
</section>

<section class="main">
   <div class="my_info">
      <div class="my_recommend">
         <div class="recommend">#CHARMANT &nbsp;
            <div class="recommendation_perfume"><span id="recommendation_perfume1">${po_id}</span>
            <div class="recommendation_perfume2"><span id="recommendation_perfume2" onclick="location.href='perfume_teller'" style="cursor:pointer">
            향수 추천받으러 가기</span></div></div>
         </div>         
      </div>
      <div class="my_mileage">
         <div class="my_mileage1" onclick="location.href='point'" style="cursor:pointer">마일리지 &nbsp;></div>
         <div class="my_mileage2"><img src="resources/recommendation/find5.png" class="img1"></div>
      </div>
   </div>
   
   
   <div class="info_modify">
      <span id="info_modify">회원정보 수정</span>
   </div>
   <div class="line"></div>
   
   <div class="login_info">
      <span id="login_info">로그인 정보</span>
   </div>
   
   
   <div class="modify_pw">
      <br>
      <%-- <div id="modify_0"><span>이메일</span></div>
      <div id="modify_4"><input type="text" name="cur_email" id="cur_email" value="${member.email}" readonly></div> --%>
      <div id="modify_1"><span>아이디</span></div>
      <div id="modify_2"><input type="text" name="po_id" id="po_id" value="${po_id}" readonly></div>
      
      <form action="update" method="post"  name="update2" id="update2" onsubmit="return pwCheck()">
      <div id="modify_3"><span>비밀번호</span></div>
      <table>      
      <tr><!-- placeholder="현재 비밀번호를 입력하세요" -->
         <td><input type="text" class="cur_pw" name="cur_pw" id="cur_pw" placeholder="현재 비밀번호를 입력하세요"></td>
      </tr>
      <tr>
         <td><input type="text" class="password" name="password" id="password" placeholder="신규 비밀번호를 입력하세요"></td>
      </tr>
      <tr>
         <td><input type="text" class="password2" name="password2" id="password2" placeholder="신규 비밀번호를 한 번 더 확인하세요"></td>
      </tr>
      <tr>
         <td><input type="reset" class="reset" id="reset" name="reset" value="변경 취소"></td>
         <td><input type="button" class="confirm" id="confirm" name="confirm" value="확인" onclick="btn_confirm()"></td>
      </tr>
      
      </table>
      
      <input type="hidden" class="new_email" name="email" id="email" value="${member.email}">
      <input type="hidden" class="new_zip" name="address" id="address" value="${member.address}">
      <input type="hidden" class="new_add1" name="address2" id="address2" value="${member.address2}">
      <input type="hidden" class="new_add2" name="address3" id="address3" value="${member.address3}">
      </form>   
         
   </div>
   
   <div class="line2"></div>
   <div class="member_info">
      <span id="member_info">회원 정보</span>
   </div>
   
   <div class="modify_member_info">
      <div>
         <div class="member_name"><span id="member_name1">성명</span><span  id="member_name2">${member.name}</span></div>
         <div class="member_birth"><span id="member_birth1">생일</span><span id="member_birth2">${member.birth}</span></div>
         <div class="member_gender"><span id="member_gender1">성별</span><span id="member_gender2">${member.gender}</span></div>
         <%-- <div class="member_email_0"><span id="member_email1">이메일</span><span id="member_email2">${member.email}</span></div>
         <div class="member_address"><span id="member_address1">주소</span><span id="member_address2">
            ${member.address}&nbsp;&nbsp;&nbsp;${member.address2}&nbsp;&nbsp;&nbsp;${member.address3}</span></div> --%>
      </div>
   </div>
   
   <form  name="update" id="update" action="update" method="post" onsubmit="return formCheck();">
      <input type="hidden"  value="${member.password}">
      <input type="hidden"  value="${member.po_id}">
   <div class="modify_member_info2">
      <div class="member_email"><span>이메일</span></div>
      <input type="text" class="new_email" name="email" id="email" value="${member.email}">
   </div>
   
   <div class="modify_address"><span>주소정보</span></div>
      <table id="modify_address">
      <tr>
         <td id="td1"><input type="text" class="new_zip" name="address" id="address" value="${member.address}" readonly></td>
         <td id="td2"><input type="button" class="address_kakao" id="address_kakao" name="address_kakao" value="우편번호 검색"></td>
      </tr>
      <tr>
         <td><input type="text" class="new_add1" name="address2" id="address2" value="${member.address2}" readonly></td>
      </tr>
      <tr>
         <td><input type="text" class="new_add2" name="address3" id="address3" value="${member.address3}"></td>
      </tr>
      </table>
            <div class="wrap">
                <!-- <a href="#pop_info_1" class="notice2">저장하기</a><br> -->
                <input type="button" class="notice2" value="저장하기" href="#pop_info_1">
              
              
                <div id="pop_info_1" class="pop_wrap" style="display:none;">
                  <div class="pop_inner">
                    <div class="popup">
                    <input type="button" class="btn_submit" id="save" name="save" value="" onclick="btn_submit()">
                    <p>수정되었습니다.</p>
                    </div>
                  </div>
                </div>
              
            </div>
   </form>
   <div class="line2"><br></div>
   
   <div class="img1-1">
      <img src="resources/recommendation/logo1.png" onclick="location.href='myPage'" style="cursor:pointer" class="img1-2">
   </div>
</section>

</body>
</html>