<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- === #24. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%
	String ctxPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Directing Template">
  <meta name="keywords" content="Directing, unica, creative, html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Directing | Template</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 
   
   <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/elegant-icons.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/flaticon.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/nice-select.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/barfiller.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/magnific-popup.css"/>
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/jquery-ui.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/owl.carousel.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/slicknav.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/style.css" />
  
  <%--  ===== #179. 스피너를 사용하기 위해  jquery-ui 사용하기 ===== --%>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/jquery-ui-1.11.4.custom/jquery-ui.css" />
  <script type="text/javascript" src="<%= request.getContextPath() %>/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
</head>
<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
		
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>    