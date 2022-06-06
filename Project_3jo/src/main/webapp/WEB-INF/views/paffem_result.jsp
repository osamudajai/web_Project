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
<title>paffem</title>
<script type="text/javascript" src="jqcloud-1.0.4.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js">
</script> 
<script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
<style type="text/css">
#container {
	position: absolute;
	height: 80%;
    width: 80%;
    top: 600px;
    bottom: 0;
    left: 9%;
}

#paffen_scent{
font-size: x-large;
font-weight: bolder;
}

#jamybody{
background: #F9FFFF;
}

#go_shop {
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
#go_shop:hover {
    text-decoration: none;
}
#go_shop:active {
    position: relative;
    top: 1px;
}
</style>

<script> 
anychart.onDocumentReady(function () { 
var data = [ { "x": "channel", "value": 5000, category: "Sino-Tibetan" }, 
	{ "x": "${paffem_Search2[0].br_name}", "value": 7000,  link: "<c:url value = "/product/"/>list?cata=${paffem_Search2[0].big_name}&cataSmall=${paffem_Search2[0].br_name}"  },
	{ "x": "${paffem_Search2[1].br_name}", "value": 6000,  link: "<c:url value = "/product/"/>list?cata=${paffem_Search2[1].big_name}&cataSmall=${paffem_Search2[1].br_name}" },
	{ "x": "${paffem_Search2[2].br_name}", "value": 5000,  link: "<c:url value = "/product/"/>list?cata=${paffem_Search2[2].big_name}&cataSmall=${paffem_Search2[2].br_name}"},
	{ "x": "${paffem_Search2[3].br_name}", "value": 5000,  link: "<c:url value = "/product/"/>list?cata=${paffem_Search2[3].big_name}&cataSmall=${paffem_Search2[3].br_name}"},
	{ "x": "${paffem_Search2[1].pd_name}", "value": 5000,  },
	{ "x": "${paffem_Search2[2].pd_name}", "value": 5000,  },
	{ "x": "${paffem_Search2[3].pd_name}", "value": 5000,  }, 
	{ "x": "${paffem_Search2[0].season}", "value": 5000,  }, 
	{ "x": "${paffem_Search2[0].weather}", "value": 5000,  }, 
	{ "x": "${paffem_Search2[0].age_birth}", "value": 6000,  }, 
	{ "x": "${paffem_Search2[0].scent}", "value": 8700,  }, 
	{ "x": "${paffem_Search2[0].pd_image}", "value": 8900,  }, 
	{ "x": "${paffem_Search2[0].sunmoon}", "value": 8000,  }, 
	{ "x": "${paffem_Search2[0].gender}", "value": 6500,  }, 
	{ "x": "${paffem_Search2[0].sunmoon2}", "value": 7000,  }, 
	{ "x": "향수", "value": 8500, category: "Indo-European" }, 
	{ "x": "Perfume", "value": 8500, category: "Indo-European" }, 
	
	]; 


var chart = anychart.tagCloud(data); 
chart.container("container");
chart.angles([0, 30, 90]);
chart.draw(); 
chart.fromAngle(10);
chart.toAngle(100);
chart.anglesCount(5);
chart.normal().fontWeight(600);
chart.selected().fill("#79");
chart.listen('pointClick', function (e) {
    if (e.point.get('link') != undefined) {
      window.open(e.point.get('link'));
    }
  });
 

 }); 

</script>


    
</head>
<body id="jamybody">
<div class="header_container sticky-header">
	<div class="container-fluid">
	<div class="row align-items-center">
	    <jsp:include page="header/header.jsp" >
	    	<jsp:param value="" name="test"/>
	    </jsp:include>
	</div>
	</div>
	</div>
	<div class="product_area product_area_two mb-65">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>향수 추천 결과 입니다</h2>
                        <div class="product_tab_btn">
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
                                            <a href="product/list/view?cata=${paffem_Search2[0].big_name}&cataSmall=${paffem_Search2[0].br_name}&pdID=${paffem_Search2[0].pd_name}" class="primary_img">
                                                <img src="resources/img/${paffem_Search2[0].big_name}/${paffem_Search2[0].br_name}/${paffem_Search2[0].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#">${paffem_Search2[0].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${paffem_Search2[0].pd_cost}</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${paffem_Search2[1].big_name}&cataSmall=${paffem_Search2[1].br_name}&pdID=${paffem_Search2[1].pd_name}" class="primary_img">
                                               <img src="resources/img/${paffem_Search2[1].big_name}/${paffem_Search2[1].br_name}/${paffem_Search2[1].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${paffem_Search2[1].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${paffem_Search2[1].pd_cost}</span>
                                            </div>
                                            
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${paffem_Search2[2].big_name}&cataSmall=${paffem_Search2[2].br_name}&pdID=${paffem_Search2[2].pd_name}" class="primary_img">
                                               <img src="resources/img/${paffem_Search2[2].big_name}/${paffem_Search2[2].br_name}/${paffem_Search2[2].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                  <a href="#">${paffem_Search2[2].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${paffem_Search2[2].pd_cost}</span>
                                            </div>
                                           
                                        </figcaption>
                                    </figure>

                                </article>
                            </div>
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a href="product/list/view?cata=${paffem_Search2[3].big_name}&cataSmall=${paffem_Search2[3].br_name}&pdID=${paffem_Search2[3].pd_name}" class="primary_img">
                                               <img src="resources/img/${paffem_Search2[3].big_name}/${paffem_Search2[3].br_name}/${paffem_Search2[3].pd_img1}" alt="">
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                 <a href="#">${paffem_Search2[3].pd_name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="current_price">${paffem_Search2[3].pd_cost}</span>
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
                <div class="col-12">
                    <div class="section_title">
                        <h2>고객님이 선택하신 키워드에요</h2>
                        </div>	
                </div>
	
<div class="chart-area"> 
<div id="container">
</div> 
</div>

<br/><br/><br/><br/><br/>

				<div class="col-12">
                <div class="section_title" style="top:750px">
                        <h2>고객님이 선택하신 향은....</h2>
                        <br/><br/>
                        <div id="paffen_scent">${paffem_Search2[0].scent}하며,${paffem_Search2[0].pd_image}한 향이군요!</div>
                        <br/><br/><br/>
                        </div>	
                </div>
                
      

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<script src="resources/main_js/countdown.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script src="resources/main_js/main_js.js"></script>
</html>