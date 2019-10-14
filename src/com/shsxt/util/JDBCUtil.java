package com.shsxt.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
	private static Properties properties;
	//静态块
	static{
		InputStream in = JDBCUtil.class.getClassLoader().getResourceAsStream("db.properties");
		properties = new Properties();
		try {
			properties.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//获取连接
	public static Connection getConnection(){
		Connection connection = null;
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");
		String name = properties.getProperty("name");
		String pwd = properties.getProperty("pwd");
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, name, pwd);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return connection;
	}
	//关闭
	public static void close(ResultSet resultSet,PreparedStatement preparedStatement,Connection connection){
		
			try {
				if (resultSet!=null) {
					resultSet.close();
				}
				if (preparedStatement!=null) {
					preparedStatement .close();
				}
				if (connection!=null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}
	//测试是否可以获取连接
	/*public static void main(String[] args) {
		System.out.println(JDBCUtil.getConnection());
	}*/
}
