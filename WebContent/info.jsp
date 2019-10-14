<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>个人中心</title>



<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="statics/bootstrap/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="statics/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="statics/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="statics/css/slick-theme.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="statics/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="statics/css/style.css" />

<link type="text/css" rel="stylesheet" href="statics/sweetalert/sweetalert2.min.css" />
<script type="text/javascript" src="statics/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="statics/sweetalert/sweetalert2.min.js"></script>


</head>
<body style="background-repeat:no-repeat ;background-size:100% 100%; " background="http://pic1.win4000.com/wallpaper/1/589bd955f1e88.jpg">
	<!-- 个人中心导航 -->
	<div id="breadcrumb" class="section" >
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12" >
					<ul class="breadcrumb-tree">
						<li><a href="userServlet?actionName=mySell">我出售的车</a></li>
						<li><a href="userServlet?actionName=myIndent">我的订单</a></li>
						<li><a href="#">我的收藏</a></li>
						<li>What you are about to have is worth cherishing</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>

	<!-- 设置动态页面 -->
	<c:if test="${empty userChangePage }">
		<jsp:include page="user/sell.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty userChangePage }">
		<jsp:include page="${userChangePage }"></jsp:include>
	</c:if>
</body>


</html>
