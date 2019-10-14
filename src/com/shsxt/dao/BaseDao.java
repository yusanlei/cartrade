package com.shsxt.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.shsxt.util.JDBCUtil;

/**
 * 基础的JDBC操作类
  		更新操作（添加、修改、删除）
  		查询操作
  			1、查询某一个字段 （只会返回一条记录且只有一个字段；常用场景：查询总数量）
  			2、查询集合
  			3、查询某个对象
 * @author Lisa Li
 *
 */
public class BaseDao {

	/**
	 	更新操作
  			添加、修改、删除
  				1、得到数据库连接
  				2、预编译
  				3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
  				4、执行更新，返回的受影响的行数
  				5、关闭资源
  				注：需要两个参数：sql语句、所需参数集合
	 * @return
	 */
	public static int executeUpdate(String sql, List<Object> params) {
		int row = 0; // 受影响的行数
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// 1、得到数据库连接
			connection = JDBCUtil.getConnection();
			// 2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
			if (params != null && params.size() > 0) {
				// 遍历设置参数
				for(int i = 0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
			// 4、执行更新，返回的受影响的行数
			row = preparedStatement.executeUpdate();		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			JDBCUtil.close(null, preparedStatement, connection);
		}
		return row;
	}
	
	
	/**
	 * 1、查询某一个字段 （只会返回一条记录且只有一个字段；常用场景：查询总数量）
		 * 	1、得到数据库连接
			2、预编译
			3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
			4、执行查询，返回resultSet结果集
			5、判断并分析结果集，得到结果集中的第一个字段（下标1）
			6、关闭资源
			注：需要两个参数：sql语句、所需参数集合
	 * @param sql
	 * @param params
	 * @return
	 */
	public static Object findSingValue(String sql, List<Object> params){
		Object object = null;
		Connection connection = null;
		PreparedStatement preparedStatement =  null;
		ResultSet resultSet = null;

		try {
			// 1、得到数据库连接
			connection = JDBCUtil.getConnection();
			// 2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
			if (params != null && params.size() > 0) {
				// 遍历设置参数
				for(int i = 0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
			// 4、执行查询，返回resultSet结果集
			resultSet = preparedStatement.executeQuery();
			// 5、判断并分析结果集，得到结果集中的第一个字段（下标1）
			while (resultSet.next()) {
				object = resultSet.getObject(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			JDBCUtil.close(resultSet, preparedStatement, connection);
		}
		return object;
	}
	
	
	/**
	 *  1、得到数据库连接
		2、预编译
		3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
		4、执行查询，返回resultSet结果集
		5、得到结果集的元数据对象 （查询的字段数量及查询了哪些字段）
		6、判断并分析结果集
			7、实例化对象
			8、遍历查询的字段数量，得到数据库中每一个列名
			9、通过反射，使用列名得到对应的filed对象
			10、拼接set方法，字符串
			11、通过反射，将set方法的字符串反射成类中的指定set方法
			12、通过invoke调用方法
			13、将对应的JavaBean设置到集合中
		14、关闭资源
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List queryRows(String sql, List<Object> params, Class cls) {
		
		List list = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement =  null;
		ResultSet resultSet = null;

		try {
			// 1、得到数据库连接
			connection = JDBCUtil.getConnection();
			// 2、预编译
			preparedStatement = connection.prepareStatement(sql);
			// 3、如果有参数，则设置参数，下标从1开始（数组或集合，循环设置参数）
			if (params != null && params.size() > 0) {
				// 遍历设置参数
				for(int i = 0; i < params.size(); i++) {
					preparedStatement.setObject(i+1, params.get(i));
				}
			}
			// 4、执行查询，返回resultSet结果集
			resultSet = preparedStatement.executeQuery();
			
			// 	5、得到结果集的元数据对象 （查询的字段数量及查询了哪些字段）
			ResultSetMetaData metaData = resultSet.getMetaData();
			//  得到查询到的列数
			int fieldNum = metaData.getColumnCount();
			
			// 6、判断并分析结果集
			while(resultSet.next()) {
				// 7、实例化对象
				Object object = cls.newInstance();
				// 8、遍历查询的字段数量，得到数据库中每一个列名
				for(int i = 1; i <= fieldNum; i++) {
					// 得到查询的每一个列名   getColumnLabel():获取列名或别名    getColumnName()：获取列名
					String columnName = metaData.getColumnLabel(i); // userId
					// 9、通过反射，使用列名得到对应的filed对象
					Field field = cls.getDeclaredField(columnName);
					// 10、拼接set方法，字符串
					String setMethod = "set" + columnName.substring(0,1).toUpperCase() + columnName.substring(1);
					// 11、通过反射，将set方法的字符串反射成类中的指定set方法
					Method method = cls.getDeclaredMethod(setMethod, field.getType());
					// 12、通过invoke调用方法
					// 得到设置的值
					Object ob = resultSet.getObject(columnName);
					method.invoke(object, ob);
				}
				// 13、将对应的JavaBean设置到集合中
				list.add(object);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			JDBCUtil.close(resultSet, preparedStatement, connection);
		}
		
		return list;
	}
	
	/**
	 * 查询对象
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static Object queryRow(String sql, List<Object> params, Class cls) {
		List list = queryRows(sql, params, cls);
		Object object = null;
		if (list != null && list.size() > 0) {
			object = list.get(0);
		}
		return object;
	}
	
	
	
}
