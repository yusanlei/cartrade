/**
 * 主页js文件
 */


/**
 * 注册点击触发事件  作废
 * 
 */
/*function reg(){
	$("#regOrLog").modal("show");
	$("#modalTitle").html("注册");
	$("#regOrLogin").html("注册");
	$("#regOrLoginChange").html("我要登陆");
}*/
/**
 * 登陆点击触发事件  作废
 * 
 */
/*function login(){
	$("#regOrLog").modal("show");
	$("#modalTitle").html("登录");
	$("#regOrLogin").html("登陆");
	$("#regOrLoginChange").html("还没注册");
}*/


	// 百度地图API功能

	var map = new BMap.Map("bdMapBox");
	var nowCity = new BMap.LocalCity();
	nowCity.get(bdGetPosition);
	function bdGetPosition(result){
		var cityName = result.name; //当前的城市名
		/*自定义代码*/
		$("#loc").html(cityName);
		/*自定义代码*/
	}
