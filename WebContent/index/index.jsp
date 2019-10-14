<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

		<!-- 热卖横条 -->
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
							<h2 class="text-uppercase">本周热卖</h2>
							<p>最高直降10万</p>
							<a class="primary-btn cta-btn" href="#">马上抢购</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- / 热卖横条 -->
		
		
		
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

		
		
			<!-- 新上架通知 -->
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
		

		