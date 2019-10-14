package com.shsxt.util;

public class StringUtil {
	
	//非空判断
	public static boolean isEmpty(String str){
		if (str==null||"".equals(str.trim())) {
			return true;
		}
		return false;
	}
}
