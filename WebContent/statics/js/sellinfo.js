/**
 * 车辆地址：省市县三级联动
 */
$(function() {
	$.ajax({
		type : "POST",
		url : "pcdServlet",
		data : {
			"pid" : 0
		},
		dataType : "json",
		success : function(result) {
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#province").append(option);
			}
		}
	});
});

function changeCity() {
	// 页面加载完成，将省的信息加载完成
	// 下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
	var pid = $("#province").val();
	$.ajax({
		url : "pcdServlet",
		data : {
			"pid" : pid
		},
		dataType : "json",
		success : function(result) {
			// 清空城市下拉列表框的内容
			$("#city").html("<option value=''>-- 请选择市 --</option>");
			$("#district").html("<option value=''>-- 请选择区/县 --</option>");
			// 遍历json，json数组中每一个json，都对应一个省的信息，都应该在省的下拉列表框下面添加一个<option>
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#city").append(option);
			}
		}
	});
}

function changeDistrict() {
	// 页面加载完成，将省的信息加载完成
	// 下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
	var pid = $("#city").val();
	$.ajax({
		url : "pcdServlet",
		data : {
			"pid" : pid
		},
		dataType : "json",
		success : function(result) {
			// 清空城市下拉列表框的内容
			$("#district").html("<option value=''>-- 请选择区/县 --</option>");
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#district").append(option);
			}
		}
	});
}

function changeDhiddenValue() {
	// 当城市的内容发生变化的时候，相应的改变城市的隐藏域的值
	$("#dhidden").val($("#district option:selected").html());
}

/**
 * 
 * 车辆牌照
 */
$(function() {
	$.ajax({
		type : "POST",
		url : "pcdServlet",
		data : {
			"pid" : 0
		},
		dataType : "json",
		success : function(result) {
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#province2").append(option);
			}
		}
	});
});

function changeCity2() {
	// 当省的内容发生变化的时候，相应的改变省的隐藏域的值
	$("#phidden2").val($("#province2 option:selected").html());
	// 页面加载完成，将省的信息加载完成
	// 下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
	var pid = $("#province2").val();
	$.ajax({
		url : "pcdServlet",
		data : {
			"pid" : pid
		},
		dataType : "json",
		success : function(result) {
			// 清空城市下拉列表框的内容
			$("#city2").html("<option value=''>-- 请选择市 --</option>");
			// 遍历json，json数组中每一个json，都对应一个省的信息，都应该在省的下拉列表框下面添加一个<option>
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#city2").append(option);
			}
		}
	});
}

function changeDistrict2() {
	// 当城市的内容发生变化的时候，相应的改变城市的隐藏域的值
	$("#chidden2").val($("#city2 option:selected").html());
}

/**品牌下拉列表搜索框,bootstrap-select插件,和模板冲突作废
 */
///*$(window).on('load', function() {
//
//	$('.selectpicker').selectpicker({
//		'selectedText' : 'cat',
//		width : 'calc(100% - 0px)'
//	});
//	// $('.selectpicker').selectpicker('hide');
//});*/

/**品牌车系车型三级联动
*/


/**  品牌
 */
$(function() {
	$.ajax({
		type : "POST",
		url : "sellServlet",
		data:{
			actionName:"brand"
		},
		dataType : "json",
		success : function(result) {			
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#id_select").append(option);
			}
			$('.selectpicker').selectpicker('refresh'); 
			$('.selectpicker').selectpicker('render'); 
		}
	});
});
/**
 * 车系
 */
function changeSeries() {
	// 下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
	var brandId = $("#id_select").val();
	$.ajax({
		url : "sellServlet",
		data : {
			actionName:"series",
			brandId:brandId
		},
		dataType : "json",
		success : function(result) {
			// 清空系列下拉列表框的内容
			$("#series").html("<option value=''>-- 请选择车系 --</option>");
			$("#info").html("<option value=''>-- 请选择车型 --</option>");
			// 遍历json，json数组中每一个json，都对应一个省的信息，都应该在省的下拉列表框下面添加一个<option>
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#series").append(option);
			}
		}
	});
}
/**
 * 车型
 */
function changeInfo() {
	// 下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
	var seriesId = $("#series").val();
	$.ajax({
		url : "sellServlet",
		data : {
			actionName:"info",
			seriesId:seriesId
		},
		dataType : "json",
		success : function(result) {
			// 清空下拉列表框的内容
			$("#info").html("<option value=''>-- 请选择车型 --</option>");
			for (var i = 0; i < result.length; i++) {
				var option = "<option value='" + result[i].id + "'>"
						+ result[i].name + "</option>";
				$("#info").append(option);
			}
		}
	});
}

/**
 * 估价或卖车
 **/
function addOrUpdate(valueOrSellId){
	var district = $("#province option:selected").html()+"-"+$("#city option:selected").html()+"-"+$("#district option:selected").html();
	$("#districthid").val(district);
	console.log(district);
	var regcity = $("#province2 option:selected").html()+"-"+$("#city2 option:selected").html();
	$("#city2hid").val(regcity);
	console.log(regcity);
	var carinfoId = $("#info").val(); 
	var carinfo = $("#id_select option:selected").html()+"-"+$("#series option:selected").html()+"-"+$("#info option:selected").html();
	$("#infohid").val(carinfo);
	console.log(carinfo);
	var regdate = $("#regdate").val();
	var mileage = $("#mileage").val();
	var carcondition = $("#carcondition").val();
	var price = $("#price").val();
	if(isEmpty(district)){
		$("#msg").html("请选择车辆所在地");
		return;
	}
	if(isEmpty(regcity)){
		$("#msg").html("请选择上牌城市");
		return;
	}
	if(isEmpty(carinfoId)){
		$("#msg").html("请选择车型");
		return;
	}
	if(isEmpty(regdate)){
		$("#msg").html("请选择上牌日期");
		return;
	}
	if(isEmpty(mileage)){
		$("#msg").html("请选择行驶里程数");
		return;
	}
	if(isEmpty(carcondition)){
		$("#msg").html("请选择车况");
		return;
	}
	if(isEmpty(price)){
		$("#msg").html("请选择价格");
		return;
	}
	if(valueOrSellId==0){
		//估价
		carvalue(district,regcity,carinfo,carinfoId,regdate,mileage,carcondition);
		return;
	}
	if(valueOrSellId==1){
		//卖车
		$("#addOrUpdateForm").submit();
	}
}
/**
 * 估价
 * @param districtId
 * @param regcityId
 * @param carinfoId
 * @param regdate
 * @param mileage
 * @param carcondition
 */
function carvalue(district,regcity,carinfo,carinfoId,regdate,mileage,carcondition){
	$.ajax({
		type:"post",
		url:"sellServlet",
		data:{
			actionName:"carvalue",
			district:district,
			regcity:regcity,
			carinfo:carinfo,
			carinfoId:carinfoId,
			regdate:regdate,
			mileage:mileage,
			carcondition:carcondition,		
		},
		success:function(result){
			if(result.code==1){
				$("#msgModal").html("您的爱车价值："+result.result+"万元");
				$("#valueModal").modal("show");
			}else{
				$("#msgModal").html(result.msg);
				$("#valueModal").modal("show");
			}
		}
	});	
}
/**
 * 模态框卖车按钮点击事件函数，提交卖车信息
 */
function toSell(){
	$("#addOrUpdateForm").submit();
	$("#valueModal").modal("hide");
}
