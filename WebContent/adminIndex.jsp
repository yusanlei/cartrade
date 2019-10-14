<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>

<link href="statics/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="statics/js/jquery-3.4.1.js"></script>
<script src="statics/bootstrap/js/bootstrap.js"></script>
<script src="statics/js/util.js"></script>
<script src="statics/sweetalert/sweetalert2.min.js"></script>
<link href="statics/sweetalert/sweetalert2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="statics/css/adminStyle.css">

<style type="text/css">

body {
    background-color: #e8dabf;
    background-image: url("statics/images/bg.png");
    background-position: bottom right, top;
    background-repeat: no-repeat, repeat;
    background-attachment: fixed, scroll;
    color: #444;
}

</style>

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" style="font-size:25px; text-align: center;width: 135px;" href="#">管理员</a>
		    </div>
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li <c:if test="${menu == 'check' }">class="active"</c:if> ><a href="AdminServlet">车辆审核</a></li>
		        <li <c:if test="${menu == 'view' }">class="active"</c:if> ><a href="AdminServlet?actionName=view">&nbsp;订单流水</a></li>
		      </ul>
		    </div>
		    
		   
		  </div>
		</nav>
		
		<c:if test="${empty changePage}">
			<jsp:include page="admin/check.jsp"></jsp:include>
		</c:if>
		<c:if test="${!empty changePage}">
			<jsp:include page="${changePage }"></jsp:include>
		</c:if>
</body>






</html>