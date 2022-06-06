<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>KITA sign</title>
	<link rel="stylesheet" type="text/css" href="resources/css/new_login.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<script type="text/javascript">
function fn_idChk(){
	$.ajax({
		url : "idChk",
		type : "post",
		dataType : "text",
		data : {"po_id" : $("#po_id").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

</script>

<script type="text/javascript">
function fn_emailChk(){
	$.ajax({
		url : "emailchk",
		type : "post",
		dataType : "text",
		data : {"email" : $("#email").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 이메일입니다.");
			}else if(data == 0){
				$("#emailChk").attr("value", "Y");
				alert("사용가능한 이메일입니다.");
			}
		}
	})
}

</script>




<div class="container" id="container">


<div class="form-container sign-up-container">


<form action="join" method="post" onsubmit="return formCheckjoin()">
	<div style="overflow:scroll; width:400px; height:1000px;">
	

	<div class="social-container">
		
		<!--나중에 시간있을때 아이콘 버전 업데이트하기 -->
	</div>
	<input type="text" name="po_id" id="po_id" placeholder="id 입력란">
	<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
	<input type="password" name="password" id="password" placeholder="Password">
	<input type="password" id="password2" placeholder="비밀번호 재입력">
	<input type="text" name="name" id="name" placeholder="이름입력(필수)">
	<table>
	
    <tr>
    <td><input type="date" name="birth" id="birth"></td>
    </tr>
    <tr>
	<td><input type="text" name="phone" id="phone" placeholder="폰번호"></td>
    </tr>
    <tr>
      <td><input type="text" name="email" id="email" placeholder="perfume@gmail.com">
      <button class="idChk" type="button" id="emailChk" onclick="fn_emailChk();" value="N">중복확인</button>
      </td>
    </tr>
	<tr>
	<td>
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="sample6_postcode" name="address" placeholder="우편번호">
	<input type="text" id="sample6_address" name="address2" placeholder="주소"><br>
	<input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소">
	<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
    </td>
    <tr>
    <td><input type="radio" name="gender" id="gender" value="woman">여자
    	<input type="radio" name="gender" id="gender" value="man" >남자
    </tr>
	</table>
	
	<input type="submit"  value="회원가입">
	
	</div>
	
</form>

</div>
<div class="form-container sign-in-container">
	<form id="loginForm" action="login" method="post" >
		<h1>샤르망 로그인</h1>
		<div class="social-container">
	</div>
	<span>샤르망은 최선을 다합니다...</span>

	<input type="text" name="po_id"id="po_id" placeholder="ID입력란">
	<input type="password" name="password" id="password" placeholder="비밀번호 입력란">
	<div class="errorMsg" style="color:red">
			${errorMsg}
		</div>
	<a href="findpw">비밀번호 찾기</a>	<a href="findid">아이디 찾기</a>

	<input type="submit" value="Login">
	</form>
</div>
<div class="overlay-container">
	<div class="overlay">
		<div class="overlay-panel overlay-left">
			<h1>회원가입 폼 입니다.</h1>
			<p>Vanitas vanitatum omnia vanitas.</p>
			<button class="ghost" id="signIn">로그인으로</button>
		</div>
		<div class="overlay-panel overlay-right">
			<h1>샤르망은 최선을 다합니다...</h1>
			<p>언제나 만족하는 향수를 추천, 판매 해드립니다.</p>
			<button class="ghost" id="signUp">회원가입으로</button>
		</div>
	</div>
</div>
</div>

<script>
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});
	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




<script type="text/javascript">
function formCheckjoin() {
	var po_id = document.getElementById('po_id');
	var password = document.getElementById('password');
	var password2 = document.getElementById('password2');
	var name = document.getElementById('name');
	var email = document.getElementById('email');
	var confrimMsg = document.getElementById('confirmMsg');
	var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
	var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	
	if (po_id.value.length < 3 || po_id.value.length > 10) {
		alert("ID는 3~10자로 입력하세요.");
		po_id.focus();
		po_id.select();
		return false;
	}
	if (password.value.length < 3 || password.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		password.focus();
		password.select();
		return false;
	}
	if (password.value != password2.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		password2.focus();
		password2.select();
		return false;
	}
	if (name.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	if (email.value == '') {
		alert("이메일을 입력하세요.");
		email.focus();
		email.select();
		return false;
	}
	var idChkVal = $("#idChk").val();
	if(idChkVal == "N"){
		alert("중복확인 버튼을 눌러주세요.");
		return false;
	}else if(idChkVal == "Y"){
		alert("회원가입이 완료되었습니다 즐거운 쇼핑되세요!");
		return true;
	}
	
}

</script>

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
</script>




</body>
</html>








