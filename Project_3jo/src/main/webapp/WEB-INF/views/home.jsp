<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>3조 프로젝트</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/main_style.css">


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){

jQuery.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=fed042c4f5620437e85fc613e50cd0b1&units=metric'
		,function(result){ 
			var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].desciption+'">'
			$('.waeicon').html(wiconUrl);
			
			$.ajax({
				url: 'weather_list', //컨트롤러의 함수값
				type: 'post',  //타입
				dataType: 'json', // 물어보기
				data:{weather : result.weather[0].main},//스트링으로 넘겨줘야함
				success: function(data){
					repeatcall(data);
				},
				error:function(data2){
				 	JSON.stringify(data2); 
					alert(data2);
		        }
			});

	});
});

function repeatcall(data){
    
	
	
	var str = '<div class="home_section_right">';
	str += '<div class="product_area mb-65">';
	str += ' <div class="section_title section_title_style2">';
	str += '<h2>날씨별 추천 향수</h2>';
	str += '</div>';
	str += '<div class="row">';
    str += ' <div class="product_carousel product_column3 owl-carousel">';
$.each(data, function(index, home_product){
	str	+=	'<div class="col-lg-3">';
	str += '<article class="single_product">';
	str += '<figure>';
	str += '<div class="product_thumb">';
	str += '<a href="product/list/view?cata='+ home_product.big_name +'&cataSmall='+home_product.br_name+'&pdID='+home_product.pd_name+'" class="primary_img">';
	str +=  '<img src="resources/img/'+home_product.big_name+'/'+home_product.br_name+'/'+home_product.pd_img1+'" alt="">'
	str += '</a>';
	str += ' </div>';
	str += ' <figcaption class="product_content">';
	str += '<h4 class="product_name">';
	str += '<a href="#">'+home_product.pd_name+'</a>';
	str += ' </h4>';
	str += '<div class="price_box">';
	str += '<span class="current_price">'+home_product.pd_cost+'</span>';
	str += ' </div>';
	str += ' </figcaption>';
	str += ' </figure>';
	str += '</article>';
	str += '</div>';
	str += '</div>';
	str += '</div>';
	str += '</div>';
	str += '</div>';
	});
	$('#wewewe').html(str);
}
</script>

    
 <script>   
 	$(document).ready(function() {

	    $('.ba_bt').on('click', call1);
	});

	
	function call1() {
		var pd_id = $(this).attr('pd');
		var amount = document.getElementById('amount_'+pd_id).value;

		$.ajax({
			url: 'ba_insert', //컨트롤러의 함수값
			type: 'post',  //타입
			dataType: 'text', // 물어보기
			data:{pd_id : pd_id, amount : amount},
			success: function(){
					alert('장바구니에 담겼습니다!')
			},
			error:function(x,e){
	            if(x.status==500){

		            alert('로그인이 필요한 서비스입니다!!');

		            location.reload('/join_loginForm.jsp');
		            //월요일 질문하기

	            }
			}
		});	
	}
//서버 호출
</script>
    
    
</head>
<body id="body1">
<div class="off_canvars_overlay"></div>

    <div class="offcanvas_menu offcanvas_two">
        <div class="canvas_open">
            <a href="javascript:void(0)"><i class="fa fa-bars"></i></a>
        </div>
        <div class="offcanvas_menu_wrapper">
            <div class="canvas_close">
                <a href="javascript:void(0)"><i class="fa fa-times"></i></a>
            </div>
            <div class="header_account">
                   <ul>
                                        <li class="top_links">
                                            <a href="#">
                                                <i class="fa fa-address-book-o"></i>
                                            </a>
                                            <ul class="dropdown_links">
                                            <c:if test="${sessionScope.po_id == null}">
                                                <li><a href="join_loginForm">Sign in&up</a></li>
                                                </c:if>
                                            <c:if test="${sessionScope.po_id != null}">
                                                <li><a href="myPage">My account</a></li>
                                                <li><a href="logout">logout</a></li>
                                            </c:if>
                                            </ul>
                                        </li>
                                    </ul>
            </div>

            <div class="header_right_info">
                <ul>
                    <li class="search_box">
                        <a href="javascript:void(0)"><i class="fa fa-search"></i></a>
                        <div class="search_widget">
                            <form action="#">
                                <input type="text" placeholder="Search Your Perfume">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </li>
                
                    <li class="mini_cart_wrapper">
                        <a href="#">
                            <i class="fa fa-shopping-cart"></i>
                        </a>
                    </li>
                </ul>
            </div>

            <div id="menu" class="text-left">
                <ul class="offcanvas_main_menu">
                    <li class="menu-item-has-children active">
                        <a href="#">Home</a>
                        <ul class="sub-menu">
                            <li><a href="product/list?cata=man"><strong>MEN</strong></a></li>
	                         <li><a href="product/list?cata=woman"><strong>WOMEN</strong></a></li>
	                        <li><a href="product/list?cata=unisex"><strong>UNISEX</strong></a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children">
                    <a href="">Brands</a>
                        <ul class="sub-menu">
                            <li class="menu-item-has-children">
                                <a href="list?cata=men">Man</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=man&cataSmall=eisenberg">EISENBERG</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=GorzioArmany">GorzioArmani</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=Johnvarvatos">JOHNVARVATOS</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=perfumeMarly">PERFUMEDMARLY</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=tomFord">TOMFORD</a></li> 
                                                        </ul>
                            </li>
                            <li class="menu-item-has-children">
                               <a href="product/list?cata=woman">Women</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=woman&cataSmall=chanel">CHANEL</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=hermes">HERMES</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=chloe">CHLOE</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=dior">DIOR</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=karbain">KARBAIN</a></li>
                                                            
                                                        </ul>
                            </li>
                            <li class="menu-item-has-children">
                               <a href="product/list?cata=unisex">Unisex</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=unisex&cataSmall=burbery">BURBERY</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=diptyque">DIPTYQUE</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=jomarone">JOMARONE</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=prada">PRADA</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=roxitang">ROXITANG</a></li>
                                                        </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="perfume_teller">파퓸 카피(설문조사)</a></li>
                    <li class="menu-item-has-children">
                        <a href="notice/main">QNA</a>
                    </li>
                </ul>
            </div>
            <div class="offcanvas_footer">
                <ul>
                    <li class="facebook"><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                    <li class="twitter"><a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a></li>
                    <li class="pinterest"><a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest-p"></i></a></li>
                    <li class="linkedin"><a href="https://kr.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                    <li class="google-plus"><a href="https://en.wikipedia.org/wiki/Google%2B"><i class="fa fa-google-plus"></i></a></li>
                </ul>
            </div>
        </div>

    </div>

    <!--헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다헤더 입니다-->
    <header>
        <div class="main_header header_transparent header-mobile-m">
            <div class="header_container sticky-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="<c:url value = "/"/>"><img src="resources/main_images/images/logo1.png" alt=""></a>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <!-- 메인 메뉴 글자 부분 시작 -->
                            <div class="main_menu menu_two menu_position">
                                <nav>
                                    <ul>
                                        
                                        <li><a href="perfume_teller">향수추천</a></li>
                                        <li>
                                            <a href="" class="active">Home <i
                                                    class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu">
                                            
                                            <li><a href="product/list?cata=man"><strong>MEN</strong></a></li>
	                                        <li><a href="product/list?cata=woman"><strong>WOMEN</strong></a></li>
	                                        <li><a href="product/list?cata=unisex"><strong>UNISEX</strong></a></li>
                                            </ul>
                                        <li class="mega_items">
                                            <a href="">Brands<i class="fa fa-angle-down"></i></a>
                                            <div class="mega_menu">
                                                <ul class="mega_menu_inner">
                                                    <li>
                                                        <a href="list?cata=men">Man</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=man&cataSmall=eisenberg">EISENBERG</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=GorzioArmany">GorzioArmani</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=Johnvarvatos">JOHNVARVATOS</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=perfumeMarly">PERFUMEDMARLY</a></li>
                                                            <li><a href="product/list?cata=man&cataSmall=tomFord">TOMFORD</a></li> 
                                                        </ul>

                                                    </li>
                                                    <li>
                                                        <a href="product/list?cata=woman">Women</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=woman&cataSmall=chanel">CHANEL</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=hermes">HERMES</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=chloe">CHLOE</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=dior">DIOR</a></li>
                                                            <li><a href="product/list?cata=woman&cataSmall=karbain">KARBAIN</a></li>
                                                            
                                                        </ul>

                                                    </li>
                                                    <li>
                                                        <a href="product/list?cata=unisex">Unisex</a>
                                                        <ul>
                                                            <li><a href="product/list?cata=unisex&cataSmall=burbery">BURBERY</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=diptyque">DIPTYQUE</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=jomarone">JOMARONE</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=prada">PRADA</a></li>
                                                            <li><a href="product/list?cata=unisex&cataSmall=roxitang">ROXITANG</a></li>
                                                        </ul>

                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="notice/main">Notice </a>
                                        </li>

						<li><c:if test="${po_id != null}"><a href="myPage" style="color: white">${sessionScope.po_name}(${sessionScope.po_id})님 환영합니다</a></c:if></li>
									</ul>
                                </nav>
                            </div>

                            <!-- 메인 메뉴 아이콘 시작 -->
                        </div>
                        <div class="col-lg-4">
                            <div class="header_top_right">
                                <!--css 1203번째 줄-->
                                
                                
                                <div class="header_right_info">
                                    <ul>
										<li class="search_box"><a href="javascript:void(0)">
												<i class="fa fa-search"></i>
										</a>
										
											<div class="search_widget">
											<div class="keep_login_container">
												<form action="po_Search" id="searchForm" method="post" >
												<!-- CSS 482줄이 끝임-->
													<input type="text" name="searchText" id="sear" placeholder="찾으실 향수를 입력해주세요">
													<button type="submit" value="검색">
														<i class="fa fa-search"></i>
													</button>
													<table class="search_table">
														<tr>
															<th class="search_li">계절</th>
															<td><input type="checkbox" id="ckBox" name="season"
																value="spring"><label for="ckBox">봄</label></td>
															<td><input type="checkbox" id="ckBox" name="season"
																value="summer"><label for="ckBox">여름</label></td>
															<td><input type="checkbox" id="ckBox" name="season"
																value="full"><label for="ckBox">가을</label></td>
															<td><input type="checkbox" id="ckBox" name="season"
																value="winter"><label for="ckBox">겨울</label></td>
														</tr>
														
														<tr>
															<th class="search_li">날씨</th>
															<td><input type="checkbox" id="ckBox" name="weather"
															value="sunny"><label for="ckBox">맑음</label></td>
															<td><input type="checkbox" id="ckBox" name="weather"
															value="cloudy"><label for="ckBox">흐림</label></td>
															<td><input type="checkbox" id="ckBox" name="weather"
															value="rainy"><label for="ckBox">비오는날</label></td>
															<td><input type="checkbox" id="ckBox" name="weather"
															value="snowiy"><label for="ckBox">눈오는날</label></td>
														</tr>

														<tr>
															<th class="search_li">연령대</th>
															<td><input type="checkbox" id="ckBox" name="age_birth"
															value="ten"><label for="ckBox">10대</label></td>
															<td><input type="checkbox" id="ckBox" name="age_birth"
															value="2ten"><label for="ckBox">20대</label></td>
															<td><input type="checkbox" id="ckBox" name="age_birth"
															value="3ten"><label for="ckBox">30대</label></td>
															<td><input type="checkbox" id="ckBox" name="age_birth"
															value="4over"><label for="ckBox">40대이상</label></td>
														</tr>

														<tr>
															<th class="search_li">향</th>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Musk"><label for="ckBox">사향</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Jasmine"><label for="ckBox">자스민</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Vanilla"><label for="ckBox">바닐라</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Sandalwood"><label for="ckBox">백단향</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Bergamot"><label for="ckBox">과일향</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Amber"><label for=ckBox>송진</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Patchouli"><label for="ckBox">흙내</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Cedar"><label for="ckBox">소나무</label></td>
															<td><input type="checkbox" id="ckBox" name="Scent"
															value="Vetive"><label for="ckBox">풀향</label></td>
														</tr>

														<tr>
															<th>이미지</th>
															<td><input type="checkbox" id="ckBox" name="pd_image"
															value="water"><label for="ckBox">물내음</label></td>
															<td><input type="checkbox" id="ckBox" name="pd_image"
															value="fruit"><label for="ckBox">과일향</label></td>
															<td><input type="checkbox" id="ckBox" name="pd_image"
															value="thick"><label for="ckBox">진득한향</label></td>
															<td><input type="checkbox" id="ckBox" name="pd_image"
															value="cinnamon"><label for="ckBox">시나몬</label></td>
															<td><input type="checkbox" id="ckBox" name="pd_image"
															value="powder"><label for="ckBox">파우더</label></td>
														</tr>


														<tr>
															<th>낮,밤</th>
															<td><input type="checkbox" id="ckBox" name="sunmoon"
															value="sun"><label for="ckBox">낮</label></td>
															<td><input type="checkbox" id="ckBox" name="sunmoon"
															value="moon"><label for="ckBox">밤</label></td>
														</tr>

														<tr>
															<th>성별</th>
															<td><input type="checkbox" id="ckBox" name="gender"
															value="man"><label for="ckBox">남</label></td>
															<td><input type="checkbox" id="ckBox" name="gender"
															value="woman"><label for="ckBox">여</label></td>
															<td><input type="checkbox" id="ckBox" name="gender"
															value="unisex"><label for="ckBox">공통</label></td>
														</tr>
													</table>
												</form>
												
											</div></div></li>
											<c:if test="${sessionScope.po_id != null}">
										<li class="mini_cart_wrapper" id="ba_bt2">
                                            <a href="ba_list">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                             </c:if>
                                    </ul>
                                </div>

                                <!--로그인 기능 -->
                                <div class="header_account">
                                    <ul>
                                        <li class="top_links">
                                            <a href="#">
                                                <i class="fa fa-address-book-o"></i>
                                            </a>
                                            <ul class="dropdown_links">
                                            <c:if test="${sessionScope.po_id == null}">
                                                <li><a href="join_loginForm">Sign in&up</a></li>
                                                </c:if>
                                            <c:if test="${sessionScope.po_id != null}">
                                                <li><a href="myPage">My account</a></li>
                                                <li><a href="logout">logout</a></li>
                                            </c:if>
                                                    <!--로그인 안했을시에는 Sign in, Sign up, My account 보이고 
                                                        로그인 했을시에 My account, logout 만 보이게 해주세요 -->
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 배너 슬라이더 입니다. -->
    <section class="slider_section slider_section2 mb-66">
        <div class="slider_area owl-carousel">
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/slider1.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6">
                            <div class="slider_content slider_content2 content_right">
                                <h1>3조 샤르멩</h1>
                                <h2>언제나 좋은 향수를 추천해드립니다.</h2>
                                <p>Zinedine Zidane Karim BenzemaHugo Hadrien Dominique Lloris Paul Pogba</p>
                                <a href="product/list?cata=man&cataSmall=eisenberg" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/slider2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="slider_content slider_content2 content_left">
                                <h1>3조 샤르멩</h1>
                                <h2>언제나 좋은 향수를 보여드립니다.</h2>
                                <p>Didier DeschampsRaphaël VaraneThierry HenryJust Fontaine Lilian Thuram</p>
                                <a href="product/list?cata=unisex&cataSmall=roxitang" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- 상품 전시 부분입니다. -->

    <!--새상품 전시 입니다.-->
    <div class="product_area product_area_two mb-65">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>New Products</h2>
                        <div class="product_tab_btn">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a href="#Men" class="active" data-toggle="tab" role="tab" aria-controls="Men"
                                        aria-selected="true">
                                        Man
                                    </a>
                                </li>
                                <li>
                                    <a href="#Women" data-toggle="tab" role="tab" aria-controls="Women"
                                        aria-selected="false">
                                        Woman
                                    </a>
                                </li>
                                <li>
                                    <a href="#Unisex" data-toggle="tab" role="tab" aria-controls="Unisex"
                                        aria-selected="false">
                                        Unisex
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="Men" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[0].big_name}&cataSmall=${home_product[0].br_name}&pdID=${home_product[0].pd_name}" class="primary_img">
                                                <img src="resources/img/${home_product[0].big_name}/${home_product[0].br_name}/${home_product[0].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#">${home_product[0].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[0].pd_cost}</span>
                                            </div>
											<!-- 왜 번호로 했냐.
											상품이 추가되면 배열 맨 앞으로 오게 됩니다. 그렇게 된다면 배열 번호수로 출력을 하게되고
											이게 곧 신상품이기 때문에 배열 번호로 맞춰주게 되었습니다. -->
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[1].big_name}&cataSmall=${home_product[1].br_name}&pdID=${home_product[1].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_product[1].big_name}/${home_product[1].br_name}/${home_product[1].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_product[1].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[1].pd_cost}</span>
                                            </div>
                                            
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[2].big_name}&cataSmall=${home_product[2].br_name}&pdID=${home_product[2].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_product[2].big_name}/${home_product[2].br_name}/${home_product[2].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_product[2].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[2].pd_cost}</span>
                                            </div>
                                           
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[3].big_name}&cataSmall=${home_product[3].br_name}&pdID=${home_product[3].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_product[3].big_name}/${home_product[3].br_name}/${home_product[3].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_product[3].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[3].pd_cost}</span>
                                            </div>
                                           
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[4].big_name}&cataSmall=${home_product[4].br_name}&pdID=${home_product[4].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_product[4].big_name}/${home_product[4].br_name}/${home_product[4].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_product[4].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[4].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_product[5].big_name}&cataSmall=${home_product[5].br_name}&pdID=${home_product[5].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_product[5].big_name}/${home_product[5].br_name}/${home_product[5].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_product[5].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[5].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="Women" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[0].big_name}&cataSmall=${home_productwoman[0].br_name}&pdID=${home_productwoman[0].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[0].big_name}/${home_productwoman[0].br_name}/${home_productwoman[0].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_productwoman[0].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productwoman[0].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[1].big_name}&cataSmall=${home_productwoman[2].br_name}&pdID=${home_productwoman[3].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[1].big_name}/${home_productwoman[1].br_name}/${home_productwoman[1].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productwoman[1].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productwoman[1].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                             <a href="product/list/view?cata=${home_productwoman[2].big_name}&cataSmall=${home_productwoman[2].br_name}&pdID=${home_productwoman[2].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[2].big_name}/${home_productwoman[2].br_name}/${home_productwoman[2].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#">${home_productwoman[2].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productwoman[2].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[3].big_name}&cataSmall=${home_productwoman[3].br_name}&pdID=${home_productwoman[3].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[3].big_name}/${home_productwoman[3].br_name}/${home_productwoman[3].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productwoman[3].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productwoman[3].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[4].big_name}&cataSmall=${home_productwoman[4].br_name}&pdID=${home_productwoman[4].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[4].big_name}/${home_productwoman[4].br_name}/${home_productwoman[4].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productwoman[4].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[4].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[5].big_name}&cataSmall=${home_productwoman[5].br_name}&pdID=${home_productwoman[5].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[5].big_name}/${home_productwoman[5].br_name}/${home_productwoman[5].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productwoman[5].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[5].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productwoman[6].big_name}&cataSmall=${home_productwoman[6].br_name}&pdID=${home_productwoman[6].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productwoman[6].big_name}/${home_productwoman[6].br_name}/${home_productwoman[6].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productwoman[6].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[6].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            
                            
                            
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="Unisex" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productunisex[0].big_name}&cataSmall=${home_productunisex[0].br_name}&pdID=${home_productunisex[0].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[0].big_name}/${home_productunisex[0].br_name}/${home_productunisex[0].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_productunisex[0].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[0].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                             <a href="product/list/view?cata=${home_productunisex[1].big_name}&cataSmall=${home_productunisex[1].br_name}&pdID=${home_productunisex[1].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[1].big_name}/${home_productunisex[1].br_name}/${home_productunisex[1].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productunisex[1].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[1].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productunisex[2].big_name}&cataSmall=${home_productunisex[2].br_name}&pdID=${home_productunisex[2].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[2].big_name}/${home_productunisex[2].br_name}/${home_productunisex[2].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productunisex[2].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[2].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${home_productunisex[3].big_name}&cataSmall=${home_productunisex[3].br_name}&pdID=${home_productunisex[3].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[3].big_name}/${home_productunisex[3].br_name}/${home_productunisex[3].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productunisex[3].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_product[3].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                             <a href="product/list/view?cata=${home_productunisex[4].big_name}&cataSmall=${home_productunisex[4].br_name}&pdID=${home_productunisex[4].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[4].big_name}/${home_productunisex[4].br_name}/${home_productunisex[4].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${home_productunisex[4].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[4].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                             <a href="product/list/view?cata=${home_productunisex[5].big_name}&cataSmall=${home_productunisex[5].br_name}&pdID=${home_productunisex[5].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[5].big_name}/${home_productunisex[5].br_name}/${home_productunisex[5].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_productunisex[5].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[5].pd_cost}</span>
                                            </div>
                                            
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                             <a href="product/list/view?cata=${home_productunisex[6].big_name}&cataSmall=${home_productunisex[6].br_name}&pdID=${home_productunisex[6].pd_name}" class="primary_img">
                                               <img src="resources/img/${home_productunisex[6].big_name}/${home_productunisex[6].br_name}/${home_productunisex[6].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${home_productunisex[6].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${home_productunisex[6].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- product area ends -->


    <!-- banner area starts -->
    <div class="banner_area mb-66">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="<c:url value = "/product/"/>list/view?cata=woman&cataSmall=chanel&pdID=cha3">
                                <img src="resources/main_images/images/banner/banner1.jpg" alt="">
                            </a>
                            <div class="banner_content">
                                <h3>Sale up to</h3>
                                <h2>70%</h2>
                                <p>샤넬 <span> & </span> Body Spray</p>
                            </div>
                        </div>
                    </figure>
                </div>
                <div class="col-lg-4 col-md-4">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="<c:url value = "/product/"/>list/view?cata=woman&cataSmall=chanel&pdID=cha4">
                                <img src="resources/main_images/images/banner/banner2.jpg" alt="">
                            </a>
                            <div class="banner_content">
                                <h3>Sale up to</h3>
                                <h2>50%</h2>
                                <p>샤넬 블루 드 샤넬 오 드 퍼퓸</p>
                            </div>
                        </div>
                    </figure>
                </div>
                <div class="col-lg-4 col-md-4">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="<c:url value = "/product/"/>list/view?cata=woman&cataSmall=chanel&pdID=cha5">
                                <img src="resources/main_images/images/banner/banner3.jpg" alt="">
                            </a>
                            <div class="banner_content">
                                <h3>Sale up to</h3>
                                <h2>30%</h2>
                                <p>블루 드 샤넬 파펭</p>
                            </div>
                        </div>
                    </figure>
                </div>
            </div>
        </div>
    </div>
    <!-- banner area ends -->

    <!-- home section area starts  -->

    <div class="home_section_two color_two mb-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12">
                    <div class="home_section_left">
                        <!-- deals product area starts -->

                        <div class="deals_product_area mb-68" style="position: relative; left: 450px;">
                            <div class="section_title section_title_style2">
                                <h2>최고 주문수 상품</h2>
                            </div>
                            <div class="row">
                                <div class="deals_carousel product_column1 owl-carousel">
                                    <div class="col-lg-3">
                                        <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a href="product/list/view?cata=${best_order[0].big_name}&cataSmall=${best_order[0].br_name}&pdID=${best_order[0].pd_name}" class="primary_img">
                                                        <img src="resources/img/${best_order[0].big_name}/${best_order[0].br_name}/${best_order[0].pd_img1}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <!-- for deals timing -->
                                                    
                                                    
                                                    <h4 class="product_name">
                                                        <a href="#">${best_order[0].pd_name}</a>
                                                    </h4>

                                                    <div class="price_box">
                                                        <span class="current_price">${best_order[0].pd_cost}</span>
                                                    </div>

                                                </figcaption>
                                            </figure>

                                        </article>
                                    </div>

                                    <div class="col-lg-3">
                                        <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a href="product/list/view?cata=${best_order[1].big_name}&cataSmall=${best_order[1].br_name}&pdID=${best_order[1].pd_name}" class="primary_img">
                                                        <img src="resources/img/${best_order[1].big_name}/${best_order[1].br_name}/${best_order[1].pd_img1}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <!-- for deals timing -->
                                                    <div class="product_timing">
                                                      
                                                    </div>
                                                    <h4 class="product_name">
                                                        <a href="#">${best_order[1].pd_name}</a>
                                                    </h4>

                                                    <div class="price_box">
                                                        <span class="old_price">510000</span>
                                                        <span class="current_price">${best_order[1].pd_cost}</span>
                                                    </div>

                                                </figcaption>
                                            </figure>

                                        </article>
                                    </div>

                                    <div class="col-lg-3">
                                        <article class="single_product">
                                            <figure>
                                                   <div class="product_thumb">
                                                    <a href="product/list/view?cata=${best_order[2].big_name}&cataSmall=${best_order[2].br_name}&pdID=${best_order[2].pd_name}" class="primary_img">
                                                        <img src="resources/img/${best_order[2].big_name}/${best_order[2].br_name}/${best_order[2].pd_img1}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <!-- for deals timing -->
                                                    <h4 class="product_name">
                                                        <a href="#">${best_order[2].pd_name}</a>
                                                    </h4>

                                                    <div class="price_box">
                                                        <span class="old_price">780000</span>
                                                         <span class="current_price">${best_order[2].pd_cost}</span>
                                                    </div>

                                                </figcaption>
                                            </figure>

                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                
                        <!-- product area starts  -->
						<div id="wewewe"style="display: flex;"></div>
						<div class ="waeicon" style="margin-top: -250px"></div>

                        <!-- 날씨 최고 조회수의 끝-->

                        <!-- product section starts  -->
                      
                        <!-- product section ends -->
                    </div>
                    <!--안됨-->
                </div>
                <!--안됨-->
            </div>
            <!--안됨-->
        </div>
        <!--안됨-->
    </div>
    <!--날씨 향수 배너 추가-->
    <section class="slider_section slider_section2 mb-66">
        <div class="slider_area owl-carousel">
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/spring.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6">
                            <div class="slider_content slider_content2 content_right">
                                <h1>브랜드관 : 아이젠버그</h1>
                                <p>마케터로서 우리의 일은 고객이 어떻게 구매하고 싶어하는지 이해하고 그렇게하도록 돕는 것입니다</p>>
                                <a href="product/list?cata=man&cataSmall=eisenberg" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/slider3.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="slider_content slider_content2 content_left">
                                <h1>브랜드관 : 에르메스</h1>
                                <p>아무것도 바꾸지 않기위해 모든 것을 바꾼다</p>
                                <a href="product/list?cata=woman&cataSmall=hermes" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/full.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="slider_content slider_content2 content_left">
                                <h1>브랜드관 : 샤넬</h1>
                                 <p>패션은 변하지만, 스타일은 영원하다.</p>
                                <a href="product/list?cata=woman&cataSmall=chanel" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/slider/winter.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="slider_content slider_content2 content_left">
                                <h1>브랜드관 : 프라다</h1>
                                <p>악마는 프라다를 입는다.</p>
                                <a href="product/list?cata=unisex&cataSmall=prada" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!--날씨 향수배너 끝-->
    <!-- home section area ends -->


    <!-- blog section starts  -->

    <section class="blog_section blog_two color_two mb-65">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>당신은 스스로에게 만족스러운 향수를 사용하고 있나요?</h2>
                    </div>
                </div>
            </div>
			<div class="single_slider d-flex align-items-center" data-bgimg="resources/main_images/images/banner/movebanner.gif"></div>
            <p>
     	</div>
    </section>
    
	<br>
	<br>
	<br>
	<br>
	
    <!-- blog section ends -->

    <footer class="footer_widgets color_two">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7" style="text-align: center;left: 30%;">
                        <div class="widgets_container contact_us">
                            <div class="footer_logo">
                            </div>
                            <div class="footer_desc">
                                <p>3조의 프로젝트입니다.</p>
                            </div>
                            <p>
                                <span>Address :</span> 코엑스 4층
                            </p>
                            <p><span>Email :</span> <a href="#">sjw10203883@gmail.com</a></p>
                            <p><span>Phone :</span> <a href="tel: +91 8888884444">01038089647</a> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer section starts  -->

        <div class="footer_bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="copyright_area">
                            <p>Copyright &copy; 2021 <a href="#">kita 3조 </a>All right Reserved.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="footer_payment text-right">
                            <ul>
                                <li><a href="#"><img src="resources/main_images/images/icon/paypal.jpg" alt=""></a></li>
                                <li><a href="#"><img src="resources/main_images/images/icon/paypal1.jpg" alt=""></a></li>
                                <li><a href="#"><img src="resources/main_images/images/icon/paypal2.jpg" alt=""></a></li>
                                <li><a href="#"><img src="resources/main_images/images/icon/paypal3.jpg" alt=""></a></li>
                                <li><a href="#"><img src="resources/main_images/images/icon/paypal4.jpg" alt=""></a></li>
                                <li><a href="admin/admin_login"><img src="resources/main_images/images/icon/paypal5.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- footer section ends -->

    <!-- modal section starts  -->



    <!-- modal section ends -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="resources/main_js/countdown.js"></script>
    <script src="resources/main_js/main_js.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</body>
</html>
