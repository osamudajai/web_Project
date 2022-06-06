<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link rel="stylesheet" href="resources/main_style/header.css">
<title>Insert title here</title>
</head>
<body>
 <header>
        <div class="main_header header_transparent header-mobile-m">
            <div class="header_container sticky-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="<c:url value = "/" />"> <img src="<c:url value = "/"/>resources/main_images/images/logo1.png" alt=""></a>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <!-- 메인 메뉴 글자 부분 시작 -->
                            <div class="main_menu menu_two menu_position">
                                <nav>
                                    <ul>
                                        
                                        <li><a href="<c:url value = "/"/>perfume_teller">향수 추천</a></li>
                                        <li>
                                            <a href="" class="active">Home <i
                                                    class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu">
                                            
                                            <li><a style="color: black;" href=" <c:url value="/product/"/>list?cata=man"><strong>MAN</strong></a></li>
	                                        <li><a style="color: black;" href="<c:url value="/product/"/>list?cata=woman"><strong>WOMAN</strong></a></li>
	                                        <li><a style="color: black;" href="<c:url value="/product/"/>list?cata=unisex"><strong>UNISEX</strong></a></li>
                                            </ul>
                                         <li class="mega_items">
                                            <a href="">Brands<i class="fa fa-angle-down"></i></a>
                                            <div class="mega_menu">
                                                <ul class="mega_menu_inner">
                                                    <li>
                                                        <a style="color: black;"href = "<c:url value = "/product/"/>list?cata=man">Man</a>
                                                        <ul>
                                                            <li><a style="color: black;" href= "<c:url value = "/product/"/>list?cata=man&cataSmall=eisenberg">EISENBERG</a></li>
                                                            <li><a style="color: black;"href= "<c:url value = "/product/"/>list?cata=man&cataSmall=GorzioArmany">GorzioArmani</a></li>
                                                            <li><a style="color: black;"href= "<c:url value = "/product/"/>list?cata=man&cataSmall=Johnvarvatos">JOHNVARVATOS</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=man&cataSmall=perfumeMarly">PERFUMEDMARLY</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=man&cataSmall=tomFord">TOMFORD</a></li> 
                                                        </ul>

                                                    </li>
                                                    <li>
                                                        <a style="color: black;"href=" <c:url value = "/product/"/>list?cata=woman">Woman</a>
                                                        <ul>
                                                            <li><a style="color: black;" href=" <c:url value = "/product/"/>list?cata=woman&cataSmall=chanel">CHANEL</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=woman&cataSmall=hermes">HERMES</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=woman&cataSmall=chloe">CHLOE</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=woman&cataSmall=dior">DIOR</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=woman&cataSmall=karbain">KARBAIN</a></li>
                                                            
                                                        </ul>

                                                    </li>
                                                    <li>
                                                        <a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex">Unisex</a>
                                                        <ul>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex&cataSmall=burbery">BURBERY</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex&cataSmall=diptyque">DIPTYQUE</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex&cataSmall=jomarone">JOMARONE</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex&cataSmall=prada">PRADA</a></li>
                                                            <li><a style="color: black;"href=" <c:url value = "/product/"/>list?cata=unisex&cataSmall=roxitang">ROXITANG</a></li>
                                                        </ul>

                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="<c:url value = "/"/>notice/main">Notice</a></li>

						<li><c:if test="${po_id != null}"><a  href="<c:url value = "/"/>myPage" style="color: white">${sessionScope.po_name}(${sessionScope.po_id})님 환영합니다</a></c:if></li>
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
												<form action="<c:url value = "/"/>po_Search" id="searchForm" method="post" >
												<!-- CSS 482줄이 끝임-->
													<input type="text" name="searchText" placeholder="찾으실 향수를 입력해주세요">
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
                                            <a href="<c:url value = "/"/>ba_list">
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
                                                <li><a href="<c:url value = "/"/>join_loginForm">Sign in&up</a></li>
                                                </c:if>
                                            <c:if test="${sessionScope.po_id != null}">
                                                <li><a href="<c:url value = "/"/>myPage">My account</a></li>
                                                <li><a href="<c:url value = "/"/>logout">logout</a></li>
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
</body>
</html>