package com.shsxt.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101300674624";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDTaJB9iHwZ9yCBhm0LFefTWQ+00DkZHqXtHf5lEhuljjIHkhCG7oWzL45lo3ZvWJy4FWlbYJzgRFsjdEEDJAKMSN/VH0QvAJfXqbpg182HfSQHM+bo297yZIBNhEn5H/B78kBEJ0Gr3i8SNtjaQxKwqGrOiLT0mXELEB6VEghwKuEgGEfrA1l1jlqVggHUAmqPO7OTj3H7ZT9rf7BjAz4BQIo3Yg6SLUH33g7We+R9v/Abbl1Rc3RDbk0sfYTeNf1MOQc1i7CKP5T4/bMgQTYlihqF1h4rmTQiPn/fJAM7BQwnba7b5o2Zst2yxsHGGJIo84SCjhZjHnwTVSsvn/bFAgMBAAECggEADVhXbqUz+EuiUKrUrVN3q96+YBKY2B4YKUywZ17qQdwlCldNFcduxy3kVkQoUMUON4yadvs1S+7ktes7w1/9jS94ebKckj7+Vs3PBxf4UGo04QOEuwROIYz4kGweY0yB2MElD2hO+/Ntkz/FFpoPTvmCrIDys1IQUbt1wsE9qR7ebYyekEj5bF6arHyKP5vSkNU2ISw53cqmj++s44KYLlP/1jTTEGy82fOWukD6KvenR3aQeiu3/UMk3RcpGCJs/xnMFImR/lRDZFvKXS2QxIqZ/KOcdUXIkbzwojBJmBGc47GE1+Pk5+Bs+8WefdfIAn7f/7SBw1TC3lXVqlBHjQKBgQDxAwmITmu06qgzQ/A1ubsMCPn6RwfO6UKDNycaFkLGkVmoAa5/z9qQvBwO0ICpJ39PQQsVrV3pkMy91BE/1N6rhNs1dApIup+tEz7opvjzUb7w02A9s+ruhxIRjtEiSl0IEDrcEaWFPCLVejuODQSa7A4ddyFkk1q52r5uhefFdwKBgQDgjjv56LvsPauco3x3AfSP7S2NlmSsCt0Y/TIbs/BRwbJmEIg5eOINdGnHOgqNVQahhsv8SWq9z/RJWAzWn44TXtzpMBuUP112nhOFycsUeN5AVJzLMBHo0JtcHOfmjJUlHau0cXi84qWy7+uoVttK0khxV8ECRDEHBrs/GRukowKBgQCYXpwzMakEaupF5ujBfpeTh0VLBocYN/5V6JNu+a3jzdbJ0a5ZnbYHlPWEJCuDRbZGC9APN1jNJj9ar+zr1w+jjk3sIF20F1CF4kn+Wjm/0umNZYVN3SZlAL3andj3/d2NEH21ze5AKoG3RxzJtM85ho1x8XQKGuLb50BHrZ6XBwKBgBzokrYQjSjTo6UtstdLTCW/Pe8NXnZ7i40tA2dnmdecnQ/grvjfJBLhWsDIKxWYzZq71MTs2q4G+Ib8q+JxdgPuYXgvtk02fxzHKvI9UUSYbtxPSEQsMxIK0QVhv0UB8i1uDW3Ucdu3Pee0VV09mUufmK3mwzU8fCdQaYis/c8LAoGAcLcM/+u0Fj+7KMhedNItuTejD58MkHdbUyTHIKlLGSk3zBIdy1NkjAB7C5y3YVA54AXYUsKN2KL/jtDSPq4MT5X9QloGMuOssLlDlOVBFAUsXCzVF3HZ05oQDvqUFpFO7Q9CHlj70oXYM7HI1Z4BEUL9vXDqIAH7b8iNeUwDzPU=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr5p/n4d6GY7UB+ZlJ7kEY8K6HSKhrAHZIaMjXJxMvRPt+9fLj0qo9aRjx2TpQ5FgCemaiOrj6UvMMnqfoOgOv55A8uswGNOqhT7lEhaifYTCFzNiJ8UOpk8QdI+njIxfLsAeR7UWNBqi2LZKCeVLEV0D1+3al2sFb1pIvtPZ1w5k1FL7buL3OYjdyKua+plserW+wDr+eXjYx9Hwz22hwAn9DvtlQzvVcHNEJS9+5ruEb+BxQYOVdME2+Zj3MvbvhZh3rcni0pa4KIlEtGJTb7veVJFgtBEuhKnDV8XdIa1mXjZAufSr9SNebq8cdjRpq1MWsT6ytbXNoWG0Dx5BUQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/cartrade/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/cartrade/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\test";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

