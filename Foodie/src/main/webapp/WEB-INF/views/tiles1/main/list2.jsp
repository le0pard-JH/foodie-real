<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String ctxPath = request.getContextPath();
  //       /board 
%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Get it Foodie!</title>
    
</head>
<style type="text/css">
.top_list{
/* == topList 스팬태그 가운데로 == */
		position: relative;
        bottom: 90px;
        right:78px;
        color:white;
        font-size:20px;
        font-weight:bold;
        text-align:center;
       	
}
.top_list2{
/* == topList 스팬태그 가운데로 == */
        position: relative;
        bottom: 90px;
        right:78px;
        color:white;
        font-size:15px;
        font-weight:bold;
        text-align:center;
       	
}



div.listing__item__pic set-bg{
	/* position:relative;
	width:500px;
	height:300px; */
}
div.listing__item{
	/* position:relative; */
	width:380px;
}
</style>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

          <c:forEach var="searchList" items="${searchList}" >
      		
      		<ol>
      		
      			<li style="font-size:20pt;">점포명:${searchList.name} </li>
      			<li style="font-size:20pt;">판매종류:${searchList.hygine} </li>      			
      			<li style="font-size:20pt;">주소:${searchList.address} </li>
      			<li style="font-size:20pt;">전화:${searchList.call} </li>
      			<li style="font-size:20pt;">우편번호:${searchList.postcode} </li>
      			<li style="font-size:20pt;">가게코드:${searchList.code} </li>
      			<li style="font-size:20pt;">영업유무:${searchList.open_status} </li>
      			<li style="font-size:20pt;">type:${searchList.type} </li>
      			<li style="font-size:20pt;">rownum:${searchList.rownum} </li>
      			<br><br>
      			
      			
      		</ol>
      		
      		
      	  </c:forEach> 


   
    <!-- Js Plugins -->
    <script src="<%=ctxPath %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=ctxPath %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/main.js"></script>
</body>

