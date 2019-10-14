<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- ASIDE -->
			<div id="aside" class="col-md-3">
				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">品牌</h3>
					<div class="checkbox-filter" id="dv">
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=奥迪">奥迪</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=大众">大众</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=本田">本田</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=丰田">丰田</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=宝马">宝马</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=奔驰">奔驰</a>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" name="brank">
							<label for="category-1">
								<a href="buyCarsServlet?actionName=searchBrand&brank=保时捷">保时捷</a>
							</label>
						</div>
					</div>
				</div>
				<!-- /aside Widget -->
				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">价格</h3>
					<form id="selectPrice" action="buyCarsServlet" method="post">
						<input type="hidden" name="actionName" value="searchPrice">
						<input type="text" value="" class="screen-price js-begin" data-default-value="0" size="4" maxlength="3" id="my_price_b" name="b" />
						<em class="screen-em">-</em>
						<input value="" type="text" class="screen-price js-end" data-default-value="999" size="4" maxlength="3" id="my_price_e" name="e" />
						<em class="screen-em">万</em>
						&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="selectPrice()" class="price-btn js-btn">确定</button>
					</form>
					<span id="msg" style="color: red"></span>
				</div>
				<!-- /aside Widget -->
				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">年限</h3>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2019">2019年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2018">2018年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2017">2017年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2016">2016年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2015">2015年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2014">2014年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2013">2013年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2012">2012年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2011">2011年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2010">2010年</a>
						</div>
					</div>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<span></span>
							<a href="buyCarsServlet?actionName=searchRegdate&regdate=2009">2009年</a>
						</div>
					</div>
				</div>
				<!-- /aside Widget -->
			</div>
			<!-- /ASIDE -->
			<!-- STORE -->
			<div id="store" class="col-md-9">
				<!-- store top filter -->
				<!-- store products -->
				<div class="row">
					<!-- product -->
					<c:forEach items="${page.dataList }" var="item">
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="AdminServlet?actionName=carImage&carId=${item.carId }" width="100%" height="100%" style="vertical-align: 0">
								</div>
								<div class="product-body">
									<input type="hidden" id="${item.carId }">
									<h3 class="product-name">
										<a href="speciflcServlet?carId=${item.carId }">
											<c:if test="${fn:length(item.carinfo) > 20}">
												<span title="${item.carinfo}">${fn:substring(item.carinfo, 0, 20)}...</span>
											</c:if>
											<c:if test="${fn:length(item.carinfo) <= 20}">${item.carinfo}</c:if>
										</a>
									</h3>
									<p class="product-category">
										<fmt:formatDate value="${item.regdate }" pattern="yyyy" var="myDate" />
										${myDate }年 | ${item.regcity }
									</p>
									<h4 class="product-price">${item.price }万元</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<span class="store-qty">商品描述信息</span>
									</div>
								</div>
								<div class="add-to-cart">
									<form action="buyServlet" method="post">
										<input type="hidden" name="carinfo" value="${item.carinfo }">
										<input type="hidden" name="carId" value="${item.carId }">
										<input type="hidden" name="sellerId" value="${item.sellerId }">
										<input type="hidden" name="price" value="${item.price }">
										<button class="add-to-cart-btn">
											<i class="fa fa-shopping-cart"></i>
											<span>购买</span>
										</button>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- /product -->
					<!-- product -->
				</div>
				<!-- /store products -->
				<!-- store bottom filter -->
				<div class="store-filter clearfix" style="text-align: center">
					<c:if test="${empty page }">
						<h2>暂无车源，您可以看看其他汽车</h2>
					</c:if>
					<c:if test="${!empty page }">
						<ul class="pagination">
						<c:if test="${page.pageNum > 1 }">
							<li>
								<a href="buyCarsServlet?pageNum=${page.prePage }"&actionName=${actionName}&brank=${brank}&b=${b}&e=${e}&regdate=${regdate}>&laquo;</a>
							</li>
						</c:if>
						<c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
							<li <c:if test="${page.pageNum == p }">class="active"</c:if>>
								<a href="buyCarsServlet?pageNum=${p }&actionName=${actionName}&brank=${brank}&b=${b}&e=${e}&regdate=${regdate}">${p }</a>
							</li>
						</c:forEach>
						<c:if test="${page.pageNum < page.totalPages }">
							<li>
								<a href="buyCarsServlet?pageNum=${page.nextPage }&actionName=${actionName}&brank=${brank}&b=${b}&e=${e}&regdate=${regdate}">&raquo;</a>
							</li>
						</c:if>
					</ul>
					</c:if>
					
				</div>
				<!-- /store bottom filter -->
			</div>
			<!-- /STORE -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>

<script type="text/javascript">
	// 复选框 分页查找数据
	$("#category-1").click(function() {
		var brank = $("input[type='checkbox']").is(':checked');
		if (brank == false) {
			return;
		} else {
			var text = $("#dv").text().trim();
			$.ajax({
				type : "post",
				url : "buyCarsServlet",
				data : {
					brank : text
				},
				success : function(result) {

				}
			});
		}
		;
	});

	function selectPrice() {
		var my_price_b = $("#my_price_b").val();
		var my_price_e = $("#my_price_e").val();
		if (isEmpty(my_price_b)) {
			$("#msg").html("方框内容不能为空");
			return;
		}
		$("#selectPrice").submit();
	}
</script>