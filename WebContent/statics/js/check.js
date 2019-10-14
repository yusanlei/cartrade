function openUpdateDialog(carId) {
	$("#carId").val("");
	$("#detail").val("");
//	给隐藏域车id赋值
	$("#carId").val(carId);
	// 打开模态框
	$("#myModal").modal("show");
//	清空提示信息
	$("#msg").html("");
}

$("#btn_submit").click(function(){
	// 1、获取文本框的值和隐藏域的值
	var detail = $("#detail").val();
	var carId = $("#carId").val();
	
	// 2、判断是否为空（类型名称）
	if (isEmpty(detail)) {
		$("#msg").html("车辆详情不可为空！");
		return;
	}
	
	// 3、发送ajax请求后台，返回code是否成功
	$.ajax({
		type:"post",
		url:"AdminServlet",
		data:{
			actionName:"checkCar",
			carId:carId,
			detail:detail
		},
		success:function(code){
			if (code == 1) {
				swal("","<h3>审核成功</h3>","success");
//				修改Dom操作
				updateDom(carId);
				// 关闭模态框
				$("#myModal").modal("hide");
				
			} else {
				// 失败
				swal("","<h3>审核失败<h3>","error");
			}
		}
	});
	
});

function updateDom(carId) {
//	得到需要修改的dom对象
	var check= $("#check_"+carId);
//	修改数据
	check.text("已审核");
//	禁用按钮
	$("#button_"+carId).prop("disabled",true);
}



