<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!-- SECTION 动态包含开始部分-->
	<div class="section" style="background-image: url('statics/images/sell.jpg'); background-repeat: none; background-size: 100%; height: 400px">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7"></div>

				<!-- Order Details -->
				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title" style="color: #FF0000">${resultInfo.result }</h3>
					</div>
					<div class="section-title text-center">
						<h3 class="title" style="color: #FF0000">辆车成功在本网站售出</h3>
					</div>
					<a href="sellServlet?actionName=valueOrSell&valueOrSellId=0" class="primary-btn order-submit">开始估价</a>
					<a href="sellServlet?actionName=valueOrSell&valueOrSellId=1" class="primary-btn order-submit">我要卖车</a>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
									<div>
										<h3>
											<jsp:useBean id="year" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${year}" pattern="yyyy" />
										</h3>
										<span>Year</span>
									</div>
								</li>	
								<li>
									<div>
										<h3>
											<jsp:useBean id="month" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${month}" pattern="MM" />
										</h3>
										<span>Months</span>
									</div>
								</li>	
								<li>
									<div>
										<h3>
											<jsp:useBean id="day" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${day}" pattern="dd" />
										</h3>
										<span>Days</span>
									</div>
								</li>
								<li>
									<div>
										<h3>
											<jsp:useBean id="hour" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${hour}" pattern="hh" />
										</h3>
										<span>Hours</span>
									</div>
								</li>
								<li>
									<div>
										<h3>
											<jsp:useBean id="minite" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${minite}" pattern="mm" />
										</h3>
										<span>Mins</span>
									</div>
								</li>
								<li>
									<div>
										<h3>
											<jsp:useBean id="second" class="java.util.Date" scope="page"/>
											<fmt:formatDate value="${second}" pattern="ss" />
										</h3>
										<span>Secs</span>
									</div>
								</li>
						</ul>
						<h2 class="text-uppercase">先估价再卖车</h2>
						<p>本网站在全国拥有270个城市的买家网络，最高帮您多卖25%</p>
						<a class="primary-btn cta-btn" href="#">马上卖车</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->
	<div class="tlinks">
		Collect from
		<a href="http://www.cssmoban.com/">网页模板</a>
	</div>




	<!-- SECTION 轮播图-->
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
								<img src="statics/images/biaoqianye1.jpg" alt="">							
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
