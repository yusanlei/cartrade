<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="grzxbj" >
	<div class="selfinfo center">
				<c:if test="${empty page}">
					<h2 style="text-align: center;">没有历史订单哦~</h2>
				</c:if>
			<c:if test="${!empty page}">
				<table class="table" >
				  <thead>
				    <tr>
				      <th>订单号</th>
				      <th>卖家Id</th>
				      <th>买家Id</th>
				      <th>订单价格</th>
				      <th>下单日期</th>
				      <th>订单状态</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${page.dataList }" var="item">
					  <tr <c:if test="${item.status==0}">class="danger"</c:if><c:if test="${item.status==1}">class="active"</c:if>>
					      <td>${item.orderId }</td>
					      <td>${item.sellerId }</td>
					      <td>${item.buyerId }</td>
					      <td>${item.price }</td>
					      <td>${item.createdate }</td>
					      <td>
					      	<c:if test="${item.status==0 }">未支付</c:if>
					      	<c:if test="${item.status==1  }">已支付</c:if>
					      </td>
					   </tr>
				  </c:forEach>
				  </tbody>
				</table>
			</c:if>
		
	</div>
</div>

<c:if test="${!empty page}">
	<nav style="text-align: center">
	  <ul class="pagination  center" >
	  	<c:if test="${page.pageNum > 1 }">
	   	 	<li > <a href="AdminServlet?actionName=view&pageNum=${page.prePage }"><span>«</span></a></li>
	    </c:if>		
	    <c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
	    	<li <c:if test="${page.pageNum == p }">class="active"</c:if> > <a href="AdminServlet?actionName=view&pageNum=${p }" ><span>${p }</span></a></li>
	    </c:forEach>
	    <c:if test="${page.pageNum < page.totalPages }">
	    	<li> <a href="AdminServlet?actionName=view&pageNum=${page.nextPage }"><span>»</span></a></li>
	    </c:if>	
	  </ul>
	</nav>
</c:if>
