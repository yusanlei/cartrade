<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading" style="background:rgb(209,0,36)">
						<h3 class="panel-title" style="color:white">正在出售</h3>
					</div>

					<!-- body -->
					<div class="panel-body">
						<!-- 上架详情 -->
						<c:if test="${empty page.dataList }">
							<div class="col-md-5">
								<img alt="" src="statics/images/zwtp.png" width="100%">
							</div>
						</c:if>
						<!-- 车辆列表 -->
						<c:if test="${!empty page }">
							<c:forEach items="${page.dataList }" var="item">
								<div class="rtcont fr">
									<div class="ddxq" id="row_${item.carId }">
										<!-- 车辆图片 -->
										<div class="ddspt fl">
											<img src="AdminServlet?actionName=carImage&carId=${item.carId }" width="100%" height="100%" style="vertical-align:0">
										</div>
										<!-- 车辆信息 -->
										<div class="ddbh fl">
											<a href="speciflcServlet?carId=${item.carId }">${item.carinfo }</a>
										</div>

										<div class="ztxx fr">
											<ul>
												<!-- 出售价格 -->
												<li>￥${item.price }</li>
												<!-- 上架时间 -->
												<li>${item.selltime }</li>
												<!-- 取消出售 -->
												<li><button class="btn-danger" onclick="soldOut(${item.carId})">下架车辆</button></li>
											</ul>
										</div>
									</div>
								</div>
							</c:forEach>

						</c:if>
						<!-- 车辆列表 -->
					</div>
					<!-- body -->
				</div>
				<!-- 分页 -->
				<c:if test="${!empty page }">
					<nav style="text-align: center">
						<ul class="pagination center">
							<!-- 当当前页>1时,则显示上一页 -->
							<c:if test="${page.pageNum > 1 }">
								<li><a
									href="userServlet?actionName=mySell&page.pageNum=${page.prePage }"><span>«</span></a></li>
							</c:if>
							<!-- 从开始页至结束页循环,循环的每一个为"p" -->
							<c:forEach begin="${page.startNavPage }"
								end="${page.endNavPage }" var="p">
								<!-- 当循环到当前页时,添加选中样式 -->
								<li <c:if test="${page.pageNum == p }">class="active"</c:if>>
									<a href="userServlet?actionName=mySell&pageNum=${p }">${p }</a>
								</li>
							</c:forEach>
							<c:if test="${page.pageNum < page.totalPages }">
								<li><a
									href="userServlet?actionName=mySell&page.pageNum=${page.nextPage }"><span>»</span></a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>
				<!-- 分页 -->
			</div>
		</div>
	</div>

<script>
	//下架出售车辆
	function soldOut(carId){
		swal({
			title:"下架车辆", //提示标题
			text:"<h4>确定下架车辆吗?</h4>", //提示信息文本
			type:"warning", //提示图标
			showCancelButton:true, //显示取消按钮
			confirmButtonColor:"orange", //设置确认按钮颜色
			confirmButtonText:"确认", //设置确认按钮文本
			cancelButtonText:"取消" //设置取消按钮文本
		}).then(function(){
			//发送ajax请求至后台
			$.ajax({
				type:"post",
				url:"userServlet",
				data:{
					carId:carId, //车辆Id
					actionName:"soldOut" //用户行为
				},
				success:function(code){
					console.log(code);
					//当受影响的行数 > 0时,则代表删除成功
					if(code == 1){
						$("#row_"+carId).remove();
					//反之失败
					}else{
						swal("","<h4>下架失败,请重试</h4>","error");
					}
				}
			})	
		});
	}
</script>