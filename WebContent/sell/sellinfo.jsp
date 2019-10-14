<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<!-- 估价或卖车 -->
	<div class="container" style="margin-top: 30px">
		<form id="addOrUpdateForm" class="form-horizontal" action="sellServlet" method="post" enctype="multipart/form-data">
			<input type="hidden" id="sell" name="actionName" value="sell">
			<input type="hidden" id="carId" name="carId" value="${resultInfo.result.carId }">
			<div class="form-group">
				<label for="province" class="col-sm-2 col-sm-offset-2  control-label">卖车城市</label>
				<!-- 省 -->
				<div class="col-sm-2">
					<select class="form-control" id="province" name="province" onchange="changeCity()">
						<option value="">-- 请选择省 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.district,'-') }" var="list2" />
							<option selected>${list2[0] }</option>
						</c:if>
					</select>
				</div>
				<!-- 市 -->
				<div class="col-sm-2">
					<select class="form-control" id="city" name="city" onchange="changeDistrict()">
						<option value="">-- 请选择市 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.district,'-') }" var="list2" />
							<option selected>${list2[1] }</option>
						</c:if>
					</select>
				</div>
				<!-- 县(区) -->
				<div class="col-sm-2">
					<select class="form-control" id="district" name="district" onchange="changeDhiddenValue()">
						<option value="">-- 请选择县(区) --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.district,'-') }" var="list2" />
							<option selected>${list2[2] }</option>
						</c:if>
					</select>
				</div>
			</div>
			<input type="hidden" id="districthid" name="districthid" value="">
			<div class="form-group">
				<label for="province2" class="col-sm-2 col-sm-offset-2 control-label">上牌城市</label>
				<!-- 省 -->
				<div class="col-sm-2">
					<select class="form-control" id="province2" name="province2" onchange="changeCity2()">
						<option value="">-- 请选择省 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.regcity,'-') }" var="list3" />
							<option selected>${list3[0] }</option>
						</c:if>
					</select>
				</div>
				<!-- 市 -->
				<div class="col-sm-2">
					<select class="form-control" id="city2" name="city2" onchange="changeDistrict2()">
						<option value="">-- 请选择市 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.regcity,'-') }" var="list3" />
							<option selected>${list3[1] }</option>
						</c:if>
					</select>
				</div>
				<input type="hidden" id="city2hid" name="city2hid" value="">
			</div>
			<div class="form-group">
				<label for="id_select" class="col-sm-2 col-sm-offset-2 control-label">品牌车系</label>
				<!-- 品牌 -->
				<div class="col-sm-2">
					<select id="id_select" class="form-control"  name="brand" onchange="changeSeries()">
					<!-- <select id="id_select" class="selectpicker bla bla bli" data-live-search="true" name="brand" onchange="changeSeries()"> -->
						<option>-- 请选择品牌 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.carinfo,'-') }" var="list" />
							<option selected>${list[0] }</option>
						</c:if>						
					</select>
				</div>
				<!-- 车系 -->
				<div class="col-sm-2">
					<select class="form-control" id="series" name="series" onchange="changeInfo()">
						<option value="">-- 请选择车系 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.carinfo,'-') }" var="list" />
							<option selected>${list[1] }</option>
						</c:if>
					</select>
				</div>
				<!-- 车系 -->
				<div class="col-sm-2">
					<select class="form-control" id="info" name="info">
						<option value="">-- 请选择车型 --</option>
						<c:if test="${!empty resultInfo }">
							<c:set value="${fn:split(resultInfo.result.carinfo,'-') }" var="list" />
							<option value="${resultInfo.result.carinfoId }" selected>${list[2] }</option>
						</c:if>
					</select>
				</div>
				<input type="hidden" id="infohid" name="infohid" value="">
			</div>
			<div class="form-group">
				<label for="regdate" class="col-sm-2 col-sm-offset-2 control-label">上牌时间</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="regdate" name="regdate" placeholder="请选择上牌日期" value="<fmt:formatDate value='${resultInfo.result.regdate }' pattern='yyyy-MM-dd'/>" >
				</div>
			</div>
			<div class="form-group">
				<label for="mileage" class="col-sm-2 col-sm-offset-2 control-label">行驶里程</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" id="mileage" name="mileage" placeholder="请输入里程数" aria-describedby="basic-addon2" value="${resultInfo.result.mileage }">
						<span class="input-group-addon" id="basic-addon2">万公里</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="carcondition" class="col-sm-2 col-sm-offset-2 control-label">车况自评</label>
				<div class="col-sm-4">
					<select class="form-control" id="carcondition" name="carcondition" value="${resultInfo.result.carcondition }">
						<option value="">-- 请选择 --</option>
						<option value="0" <c:if test="${resultInfo.result.carcondition==0 }">selected</c:if> >-- 崭新出厂 --</option>
						<option value="1" <c:if test="${resultInfo.result.carcondition==1 }">selected</c:if> >-- 略有磨损 --</option>
						<option value="2" <c:if test="${resultInfo.result.carcondition==2 }">selected</c:if> >-- 久经战场 --</option>
						<option value="3" <c:if test="${resultInfo.result.carcondition==3 }">selected</c:if> >-- 残破不堪 --</option>
						<option value="4" <c:if test="${resultInfo.result.carcondition==4 }">selected</c:if> >-- 战痕累累 --</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="col-sm-2 col-sm-offset-2 control-label">汽车价格</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" id="price" name="price" placeholder="请输入汽车价格" aria-describedby="basic-addon2" value="${resultInfo.result.price }">
						<span class="input-group-addon" id="basic-addon2">万元</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="iname1" class="col-sm-2 col-sm-offset-2 control-label">上传图片1</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="iname1" name="iname1" placeholder="请上传图片" value="" >
				</div>				
			</div>
			<div class="form-group">
				<label for="iname2" class="col-sm-2 col-sm-offset-2 control-label">上传图片2</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="iname2" name="iname2" placeholder="请上传图片" value="" >
				</div>	
			</div>
			<div class="form-group">
				<label for="iname3" class="col-sm-2 col-sm-offset-2 control-label">上传图片3</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="iname3" name="iname3" placeholder="请上传图片" value="" >
				</div>		
			</div>
			<div class="form-group">
				<label for="iname4" class="col-sm-2 col-sm-offset-2 control-label">上传图片4</label>			
				<div class="col-sm-4">
					<input type="file" class="form-control" id="iname4" name="iname4" placeholder="请上传图片" value="" >
				</div>				
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button onclick="addOrUpdate(${valueOrSellId})" type="button" class="btn btn-danger btn-primary btn-lg btn-block">提交资料</button>
				</div>
				<div id="msg" style="color: red">${resultInfo.msg }</div>
			</div>
		</form>
	</div>

	<!-- 估价模态框 -->
	<div id="valueModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">估价</h4>
				</div>
				<div class="modal-body">
					<div id="msgModal"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="btnModal" onclick="toSell()" type="button" class="btn btn-primary">我要卖车</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script type="text/javascript" src="statics/js/sellinfo.js"></script>
