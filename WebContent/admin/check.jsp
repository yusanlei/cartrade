<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="grzxbj">
	<div class="selfinfo center">
		<div class="rtcont">
			<div class="ddzxbt">卖车审核</div>
				<c:if test="${empty page}">
					<h2 style="text-align: center;">没有待处理的审核哦~</h2>
				</c:if>
			<c:if test="${!empty page}">
				<c:forEach items="${page.dataList }" var="item">
					<div class="ddxq" >
						<div class="ddspt fl"><img src="AdminServlet?actionName=carImage&carId=${item.carId }" width="100%" height="100%" style="vertical-align:0"></div>
						<div class="ddbh fl">carId:${item.carId }</div>
						<div class="ztxx fr">
							<ul>
								<li id="check_${item.carId }">未审核</li>
								<li>sellerId:${item.sellerId }</li>
								<li>${item.submitdate }</li>
								<li><button id="button_${item.carId }" class="btn btn-primary" type="button" onclick="openUpdateDialog(${item.carId })">审核</button></li>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			</c:if>	
		</div>
		<div class="clear"></div>
	</div>
</div>
<!-- 分页操作  -->
<c:if test="${!empty page}">
	<nav style="text-align: center">
	  <ul class="pagination  center" >
	  	<c:if test="${page.pageNum > 1 }">
	   	 	<li > <a href="AdminServlet?pageNum=${page.prePage }"><span>«</span></a></li>
	    </c:if>		
	    <c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
	    	<li <c:if test="${page.pageNum == p }">class="active"</c:if> > <a href="AdminServlet?pageNum=${p }" ><span>${p }</span></a></li>
	    </c:forEach>
	    <c:if test="${page.pageNum < page.totalPages }">
	    	<li> <a href="AdminServlet?pageNum=${page.nextPage }"><span>»</span></a></li>
	    </c:if>	
	  </ul>
	</nav>
</c:if>

	
	
<!-- 模态框  start  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         <span aria-hidden="true">×</span></button>
         <h4 class="modal-title" id="myModalLabel">审核</h4>
       </div>
       <div class="modal-body"> 
         <div class="form-group">
           <label for="typename">审核报告</label>
           <input type="hidden" id="carId"> 
           <input type="text" name="detail" class="form-control" id="detail" placeholder="车辆详情">         	
         </div>      
       </div>
       <div class="modal-footer">
       	
         <span id="msg" style="color:red;font-size:12px"></span>	
       	
         <button type="button" class="btn btn-default" data-dismiss="modal">
         <span class="glyphicon glyphicon-remove"></span>关闭</button>
         <button type="button" id="btn_submit" class="btn btn-primary">
         <span class="glyphicon glyphicon-floppy-disk"></span> 保存</button>
       </div>
     </div>
   </div>
 </div>
 <script type="text/javascript" src="statics/js/check.js"></script>