<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="../resources/css/board.css" />
<script src="../resources/jq/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	goCallfaq('주문/결제');
	//페이지 새로고침 시에 무조건 주문/결제 faq 부터 보이도록
	
	//글자 수 제한
	$("#q_content").keyup(function(){
        var cmt =  $(this).val();   // 이벤트를 일으킨 컨트롤(this)의 value를 cmt에 저장
        if (cmt.length > 650) alert("650자 이내로 입력하세요.");
        // 입력한 글자가 200자가 넘으면 경고 메시지를 띄워줌

        cmt = cmt.substring(0, 650);      // 입력한 값들 중 650자 까지만 잘라옴
        $(this).val(cmt);   			 // 이벤트를 일으킨 컨트롤(this)의 value에 cmt를 넣음
        $("#output").text(cmt.length);  // 현재 글자 개수 출력
     });

});

$(document).ready(function() {
	//각 라디오 버튼을 Click하면 callfaq() 함수 실행
	$('input[name=list_cg]').on('click', callfaq);
});

//value 와 같은 list_cg 를 가진 faq 목록 불러오기. 성공하면 output()함수 실행
function callfaq() {
	var select_cg = $(this).val();
	goCallfaq(select_cg);
}
	
function goCallfaq(select_cg) {
	$.ajax({
		url: 'callfaq',
		type: 'GET',
		data: {'select_cg': select_cg},
		success: function(callFaq) {
			repeatcall(callFaq);
		},
		error: function(e) {
			alert(JSON.stringify(e));
		}
	});	
}

//목록 출력
function repeatcall(callFaq) {
	//서버로부터 받은 목록을 반복문으로 읽기
	var str = '<table class="tblist">';
	str += '<tr>';
	str += '<colgroup><col width="20%" /><col width="80%" /></colgroup>';
	str += '</tr>';
	//callFaq 는 FaqVO 타입의 객체 배열이다.
    $.each(callFaq, function(index, faqpost){
    	str += '<tr class="thtd deletebl">';
		str += '<td>' + faqpost.list_cg + '</td>';
		str += '<td class="thtd"><div class="container" id="que-'
				+ faqpost.faq_num
				+ '" onclick="openCloseAnswer(this.id)"><div class="deletebl question left-items"><span>Q.&nbsp;'
				+ faqpost.faq_title
				+ '</span></div><div><img id="img-'
				+ faqpost.faq_num
				+ '" src="../resources/image/down_arrow.png" style="width: 30px; height: 30px;" class="cur_po" fn="'
				+ faqpost.faq_num
				+ '"></div></div><div class="deletebl answer" id="ans-'
				+ faqpost.faq_num
				+ '"><br><br>&nbsp;&nbsp;A.&nbsp;'
				+ faqpost.faq_content
				+ '<br><br></div></td>' ;
		str += '</tr>';
    });
    str += '</table><div class="tb_bottom_line"></div>';
    
    //목록 출력 영역에 내용 삽입
    $('#callFaq').html(str);

}
//faq 목록 토글
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
    };
   	
}
	
//글쓰기폼 확인
function formCheck() {
	var q_title = document.getElementById('q_title');
	var q_content = document.getElementById('q_content');
	
	if (q_title.value.length < 5) {
		alert("제목을 입력하세요(5자 이상).");
		q_title.focus();
		q_title.select();
		return false;
	}
	if (q_title.value.length > 30) {
		alert("제목이 너무 깁니다(30자 제한).");
		q_title.focus();
		q_title.select();
		return false;
	}
	if (q_content.value.length < 5) {
		alert("내용을 입력하세요(5자 이상).");
		q_content.focus();
		q_content.select();
		return false;
	}
	
	return qnaFormSubmit(); //조건 모두 만족하면 submit 함수 호출
}

function qnaFormSubmit() {
	var form = document.getElementById('write');
	form.submit();
}

</script>

</head>
<body>

<div id="div1">
	<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
	<form id="write" action="write"  method="post" 
	enctype="multipart/form-data" onsubmit="return formCheck();">
	<br><br><br>
	
	<!--구매 후기 작성 폼-->
	<hr class="hrcss">
	    <div id="div_notice">
	        <br>
	        <div class="container">
		    	<h3 class="left-items"style="margin-left:3px;">1:1문의 작성&nbsp;&nbsp;</h3>
	            <p class="left-items" style="margin-top: 23px; margin-left:3px;">
					<input type="hidden" name="page" id="page" />
					<input type="radio" name="list_cg" value="주문/결제" checked>"주문/결제"
					<input type="radio" name="list_cg" value="배송">"배송"
					<input type="radio" name="list_cg" value="취소/환불/교환" >"취소/환불/교환"
					<input type="radio" name="list_cg" value="기타">"기타"
				</p>
			<p class="right-items"></p>
        	</div>
	    </div><br><hr class="hrcss"><br>
	    
	    <!-- faq 목록 일부 불러오기 -->
	    <div id="div_notice">
	    	<div class="container">
	    	<h3 class="left-items" style="font-family:Times New Roman;">잠깐! 문의 전, 연관 FAQ 를 확인해보세요</h3>
	    	</div>
	    		    	
	    	<!-- 목록 출력 영역 -->
			<div id="callFaq">
			</div>
			
			<br>
			<!-- faq 이동버튼 -->
			<div style="display: flex; justify-content: right;">
				<img src="../resources/image/click_cursor.png" style="width:40px; height:40px;">
				<div class="cur_po gofaq_btt" onclick="location.href='../faq/main'">FAQ 더 보러가기</div>
			</div><br>
			
	    </div>
	    <br><hr class="hrcss"><br>
	
		<!--1:1 문의 작성란-->
        <div class="notice_area">
            <table class="qna_write">
                <colgroup>
                    <col width="15%" />
                    <col width="2%" />
                    <col width="83%" />
                </colgroup>
                <tr>
                    <td style="text-align: center;">제목</td>
                    <td>&nbsp;</td>
                    <td><input name="q_title" id="q_title" style="width:100%;"></td>
                </tr>
                <tr>
                    <td style="text-align: center;">내용<br>(<span id="output">0</span>/ 650)</td>
                    <td>&nbsp;</td>
                    <td><textarea name="q_content" id="q_content" style="width:100%; height: 300px; resize:none;"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2"></td>
                    <td><input type="file" name="upload"></td>
                </tr>
            </table>
        </div><br>    
        

        <br><hr class="hrcss"><br>

        <!--등록/취소 버튼-->
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                	<div style="display: flex; justify-content: center;">
		                <div class="cur_po search_btt" style="margin-right:4px; padding-bottom: 6px;" onclick="formCheck()">등록</div>
						<div class="cur_po search_btt" style="padding-bottom: 6px;" onclick="location.href='../qna/main'">취소</div>
					</div>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br>
        <br>
	
	</form>
</div><br><br><br><br>


<script src="../resources/main_js/countdown.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="../resources/main_js/main_js.js"></script>
</body>
</html>