<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="statics/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="statics/js/jquery-3.4.1.js"></script>
<script src="statics/bootstrap/js/bootstrap.js"></script>
<script src="statics/js/util.js"></script>
</head>
<body style="background-image: url('statics/images/login.jpg'); background-size: cover; height: 100%; width: 100%">


	<div class="container" style="margin-top: 200px">
		<form id="loginForm" class="form-horizontal" action="userServlet" method="post">
			<input type="hidden" name="actionName" value="login">
			<div class="form-group">
				<label for="uname" class="col-sm-2 col-sm-offset-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名" value="${resultInfo.result.uname }">
				</div>
				<div id="unameMsg" style="color: red"></div>
			</div>
			<div class="form-group">
				<label for="upwd" class="col-sm-2 col-sm-offset-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="upwd" name="upwd" placeholder="请输入密码">
				</div>
				<div id="upwdMsg" style="color: red"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="rem" value="1">
							记住我
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button onclick="login()" type="button" class="btn btn-default btn-primary btn-lg btn-block">登录</button>
				</div>
				<div id="msg" style="color: red">${resultInfo.msg }</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<a href="register.jsp" style="text-decoration:none;"><button type="button" class="btn btn-success btn-primary btn-lg btn-block">没有账号，我要注册</button></a>
				</div>
				
			</div>
		</form>
	</div>



	<script type="text/javascript">
		function login() {
			var uname = $("#uname").val();
			var upwd = $("#upwd").val();
			if (isEmpty(uname)) {
				$("#unameMsg").html("用户名不能为空");
				return;
			}
			if (isEmpty(upwd)) {
				$("#upwdMsg").html("密码不能为空");
				return;
			}
			$("#loginForm").submit();
		}
	</script>
</body>
</html>