<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>설문조사 페이지</title>
		<link rel="stylesheet" href="resources/css/recommendationform.css" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">
	</head>
	<body>
	
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
	
	<form id="paffem" name="paffem" method="post" action="paffem">
	
<section class="main">
	
	<div class="sequence1"><span id="sequence1">#01</span></div>
	<div class="q1_title">
		<span>떠올리는 것만으로도 행복하거나 편안해지는 향기를 골라주세요.</span>
	</div>
	<div class="q1_content">
	<label class="radiobt1" for="Scent1">
    	<input type="radio" name="Scent" id="Scent1" value="Cedar">
    	<img src="resources/recommendation/grass.png">
    		<div class="q1_box">
    		<span class="instruction1">기분을 전환시키는</span><br>
    		<span class="instruction2">풀, 나무 향기</span>
    		</div>
	</label>
 
	<label class="radiobt1" for="Scent2">
    	<input type="radio" name="Scent" id="Scent2" value="Jasmine">
    	<img src="resources/recommendation/flower.png">
    		<div class="q1_box">
    		<span class="instruction1">마음을 설레게 하는</span><br>
    		<span class="instruction2">꽃 향기</span>
    		</div>
	</label>
 
	<label class="radiobt1" for="Scent3">
    	<input type="radio" name="Scent" id="Scent3" value="Bergamot">
    	<img src="resources/recommendation/macaron.png">
    		<div class="q1_box">
    		<span class="instruction1">주변 공기를 부드럽게</span><br>
    		<span class="instruction2">달콤한 향기</span>
    		</div>
	</label>
	
	<label class="radiobt1" for="Scent4">
    	<input type="radio" name="Scent" id="Scent4" value="Patchouli">
    	<img src="resources/recommendation/city.png">
    		<div class="q1_box">
    		<span class="instruction1">차분하고 성숙한</span><br>
    		<span class="instruction2">도시의 향기</span>
    		</div>
	</label>
	</div>
	
	
	
	<div class="sequence2"><span id="sequence2">#02</span></div>
	<div class="q2_title">
		<span>좋아하는 향기에 더 가까운 이미지를 골라주세요.</span>
	</div>
	<div class="q2_content">
	
	<table class="q2_table">
		<tr class="tr1">
			<td class="td1">
				<label class="radiobt2" for="sunmoon21">
    					<input type="radio" name="sunmoon2"  id="sunmoon21" value="nat">
    					<img src="resources/recommendation/day.png">
    						<div class="q2_box">
    						<!-- <span class="instruction1">기분을 전환시키는</span><br> -->
    						<span class="instruction2">바쁘게 움직이는 도시의 한낮</span>
    						</div>
				</label>
 			</td>
 			</tr>
 		
 		<tr class="tr2">
			<td class="td2">
				<br>
				<label class="radiobt2" for="sunmoon22">
    				<input type="radio" name="sunmoon2" id="sunmoon22" value="bam">
    				<img src="resources/recommendation/night.png">
    					<div class="q2_box">
    					<!-- <span class="instruction1">마음을 설레게 하는</span><br> -->
    					<span class="instruction2">깊고 어두운 도시의 밤</span>
    					</div>
				</label>
			</td>
 		</tr>
	</table>
	
	</div>
	
	
	
	<div class="sequence3"><span id="sequence3">#03</span></div>
	<div class="q3_title">
		<span>좋아하는 분위기의 연예인을 골라주세요.</span>
	</div>
	<div class="q3_content">
	
	<table class="q3_table">
		<tr class="tr1">
			<td class="td1">
				<label class="radiobt3">
    					<input type="radio" name="weather" value="sunny">
    					<span class="q3_instruction2">산뜻한 아이린</span>					
				</label>
 			</td>
 		</tr>
 		
 		<tr class="tr2">
			<td class="td2">
				<br>
				<label class="radiobt3">
    				<input type="radio" name="weather" value="cloudy">
    					<span class="q3_instruction2">샤프한 현빈</span>
				</label>
			</td>
 		</tr>
 		
 		<tr class="tr3">
			<td class="td3">
				<br>
				<label class="radiobt3">
    				<input type="radio" name="weather" value="rainy">
    					<span class="q3_instruction2">우아한 오드리헵번</span>
				</label>
			</td>
 		</tr>
 		
 		<tr class="tr4">
			<td class="td4">
				<br>
				<label class="radiobt3">
    				<input type="radio" name="weather" value="snowiy">
    					<span class="q3_instruction2">차분한 한효주</span>
				</label>
			</td>
 		</tr>
	</table>
	
	</div>
	
	
	
	<div class="sequence4"><span id="sequence4">#04</span></div>
	<div class="q4_title">
		<span>좋아하는 느낌의 향기가 있다면 골라주세요.</span>
	</div>
	<div class="q4_content">
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="water">
    	<img src="resources/recommendation/water.png">
    		<div class="q4_box">
    		<span class="instruction1">강, 바다, 수영장의</span><br>
    		<span class="instruction2">물내음</span>
    		</div>
	</label>
 
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="fruit">
    	<img src="resources/recommendation/fruit.png">
    		<div class="q4_box">
    		<span class="instruction1">달달한</span><br>
    		<span class="instruction2">과일 한아름</span>
    		</div>
	</label>
 
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="cinnamon">
    	<img src="resources/recommendation/cinnamon.png">
    		<div class="q4_box">
    		<span class="instruction1">코 끝을 톡 건드리는</span><br>
    		<span class="instruction2">시나몬</span>
    		</div>
	</label>
	<br><br>
	
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="vanila">
    	<img src="resources/recommendation/vanilla.png">
    		<div class="q4_box">
    		<span class="instruction1">달짝지근한</span><br>
    		<span class="instruction2">바닐라</span>
    		</div>
	</label>
	
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="powder">
    	<img src="resources/recommendation/powder.png">
    		<div class="q4_box">
    		<span class="instruction1">보송보송한</span><br>
    		<span class="instruction2">파우더</span>
    		</div>
	</label>
	
	<label class="radiobt4">
    	<input type="radio" name="pd_image" value="thick">
    	<img src="resources/recommendation/heart.png">
    		<div class="q4_box">
    		<span class="instruction1">진득한</span><br>
    		<span class="instruction2">아카시아</span>
    		</div>
	</label>
	</div>
	
	
	
	<div class="sequence5"><span id="sequence5">#05</span></div>
	<div class="q5_title">
		<span>향수를 사용하기에 선호하는 계절을 알려주세요.</span>
	</div>
	<div class="q5_content">
	<label class="radiobt5">
    	<input type="radio" name="season" value="spring">
    	<img src="resources/recommendation/spring.png">
    		<div class="q5_box">
    		<span class="instruction2">봄</span>
    		</div>
	</label>
 
	<label class="radiobt5">
    	<input type="radio" name="season" value="summer">
    	<img src="resources/recommendation/summer.png">
    		<div class="q5_box">
    		<span class="instruction2">여름</span>
    		</div>
	</label>
 
	<label class="radiobt5">
    	<input type="radio" name="season" value="full">
    	<img src="resources/recommendation/fall.png">
    		<div class="q5_box">
    		<span class="instruction2">가을</span>
    		</div>
	</label>
	
	<label class="radiobt5">
    	<input type="radio" name="season" value="winter">
    	<img src="resources/recommendation/winter.png">
    		<div class="q5_box">
    		<span class="instruction2">겨울</span>
    		</div>
	</label>
	</div>
	
	
	
	<div class="sequence6"><span id="sequence6">#06</span></div>
	<div class="q6_title">
		<span>향수를 사용할 시간을 알려주세요.</span>
	</div>
	<div class="q6_content">
	
	<table class="q6_table">
		<tr class="tr1">
			<td class="td1">
				<label class="radiobt6">
    					<input type="radio" name="sunmoon" value="sun">
    					<img src="resources/recommendation/noon.png">
    						<div class="q6_box">
    						<!-- <span class="instruction1">기분을 전환시키는</span><br> -->
    						<span class="instruction2">낮</span>
    						</div>
				</label>
 			</td>
 			</tr>
 		
 		<tr class="tr2">
			<td class="td2">
				<br>
				<label class="radiobt6">
    				<input type="radio" name="sunmoon" value="moon">
    				<img src="resources/recommendation/evening.png">
    					<div class="q6_box">
    					<!-- <span class="instruction1">마음을 설레게 하는</span><br> -->
    					<span class="instruction2">밤</span>
    					</div>
				</label>
			</td>
 		</tr>
	</table>
	
	</div>
	
	
	
	<div class="sequence7"><span id="sequence7">#07</span></div>
	<div class="q7_title">
		<span>다왔어요 성별과 연령을 알려주세요</span>
	</div>
	<div class="q7_content">
	
	<div class=user_info7>
		<span>성별</span>
	</div>
	<table class="q7_table">
		<tr class="tr125">
			<td class="td1">
				<label class="radiobt7">
    					<input type="radio" name="gender" id="q7" value="man">
    					<span class="q7_instruction2">남자</span>					
				</label>
 			</td>
 			<td class="td2">
				<label class="radiobt7">
    				<input type="radio" name="gender" value="woman">
    					<span class="q7_instruction2">여자</span>
				</label>
			</td>
			<td class="td3">
				<label class="radiobt7">
    				<input type="radio" name="gender" value="unisex">
    					<span class="q7_instruction2">상관없음</span>
				</label>
			</td>
 		</tr>
 	</table>
 	
 	
 	<div class=user_info8>
		<span>연령</span>
	</div>
 	<table class="q8_table">
 		<tr class="tr3">
			<td class="td3">
				<label class="radiobt8">
    				<input type="radio" name="age_birth" value="ten">
    					<span class="q8_instruction2">10대</span>
				</label>
			</td>
			<td class="td4">
				<label class="radiobt8">
    				<input type="radio" name="age_birth" value="2ten">
    					<span class="q8_instruction2">20대</span>
				</label>
			</td>
 		</tr>
 		
 		<tr class="tr3">
			<td class="td3">
				<label class="radiobt8">
    				<input type="radio" name="age_birth" value="3ten">
    					<span class="q8_instruction2">30대</span>
				</label>
			</td>
			<td class="td4">
				<label class="radiobt8">
    				<input type="radio" name="age_birth" value="4over">
    					<span class="q8_instruction2">40대 이상</span>
				</label>
			</td>
 		</tr>
 		
 		
	</table>
	
	</div>
	
	<div class="button">
		<input type="button" class="reset" id="reset" name="reset" value="변경 취소">
		<input type="submit" class="confirm" id="confirm" name="confirm" value="확인">
	</div>
</section>
	</form>
	  <br/><br/><br/><br/><br/><br/><br/><br/>
	 <jsp:include page="footer/footer.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
</body>
</html>
