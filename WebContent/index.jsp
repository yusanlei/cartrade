<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>


<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
<link href="statics/sweetalert/sweetalert2.min.css" rel="stylesheet">
<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="statics/css/bootstrap.min.css" />
<link href="statics/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Slick -->
<link type="text/css" rel="stylesheet" href="statics/css/slick.css" />
<link type="text/css" rel="stylesheet" href="statics/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="statics/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="statics/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="statics/css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
<script src="statics/js/util.js"></script>	
<script src="statics/js/jquery-3.4.1.js"></script>
<script src="statics/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak="></script>
<script type="text/javascript" src="statics/js/index.js"></script>
</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li>	
						<a>
							
							当前城市：
						</a>
						<a id="loc" href="#"></a>
					</li>				
				</ul>
				<ul class="header-links pull-right">
					<li>
						<a href="userServlet?actionName=logout">
							
							注销
						</a>
					</li>
					<li>
						<c:if test="${empty user }">
							<a href="login.jsp">登录</a>
						</c:if>
						<c:if test="${!empty user }">
							<a href="userServlet?actionName=mySell">${user.uname }</a>
						</c:if>
					</li>
					<li>
						<a href="register.jsp">
							
							注册
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo">
								<img src="statics/images/indexImage/logo05.jpg"alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- 搜索框-->
						<div class="col-md-6">
							<div class="header-search">
								<form action="buyCarsServlet" method="post">
									<select class="input-select">
										<option value="0">所有品牌</option>
										<option value="1">大众</option>
										<option value="1">丰田</option>
										<option value="1">本田</option>
										<option value="1">三菱</option>
										<option value="1">福特</option>
										<option value="1">林肯</option>
										<option value="1">通用</option>
										<option value="1">吉利</option>
									</select>
									<input class="input" placeholder="请输入品牌车系">
									<button class="search-btn" type="submit">搜车</button>   <!-- //连接谢总的搜索接口 -->
									
								</form>
							</div>
						</div>
						<!-- /搜索框 -->


				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li class="active">
						<a href="indexServlet">首页</a>
					</li>
					<li>
						<a href="buyCarsServlet">买车</a>
					</li>
					<li>
						<a href="sellServlet?actionName=sellcount">卖车</a>
					</li>
					<li>
						<a href="#">备用</a>
					</li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION  导航-->




	<!-- 动态包含指定页面 -->
	<c:if test="${empty changePage }"><jsp:include page="index/index.jsp"></jsp:include></c:if>
	<c:if test="${!empty changePage }"><jsp:include page="${changePage }"></jsp:include></c:if>



	<!-- FOOTER 结尾-->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">关于我们</h3>
							<p>傻子二手车，我们不赚差价，只收服务费</p>
							<ul class="footer-links">
								<li>
									<a href="#">
										<i class="fa fa-map-marker"></i>
										城丰路650号
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-phone"></i>
										400-673-3710
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-envelope-o"></i>
										laonianzu@qq.com
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">网站地图</h3>
							<ul class="footer-links">
								<li>
									<a href="#">城市首页</a>
								</li>
								<li>
									<a href="#">省级界面</a>
								</li>
								<li>
									<a href="#">品牌</a>
								</li>
								<li>
									<a href="#">车系</a>
								</li>
								<li>
									<a href="#">价格</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="clearfix visible-xs"></div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">网站信息</h3>
							<ul class="footer-links">
								<li>
									<a href="#">关于我们</a>
								</li>
								<li>
									<a href="#">联系我们</a>
								</li>
								<li>
									<a href="#">隐私政策</a>
								</li>
								<li>
									<a href="#">环评公示</a>
								</li>
								<li>
									<a href="#">服务条款</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">帮助中心</h3>
							<ul class="footer-links">
								<li>
									<a href="#">买车过户流程</a>
								</li>
								<li>
									<a href="#">迁入标准</a>
								</li>
								<li>
									<a href="#">QA</a>
								</li>
								<li>
									<a href="#">售后流程</a>
								</li>
								<li>
									<a href="#">用户反馈</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li>
								<a href="#">
									<i class="fa fa-cc-visa"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-credit-card"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-cc-paypal"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-cc-mastercard"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-cc-discover"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-cc-amex"></i>
								</a>
							</li>
						</ul>
						<span class="copyright">

							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with
							<i class="fa fa-heart-o" aria-hidden="true"></i>
							by Colorlib - More Templates
							<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
							- Collect from
							<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>

						</span>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="statics/js/jquery.min.js"></script>
	<script src="statics/js/bootstrap.min.js"></script>
	<script src="statics/js/slick.min.js"></script>
	<script src="statics/js/nouislider.min.js"></script>
	<script src="statics/js/jquery.zoom.min.js"></script>
	<script src="statics/js/main.js"></script>
	<script src="statics/sweetalert/sweetalert2.min.js"></script>
	
	
</body>
</html>