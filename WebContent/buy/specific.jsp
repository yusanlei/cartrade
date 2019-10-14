<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
<div class="container">
	<!-- row -->
	<div class="row">
		<!-- Product main img -->
		<div class="col-md-5 col-md-push-2">
			<div id="product-main-img">
				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname1 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname2 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname3 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname4 }" alt="">
				</div>
			</div>
		</div>
		<!-- /Product main img -->

		<!-- Product thumb imgs -->
		<div class="col-md-2  col-md-pull-5">
			<div id="product-imgs">
				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname1 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname2 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname3 }" alt="">
				</div>

				<div class="product-preview">
					<img src="AdminServlet?actionName=carImage&imageName=${img.iname4 }" alt="">
				</div>
			</div>
		</div>
		<!-- /Product thumb imgs -->

		<!-- Product details -->
		<div class="col-md-5">
			<div class="product-details">
				<h2 class="product-name">${car.carinfo }</h2>
				<div>
					<h3 class="product-price">${car.price }&nbsp;万元</h3>
					<span class="product-available">七天无理由退货</span>
				</div>
				<p>
					咨询车况经检测，该车排除火烧情况；转向柱浮锈；排除调表情况；关键事故部件中未发现变形异常项；无钣金痕迹；无焊接、切割动作。发动机舱内部无拆卸拆解痕迹；核心部件无更换记录；无漏油痕迹。该车覆盖件少量喷漆修复，多处钣金修复，不影响行车安全。</p>
				<div class="add-to-cart">
					<form action="buyServlet" method="post">
						<input type="hidden" name="carinfo" value="${car.carinfo }">
						<input type="hidden" name="carId" value="${car.carId }">
						<input type="hidden" name="sellerId" value="${car.sellerId }">
						<input type="hidden" name="price" value="${car.price }">
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>购买</button>
					</form>
				</div>
			</div>
		</div>
		<!-- /Product details -->

		<!-- Product tab -->
		<div class="col-md-12">
			<div id="product-tab">
				<!-- product tab nav -->
				<ul class="tab-nav">
					<li class="active"><a data-toggle="tab" href="#tab1">车主留言</a></li>
				</ul>
				<!-- /product tab nav -->
				<!-- product tab content -->
				<div class="tab-content">
					<!-- tab1  -->
					<div id="tab1" class="tab-pane fade in active">
						<div class="row">
							<div class="col-md-12">
								<h3>此人很懒,什么也没写.</h3>
							</div>
						</div>
					</div>
					<!-- /tab1  -->
				</div>
				<!-- /product tab content  -->
			</div>
		</div>
		<!-- /product tab -->
	</div>
	<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
	<!-- container -->
<div class="container">
	<!-- row -->
	<div class="row">

		<div class="col-md-12">
			<div class="section-title text-center">
				<h3 class="title">你可能想看</h3>
			</div>
		</div>

		<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近上架</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3" style="text-align:center">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye1.jpg" alt="">							
								<h3 class="product-name">
									大众POLO
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">2万-7万</a>	
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye2.jpg" alt="">								
								<h3 class="product-name">
									丰田致炫
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">2万-7万</a>						
								</h4>								
							</div>
							<!-- /product widget -->							
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近上架</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4" style="text-align:center">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye3.jpg" alt="">							
								<h3 class="product-name">
									本田飞度
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">3万-8万</a>
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">						
								<img src="statics/images/biaoqianye4.jpg" alt="">								
								<h3 class="product-name">
									铃木雨燕
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">1万-5万</a>					
								</h4>								
							</div>
							<!-- /product widget -->							
						</div>
					</div>
				</div>

				<div class="clearfix visible-sm visible-xs"></div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">最近上架</h4>
						<div class="section-nav">
							<div id="slick-nav-5" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-5"  style="text-align:center">
						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye5.jpg" alt="">							
								<h3 class="product-name">
									宝马三系
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">8万-15万</a>	
								</h4>
							</div>
							<!-- /product widget -->							
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">							
								<img src="statics/images/biaoqianye6.jpg" alt="">								
								<h3 class="product-name">
									奔驰C级
								</h3>
								<h4 class="product-price" style="color:red">
									<a href="buyCarsServlet" style="color:red">10万-15万</a>						
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
<!-- /Section -->
<!-- jQuery Plugins -->
<script src="statics/js/jquery.min.js"></script>
<script src="statics/js/bootstrap.min.js"></script>
<script src="statics/js/slick.min.js"></script>
<script src="statics/js/nouislider.min.js"></script>
<script src="statics/js/jquery.zoom.min.js"></script>
<script src="statics/js/main.js"></script>