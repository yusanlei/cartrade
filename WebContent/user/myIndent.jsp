<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 我的订单 -->
<div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<!-- 判断是否查询到订单 -->
				<c:if test="${empty order }">
					<img alt="" src="statics/images/zwtp.png" width="100%">
				</c:if>
				<c:if test="${!empty order }">
					<thead>
						<tr>
							<th>订单Id</th>
							<th>车辆信息</th>
							<th>成交价格</th>
							<th>付款时间</th>
							<th>联系卖家</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order }" var="item">
							<tr style="border-bottom: 2px;box-shadow:0px 3px 2px rgb(215,193,155);height: 50px">
								<td>${item.orderId }</td>
								<td>${item.carinfo }</td>
								<td>${item.price }</td>
								<td>${item.paydate }</td>
								<td>${item.phonenum }</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>
</div>
