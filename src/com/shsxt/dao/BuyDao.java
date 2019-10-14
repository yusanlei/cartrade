package com.shsxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shsxt.util.JDBCUtil;

public class BuyDao {

	public Integer createOrder(String sellerId, Integer buyerId, String carId, String price) {
		int key = 0;
		int row = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JDBCUtil.getConnection();
			String sql = "insert into tb_order(sellerId,buyerId,carId,price,createdate) values(?,?,?,?,now())";
			preparedStatement=connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setObject(1, sellerId);
			preparedStatement.setObject(2, buyerId);
			preparedStatement.setObject(3, carId);
			preparedStatement.setObject(4, price);
			row = preparedStatement.executeUpdate();
			if (row>0) {
				resultSet=preparedStatement.getGeneratedKeys();
				if (resultSet.next()) {
					key=resultSet.getInt(1);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JDBCUtil.close(resultSet, preparedStatement, connection);
		}
		System.out.println("key:"+key);
		return key;
	}
	/**
	 * 设置订单支付完成,设置车辆状态为已售出
	 * @param orderId
	 * @return
	 */
	public int setStatus(String orderId) {
		int row = 0;
		String sql = "update tb_order set status=1,paydate=now() where orderId=?";
		List<Object> params = new ArrayList<>();
		params.add(orderId);
		row = BaseDao.executeUpdate(sql, params);
		sql = "update tb_car set status=3 where carId = (select carId from tb_order where orderId = ?)";
		row += BaseDao.executeUpdate(sql, params);
		return row;
	}
	
	
}
