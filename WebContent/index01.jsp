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
		<link type="text/css" rel="stylesheet" href="statics/css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="statics/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="statics/css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="statics/css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="statics/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="statics/css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		
		
</head>
<body>		
		<!-- 第一排和第二排 -->
		<header>
			<!-- 第一排	菜单栏  -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> 400-666-8888</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> customerservice@foolcar.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 城丰路650号</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="userServlet?actionName=logout"> 退出登录</a></li>
						<li>
							<c:if test="${empty user }">
								<a href="login.jsp">登录</a>
							</c:if>
							<c:if test="${!empty user }">
								<a href="">${user.uname }</a>     <!-- //等待邹希的个人中心接口 -->
							</c:if>
						</li>
						<li><a href="register.jsp"> 注册</a></li>
					</ul>
				</div>
			</div>
			<!-- /第一排	菜单栏  -->

			<!-- 第二排	导航栏 -->
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
			<!-- 第二排	导航栏-->
		</header>
		<!-- 第一排和第二排	  -->

		<!-- 第三排	超链接标签栏 -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav" ">
						<li class="active"><a href="#">首页</a></li>
						<li><a href="buyCarsServlet">买车</a></li>
						<li><a href="sellServlet?actionName=sellcount">卖车</a></li>
						<li><a href="#">备用</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- 第三排	超链接标签栏 -->

		<!-- 第四排 三个图片框 -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="statics/images/indexImage/bmw01.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>总有卖家是傻子<br>我要买车</h3>
								<a href="buyCarsServlet" class="cta-btn">立即买车 </a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="statics/images/indexImage/lexus01.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>总有买家是傻子<br>我要卖车</h3>
								<a href="sellServlet?actionName=sellcount" class="cta-btn">立即卖车</a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="statics/images/indexImage/benz01.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>买新车的才是傻子<br>我要买新车</h3>
								<a href="http://www.lexus.com.cn/models/es" class="cta-btn">买新车</a>
							</div>
						</div>
					</div>
					<!-- /shop -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /第四排 三个图片框  -->
		

		<!-- 第五排 -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">精选好车</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab21">省油代步</a></li>
									<li><a data-toggle="tab" href="#tab22">超值豪华</a></li>
									<li><a data-toggle="tab" href="#tab23">家用首选</a></li>
									<li><a data-toggle="tab" href="#tab24">保值神车</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab21" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye1.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">大众POLO</a></h3>
												<h4 class="product-price">1.98万-10.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye2.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">丰田致炫</a></h3>
												<h4 class="product-price">4.98万-8.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye4.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">铃木雨燕</a></h3>
												<h4 class="product-price">1.98万-7.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye10.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">日产骐达</a></h3>
												<h4 class="product-price">3.22万-13.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye3.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">本田飞度</a></h3>
												<h4 class="product-price">3.98万-9.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
								
								<!-- tab -->
								<div id="tab22" class="tab-pane fade">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye5.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">宝马3系</a></h3>
												<h4 class="product-price">7.68万-34.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye6.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">奔驰C级</a></h3>
												<h4 class="product-price">8.98万-36.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye7.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">奥迪A4L</a></h3>
												<h4 class="product-price">7.98万-35.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye11.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">凯迪拉克ATS-L</a></h3>
												<h4 class="product-price">14.22万-22.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye12.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">雷克萨斯ES300h</a></h3>
												<h4 class="product-price">25.98万-32.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
								
								<!-- tab -->
								<div id="tab23" class="tab-pane fade">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye8.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">丰田卡罗拉</a></h3>
												<h4 class="product-price">3.98万-16.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye9.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">别克英朗</a></h3>
												<h4 class="product-price">3.98万-11.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye13.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">大众朗逸</a></h3>
												<h4 class="product-price">2.98万-15.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye14.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">日产轩逸</a></h3>
												<h4 class="product-price">3.22万-13.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye15.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">福特福克斯</a></h3>
												<h4 class="product-price">1.98万-13.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
								
								<!-- tab -->
								<div id="tab24" class="tab-pane fade">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye16.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">大众桑塔纳</a></h3>
												<h4 class="product-price">2.98万-9.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye17.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">本田思域</a></h3>
												<h4 class="product-price">3.98万-16.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye18.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">别克凯越</a></h3>
												<h4 class="product-price">2.98万-9.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye19.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">丰田汉兰达</a></h3>
												<h4 class="product-price">9.22万-38.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="statics/images/biaoqianye20.jpg" alt="">												
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">丰田RAV4</a></h3>
												<h4 class="product-price">6.98万-21.98万 <del class="product-old-price"></del></h4>																								
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="buyCarsServlet">购买</a></button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
								
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /第五排 -->

		
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近售出</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/indexImage/lexus01.jpg" alt="">							
								<p class="product-category">北京&nbsp;李先生&nbsp;近日成交</p>
								<h3 class="product-name">
									大众POLO
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比北京本地多25%
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye2.jpg" alt="">								
								<p class="product-category">太原&nbsp;刘先生&nbsp;近日成交</p>
								<h3 class="product-name">
									丰田致炫
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比太原本地多25%							
								</h4>								
							</div>
							<!-- /product widget -->							
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近售出</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye3.jpg" alt="">							
								<p class="product-category">洛阳&nbsp;于先生&nbsp;近日成交</p>
								<h3 class="product-name">
									本田飞度
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比洛阳本地多25%
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">						
								<img src="statics/images/biaoqianye4.jpg" alt="">								
								<p class="product-category">上海&nbsp;王先生&nbsp;近日成交</p>
								<h3 class="product-name">
									铃木雨燕
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比上海本地多25%						
								</h4>								
							</div>
							<!-- /product widget -->							
						</div>
					</div>
				</div>

				<div class="clearfix visible-sm visible-xs"></div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近售出</h4>
						<div class="section-nav">
							<div id="slick-nav-5" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-5">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye5.jpg" alt="">							
								<p class="product-category">上海&nbsp;徐先生&nbsp;近日成交</p>
								<h3 class="product-name">
									宝马三系
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比上海本地多25%
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye6.jpg" alt="">								
								<p class="product-category">杭州&nbsp;赵先生&nbsp;近日成交</p>
								<h3 class="product-name">
									奔驰C级
								</h3>
								<h4 class="product-price" style="color:red">
									成交价相比杭州本地多25%							
								</h4>								
							</div>
							<!-- /product widget -->							
						</div>
					</div>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>若想接收新上架车的通知 <strong>请留下邮箱</strong></p>
							<form>
								<input class="input" type="email" placeholder="请输入邮箱地址">
								<button class="newsletter-btn">提交</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#">顶部</a>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
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
									<li><a href="#"><i class="fa fa-map-marker"></i>城丰路650号</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>400-673-3710</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>laonianzu@qq.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">网站地图</h3>
								<ul class="footer-links">
									<li><a href="#">城市首页</a></li>
									<li><a href="#">省级界面</a></li>
									<li><a href="#">品牌</a></li>
									<li><a href="#">车系</a></li>
									<li><a href="#">价格</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">网站信息</h3>
								<ul class="footer-links">
									<li><a href="#">关于我们</a></li>
									<li><a href="#">联系我们</a></li>
									<li><a href="#">隐私政策</a></li>
									<li><a href="#">环评公示</a></li>
									<li><a href="#">服务条款</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">帮助中心</h3>
								<ul class="footer-links">
									<li><a href="#">买车过户流程</a></li>
									<li><a href="#">迁入标准</a></li>
									<li><a href="#">QA</a></li>
									<li><a href="#">售后流程</a></li>
									<li><a href="#">用户反馈</a></li>
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
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by Colorlib  -  More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
							
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