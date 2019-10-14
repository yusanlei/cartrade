package com.shsxt.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

//把java对象转成json字符串响应给ajax回调函数
public class JsonUtil {
	public static void toJson(HttpServletResponse response,Object object){
		
		try {
			response.setContentType("application/json;charset=UTF-8");
			String json = JSON.toJSONString(object);
			response.getWriter().write(json);
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
