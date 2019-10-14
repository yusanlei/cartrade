package com.shsxt.util;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * 将字符串通过MD5算法加密
 * @author Lisa Li
 *
 */
public class MD5Util {

	public static String encode(String str) {
		String value = "";
		try {
			// 得到md5加密的算法
			MessageDigest messageDigest = MessageDigest.getInstance("md5");
			// 将字符串通过md5算法加密，返回字节数组
			byte[] bytes = messageDigest.digest(str.getBytes());
			// 通过Base64编码
			value = Base64.encodeBase64String(bytes);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	
	public static void main(String[] args) {
		System.out.println(MD5Util.encode("4QrcOUm6Wau+VuBX8g+IPg=="));
	}
	
}
