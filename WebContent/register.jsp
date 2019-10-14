<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link href="statics/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="statics/js/jquery-3.4.1.js"></script>
<script src="statics/bootstrap/js/bootstrap.js"></script>
<script src="statics/js/util.js"></script>
</head>
<body style="background-image: url('statics/images/register.jpg'); background-size: cover; height: 100%; width: 100%">
	<div class="container" style="margin-top: 200px">
		<form id="regForm" class="form-horizontal" action="userServlet" method="post" >
			<input type="hidden" name="actionName" value="register">
			<div class="form-group">
				<label for="uname" class="col-sm-2 col-sm-offset-2  control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名" value="${resultInfo.result.uname }">
				</div>
				<div id="unameMsg" style="color:red"></div>
			</div>
			<div class="form-group">
				<label for="upwd1" class="col-sm-2 col-sm-offset-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="upwd1" name="upwd" placeholder="请输入密码">
				</div>
				<div id="upwd1Msg" style="color:red"></div>
			</div>
			<div class="form-group">
				<label for="upwd2" class="col-sm-2 col-sm-offset-2 control-label">请确认密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="upwd2" placeholder="请确认密码">
				</div>
				<div id="upwd2Msg" style="color:red"></div>
			</div>
			<div class="form-group">
				<label for="phonenum" class="col-sm-2 col-sm-offset-2 control-label">手机号</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="phonenum" name="phonenum" placeholder="请输入手机号" value="${resultInfo.result.phonenum }">
				</div>
				<div id="phonenumMsg" style="color:red"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button onclick="reg()" type="button" class="btn btn-success btn-primary btn-lg btn-block">注册</button>
				</div>
				<div id="msg" style="color:red">${resultInfo.msg }</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<a href="login.jsp" style="text-decoration:none;"><button type="button" class="btn btn-default btn-primary btn-lg btn-block">已有账号，直接登陆</button></a>
				</div>
			</div>
		</form>
	</div>

</body>

<script type="text/javascript">
	function reg(){	
		var uname = $("#uname").val();
		var upwd1 = $("#upwd1").val();
		var upwd2 = $("#upwd2").val();
		var phonenum = $("#phonenum").val();
		//用户名正则，4到16位（字母，数字，下划线，减号）
		var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
		if(!uPattern.test(uname)){
			$("#unameMsg").html("4到16位（字母，数字，下划线，减号）");
			return;
		}
		//密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
		/*var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
		if(!pPattern.test(upwd1)){
			$("#upwd1Msg").html("最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符");
			return;
		}*/
		if(upwd2!=upwd1){
			$("#upwd2Msg").html("两次密码不相同，请重新输入");
			return;
		}
		//手机号正则
		var mPattern = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
		if(!mPattern.test(phonenum)){
			$("#phonenumMsg").html("手机号错误，请重新输入");
			return;
		}
		$("#regForm").submit();

	}
</script>
</html>