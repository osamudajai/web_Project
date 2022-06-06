<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 폼</title>
<style>
th{background-color:lightgray;}
</style>
</head>
<body>
<form name="frmPdt" action="register" method="post">
	<input type="hidden" name="wtype" value="in" />	
	<table width="1500" cellpadding="2" >
		<tr>
			<th>대분류</th>
				<td>
					<input type="text" id="big_id" name="big_id">
				</td>
			<th>대분류명</th>
				<td>
					<select name="big_name" id="big_name">
						<option value="man">man</option>
						<option value="woman">woman</option>
						<option value="unisex">unisex</option>
						<option value="etc">etc</option>
					</select>
				</td>
			<th>대분류설명</th>
				<td><textarea rows="2" cols="18" name="big_desc"></textarea></td>
		</tr>
		<tr>
			<th>브랜드</th>
				<td>
					<input type="text" id="br_id" name="br_id">
				</td>
			<th>브랜드명</th>
				<td>
					<select name="br_name" id="br_name">
						<option value="bastill">bastill</option>
						<option value="killian">killian</option>
						<!-- ETC소분류 종료 -->
						<option value="GorzioArmany">GorzioArmany</option>
						<option value="eisenberg">eisenberg</option>
						<option value="perfumeMarly">perfumeMarly</option>
						<option value="tomFord">tomFord</option>
						<option value="Johnvarvatos">Johnvarvatos</option>
						<!-- MaN소분류 종료 -->
						<option value="burbery">burbery</option>
						<option value="diptyque">diptyque</option>
						<option value="jomarone">jomarone</option>
						<option value="prada">prada</option>
						<option value="roxitang">roxitang</option>
						<!-- UNISEX소분류 중료 -->
						<option value="chanel">chanel</option>
						<option value="chloe">chloe</option>
						<option value="dior">dior</option>
						<option value="hermes">hermes</option>
						<option value="karbain">karbain</option>
						<!-- forEach문으로 option -->
					</select>
				</td>
			<th>브랜드설명</th>
				<td><textarea rows="2" cols="18" name="br_desc"></textarea></td>
			<th>브랜드 이미지</th>
				<td><input type="file" name="br_img"></td>
			<th>대분류 이미지</th>
				<td><input type="file" name="big_img"></td>	
		</tr>
		<tr>
			<th>상품ID</th>
				<td><input type="text" id="pd_id" name="pd_id"></td>
		</tr>
		<tr>
			<th>상품명</th>
				<td><input type="text" name="pd_name"/></td>
			<th>상품이미지1</th>
				<td><input type="file" id="pd_img1" name="pd_img1"/></td>
			<th>상품이미지2</th>
				<td><input type="file" id="pd_img2" name="pd_img2"/></td>
			<th>설명이미지</th>
				<td><input type="file" id="desc_img" name="desc_img"/></td>
		</tr>
		<tr>
			<th>재고량</th>
				<td><input type="text" id="pd_stock" name="pd_stock"/></td>
		</tr>
		<tr>
			<th>게시여부</th>
				<td>
					<input type="radio" name="pd_isview" value="y" />상품게시&nbsp;&nbsp;
					<input type="radio" name="pd_isview" value="n" checked="checked" />상품미게시
				</td>
		</tr>
		<tr>
			<th>용량</th>
				<td colspan="3">
					<div id="optionDiv">
						<select name="ml_id1" id="ml_id1">ml
							<option value=30>30</option>
							<option value=50>50</option>
							<option value=75>75</option>
							<option value=100>100</option>
							<option value=125>125</option>
						</select>
					</div>
					<div id="optionDiv">
						<select name="ml_id2" id="ml_id2">ml
							<option value=30>30</option>
							<option value=50>50</option>
							<option value=75>75</option>
							<option value=100>100</option>
							<option value=125>125</option>
						</select>
					</div>
					<div id="optionDiv">
						<select name="ml_id3" id="ml_id3">ml
							<option value=30>30</option>
							<option value=50>50</option>
							<option value=75>75</option>
							<option value=100>100</option>
							<option value=125>125</option>
						</select>
					</div>
				</td>
			<th>용량별 가격</th>
				<td colspan="3">
					<input type="text" name="ml_price1" id="ml_price1">
					<input type="text" name="ml_price2" id="ml_price2">
					<input type="text" name="ml_price3" id="ml_price3">
				</td>
		</tr>
		<tr>
			<th>상품원가</th><td><input type="text" id="pd_cost" name="pd_cost"></td>
			<th>할인율</th><td><input type="text" id="pd_dc" name="pd_dc">%</td>
			<th>적립율</th><td><input type="text" id="pd_save" name="pd_save">%</td>
		</tr>
		<tr><th colspan="8" style="background-color:skyblue;">Service단</th></tr>
		<tr height="50">
			<th>season</th>
			<td>
				<select name="seadon" id="season" size="4">
					<option value="spring">봄(spring)</option>
					<option value="summer">여름(summer)</option>
					<option value="full">가을(full)</option>
					<option value="winter">겨울(winter)</option>
				</select>
			</td>
			<th>weather</th>
			<td>
				<select name="weather" id="weather" size="4">
					<option value="sunny">맑음(sunny)</option>
					<option value="cloudy">흐림(cloudy)</option>
					<option value="rainy">비오는날(rainy)</option>
					<option value="snowly">눈오는날(snowly)</option>
				</select>
			</td>
			<th>age-birth</th>
			<td>
				<select name="age-birth" id="age-birth" size="4">
					<option value="ten">10대</option>
					<option value="2ten">20대</option>
					<option value="3ten">30대</option>
					<option value="4ten">40대</option>
				</select>
			</td>
			<th>pd_image</th>
			<td>
				<select name="pd_image" id="pd_image" size="5">
					<option value="water">물내음(water)</option>
					<option value="fruit">과일향(fruit)</option>
					<option value="thick">진득한향(thick)</option>
					<option value="powder">파우더(powder)</option>
					<option value="cinnamon">시나몬(cinnamon)</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>sunmoon</th>
			<td>
				<select name="sunmoon" id="sunmoon" size="2">
					<option value="sun">낮(sun)</option>
					<option value="moon">밤(moon)</option>
				</select>
			</td>
			<th>gender</th>
			<td>
				<select name="gender" id="gender" size="3">
					<option value="man">남(man)</option>
					<option value="woman">여(woman)</option>
					<option value="unisex">공통(unisex)</option>
				</select>
			</td>
			<th>sunmoon2</th>
			<td>
				<select name="sunmoon2" id="sunmoon2" size="2">
					<option value="man">낮(nat)</option>
					<option value="woman">밤(bam)</option>
				</select>
			</td>
			<th>scent</th>
			<td>
				<select name="scent" id="scent" size="9">
					<option value="man">송진(Amber)</option>
					<option value="woman">과일향(Bergamot)</option>
					<option value="woman">소나무(Cedar)</option>
					<option value="woman">쟈스민(Jasmine)</option>
					<option value="woman">사향(Musk)</option>
					<option value="woman">흙내(Parchouli)</option>
					<option value="woman">백단향(Sandalwood)</option>
					<option value="woman">바닐라(Vanilla)</option>
					<option value="woman">풀향(Vetive)</option>
				</select>
			</td>
		</tr>
		<tr>
				<td colspan="8" align="center">
					<input type="submit" value="상품 등록" 
						style="width:150px; height:70px; font-size:20px; font-weight:bold;"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시 입력" 
						style="width:150px; height:70px; font-size:20px; font-weight:bold;"/>
				</td>
		</tr>
</table>
</form>
</body>
</html>