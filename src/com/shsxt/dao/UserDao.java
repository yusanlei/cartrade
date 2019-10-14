package com.shsxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shsxt.po.Car;
import com.shsxt.po.Order;
import com.shsxt.po.User;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.util.JDBCUtil;
import com.shsxt.util.MD5Util;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class UserDao {
	
	
	/**
	 * 通过用户名查询数据库返回User对象
	 * @param uname
	 * @return
	 */
	public User findUserByUname(String uname) {
		String sql = "SELECT * FROM TB_USER WHERE UNAME = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(uname);
		User user = (User) BaseDao.queryRow(sql, params, User.class);
		return user;
	}
	
	//测试JDBC
	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		System.out.println(userDao.findUserByUname("admin"));
	}
	
	//修改用户信息，返回受影响的行数
	public int updateInfo(User user) {
		int row = 0;
		//1、定义sql语句

		//2、定义参数集合
		
		//3、调用BaseDdao层的更新方法，返回受影响的行数

		return row;
	}
	/**
	 * 用户注册
	 * @param uname
	 * @param upwd
	 * @param phonenum
	 * @return
	 */
	public int userRegister(String uname, String upwd, String phonenum) {
		int row = 0;
		upwd = MD5Util.encode(MD5Util.encode(upwd));
		String sql = "insert into tb_user(uname,upwd,phonenum) values(?,?,?)";
		List<Object> params = new ArrayList<>();
		params.add(uname);
		params.add(upwd);
		params.add(phonenum);
		row = BaseDao.executeUpdate(sql, params);
		return row;
	}

	/*
	 * 根据用户id查询正在出售的车辆
	 */
	public List<Car> getCarInfoByUserId(Integer index, Integer pageSize, Integer userId) {
		//准备sql语句
		String sql = "SELECT * FROM TB_CAR WHERE SELLERID = ? AND STATUS = 1 ORDER BY SELLTIME DESC LIMIT ?,?";
		
		//设置参数集合
		List<Object> params = new ArrayList();
		params.add(userId);
		params.add(index);
		params.add(pageSize);
		//调用Dao层,返回结果集
		List<Car> carInfo =BaseDao.queryRows(sql, params, Car.class);
		
		return carInfo;
	}

	/*
	 * 查询当前用户下正在熟手的车辆数量
	 */
	public long findCountByUserId(Integer userId) {
		//准备sq语句
		String sql = "SELECT COUNT(CARID) FROM TB_CAR WHERE SELLERID = ? AND STATUS = 1;";
		
		//设置参数集合
		List<Object> params = new ArrayList();
		params.add(userId);
		
		//调用Dao层查询,并返回结果
		long DataCount = (long) BaseDao.findSingValue(sql, params);
		
		
		return DataCount;
	}

	/*
	 * 下架当前用户正在出售的车辆
	 */
	public Integer deleteCarInfo(String carId) {
		//准备sql语句
		String sql = "DELETE FROM TB_CAR WHERE CARID = ?";
		//设置参数集合
		List<Object> params = new ArrayList();
		params.add(carId);
		
		//调用dao层,返回受影响的行数
		Integer code = BaseDao.executeUpdate(sql, params);
		
		return code;
	}

	/*
	 * 我的订单
	 */
	public List<Order> getMyIndent(Integer userId) {

		//准备sql语句
		String sql = "select orderId,carinfo,c.price,paydate,phonenum from tb_order o INNER JOIN tb_car c on o.carId = c.carId  INNER JOIN tb_user u on o.carId = c.carId  where buyerId = ? and o.status = 1 and c.sellerId = userId";
		//准备参数集合
		List<Object> params = new ArrayList();
		params.add(userId);
		
		//调用dao层查询
		List<Order> order = BaseDao.queryRows(sql, params, Order.class);
		
		return order;
	}

	
	

	
}
