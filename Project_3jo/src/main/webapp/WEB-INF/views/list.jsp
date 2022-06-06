<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>listPage</title>
<link rel="stylesheet" href="../resources/css/list.css">
<link rel="stylesheet" href="../resources/main_style/main_style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function pagingFormSubmit(currentPage) {
   var form = document.getElementById('pagingForm');
   var cata = document.getElementById('cata');   //대분류
   var cataSmall = document.getElementById('cataSmall');   //브랜드
   var page = document.getElementById('page');   //페이지
   page.value = currentPage;
   
   form.submit();
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
<br><br>
   <h1 align="center" style="font-family:Times New Roman;">${title}</h1>
   <!-- 메뉴 클릭 시 이미지출력 시작 -->
   <br><br>
    <c:if test="${list[0].big_name == 'man'}"> 
   <div class="text-on-img" align="center">
      <div class="man_img">
         <div class="man_content">
            <h2><strong>남자 향수</strong></h2>
            <p class="man_p1">원초적인 남성미, 정제된 카리스마의 ???남성을 형상화한
            <br>
            남성향수컬렉션
            </p>      
         </div>
      </div>
   </div>
   </c:if> 
   <c:if test="${list[0].big_name == 'woman'}">
    <div class="text-on-img" align="center">
      <div class="woman_img">
         <div class="woman_content">
            <h2><strong>여자 향수</h2>
            <strong>ADDICTED TO LOVE</strong>
            <p class="woman_p2">???의 향수는 당신을 사랑으로의 여행으로 초대합니다.</p>   
         </div>
       </div>
    </div>
    </c:if>
    <c:if test="${list[0].big_name == 'unisex' and list[0].br_img == null}">
    <div class="text-on-img" align="center">
       <div class="unisex_img">
         <div class="content">
            <h2><strong>UNISEX PERFUME</strong></h2>
            <p class="unisex_p3">같은 향기, 좋지 않습니까?
            </p>      
         </div>
       </div>
    </div>  
   </c:if>
   
    <div class="text-on-img">
       <c:if test="${list[0].br_name == cataSmall}">
          <div class="br_img">    
            <div class="content">         
            </div>
          </div>
       </c:if>
    </div>  
   <div><br>
       <div class="brandCata">
          <div align="center">
            <c:if test="${list[0].big_name!= null}"> 
               <ul align="center">
                  <c:forEach var="i" items="${bList}">
                     <li><strong><a href="list?cata=${i.big_name}&cataSmall=${i.br_name}" style="font-family:Times New Roman; color:black;">${i.br_name}</a></strong></li>
                  </c:forEach>
               </ul>               
             </c:if> 
         </div>
       </div>
    </div>
      
      
   <!-- 메뉴 클릭 시 이미지출력 종료 -->
    <section class="serv_list">
        <div class="container">
            <%-- <c:if test="${title}">
            <div class="title">
            <h1>${list.br_name}</h1>
            <c:forEach var="list" items="${list}">
                <ul>
                    <li style="float:right;"><a href="#" >${list.br_name}</a></li>
                </ul>
                </c:forEach>
            </div>   
            </c:if> --%>
            <p><strong>Total<span style="color:gray; font-size:20px;">${navi.totalRecordsCount}</span>개의 상품이 있습니다.</strong></p>
            <div class="sort">
               <ul align="right">
                  <c:if test="${cata == null && cataSmall == null}">
                     <li><strong><a href="list?cate=a" class="a1">높은 가격순</a></strong></li>
                     <li><strong><a href="list?cate=b" class="a1">낮은 가격순</a></strong></li>
                     <li><strong><a href="list?cate=c" class="a1">상품명 순</a></strong></li>                                          
                  </c:if>
                  <c:if test="${cata != null && cataSmall == null}">
                     <li><strong><a href="list?cata=${cata}&cate=a" class="a1">높은 가격순</a></strong></li>
                     <li><strong><a href="list?cata=${cata}&cate=b" class="a1">낮은 가격순</a></strong></li>
                     <li><strong><a href="list?cata=${cata}&cate=c" class="a1">상품명 순</a></strong></li>                                       
                  </c:if>
                  <c:if test="${cata != null && cataSmall != null}">
                     <li><strong><a href="list?cata=${cata}&cataSmall=${cataSmall}&cate=a" class="a1">높은 가격순</a></strong></li>
                     <li><strong><a href="list?cata=${cata}&cataSmall=${cataSmall}&cate=b" class="a1">낮은 가격순</a></strong></li>
                     <li><strong><a href="list?cata=${cata}&cataSmall=${cataSmall}&cate=c" class="a1">상품명 순</a></strong></li>                                          
                  </c:if>
               </ul>
            </div>
            <div class="item_list" align="center"> 
            <c:forEach var="i" items="${list}">
               <div class="card">
                       <div class="img">
                           <img src="../resources/img/${i.big_name}/${i.br_name}/${i.pd_img1}" alt=""
                             onclick='location.href="list/view?cata=${i.big_name}&cataSmall=${i.br_name}&pdID=${i.pd_name}&season=${i.season}&weather=${i.weather}&sunmoon=${i.sunmoon}";' style="cursor:pointer;">
                       </div>
                       <div class="text">
                           <h2>${i.pd_name}</h2>
                           <p><fmt:formatNumber value="${i.pd_cost}" pattern="###,###" /><span>원</span></p>
                       </div>
               </div>
             </c:forEach>                  
            </div>
        </div>
    </section>
    <!-- 페이지 이동 부분 -->
     <!-- 페이지 이동 부분 -->
   <div id="navigator" align="center">                  
      <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">
         <img src="../resources/img/prev.png" width="20" height="20"></a>&nbsp;&nbsp;&nbsp;
      <a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">
         <img src="../resources/img/prev2.png" width="20" height="20"></a>&nbsp;&nbsp;

      <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
         <c:if test="${counter == navi.currentPage}"><b></c:if>
            <a class="page_nm" href="javascript:pagingFormSubmit(${counter})" >${counter}</a>&nbsp;&nbsp;
         <c:if test="${counter == navi.currentPage}"></b></c:if>
   </c:forEach>
      <a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">
         <img src="../resources/img/after2.png" width="20" height="20"></a>&nbsp;&nbsp; &nbsp;
      <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">
         <img src="../resources/img/after.png" width="20" height="20"></a>
   </div>
<!-- /페이지 이동 끝 -->   
<!-- /페이지 이동 끝 -->                      
   <form id="pagingForm" method="get" action="list">
      <c:if test="${cata == null and cataSmall == null }">
         <input type="hidden" name="page" id="page" onclick="pagingFormSubmit(1)"/>
      </c:if>
      <c:if test="${cata != null and cataSmall == null }">      
         <input type="hidden" name="cata" id="cata" value="${cata}">
         <input type="hidden" name="page" id="page" onclick="pagingFormSubmit(1)"/>
      </c:if>
      <c:if test="${cata != null and cataSmall != null }">
         <input type="hidden" name="cata" id="cata" value="${cata}">
         <input type="hidden" name="cataSmall" id="cataSmall" value="${cataSmall}">
         <input type="hidden" name="page" id="page" onclick="pagingFormSubmit(1)"/>
      </c:if>
   </form>
<!-- /검색폼 --> 
<br><br>
<!--footer 시작-->
    <footer>
      <jsp:include page="footer/footer.jsp" >
          <jsp:param value="" name="test"/>
       </jsp:include>
    </footer>
    <!--footer 종료-->
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="../resources/main_js/countdown.js"></script>
    <script src="../resources/main_js/main_js.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>	
</html>