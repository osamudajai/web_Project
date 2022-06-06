<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
<link rel="stylesheet" href="resources/main_style/main_style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>po_Search</title>
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
	<!-- 헤더입니다. -->
	<div class="product_area product_area_two mb-65">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>검색한 상품</h2>
                        <div class="product_tab_btn">
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="Men" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">
                           <c:forEach var="po_s" items="${po_Search}" varStatus="i">
				<div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${po_s.big_name}&cataSmall=${po_s.br_name}&pdID=${po_s.pd_name}" class="primary_img">
                                               <img src="resources/img/${po_s.big_name}/${po_s.br_name}/${po_s.pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${po_s.pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${po_s.pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
							</c:forEach>
                            
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
        
	<jsp:include page="footer/footer.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
</body>
</html>