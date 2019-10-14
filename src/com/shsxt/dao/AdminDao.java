package com.shsxt.dao;

import java.util.ArrayList;
import java.util.List;

import com.shsxt.po.Car;
import com.shsxt.po.Img;
import com.shsxt.po.Order;

public class AdminDao {



	public long fondCarCount() {
		String sql= "select count(1) from tb_car where status = 0";
		long count = (long) BaseDao.findSingValue(sql,null);
		return count;
	}

	public List<Car> findCarByPage(Integer index, Integer pageSize) {
		String sql ="select carId,sellerId,submitdate from tb_car where status = 0 ORDER BY submitdate limit ?,? ";
		List<Object> params =new ArrayList<>();
		params.add(index);
		params.add(pageSize);
		List<Car> list = BaseDao.queryRows(sql, params, Car.class);
		return list;
	}

	
	public int addDetail(String carId, String detail) {
		String  sql ="insert into tb_detail (carId,detail) VALUES (?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(carId);
		params.add(detail);
		
		int row = BaseDao.executeUpdate(sql, params);
		return row;
	}

	public int updateCarStatus(String carId) {
		String sql = "update tb_car set status =1 ,selltime=NOW() where carId = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(carId);
		int row = BaseDao.executeUpdate(sql, params);
		return row;
	}

	public Img getImageNames(String carId) {
		String sql ="select * from tb_img where carId = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(carId);
		Img img = (Img) BaseDao.queryRow(sql, params, Img.class);
		return img;
	}

	
	public long fondOrderCount() {
		String sql= "select count(1) from tb_order";
		long count = (long) BaseDao.findSingValue(sql,null);
		return count;
	}

	public List<Order> findOrderByPage(Integer index, Integer pageSize) {
		String sql ="select orderId,sellerId, buyerId,price,createdate,status from tb_order order by createdate  limit ?,? ";
		List<Object> params =new ArrayList<>();
		params.add(index);
		params.add(pageSize);
		List<Order> list = BaseDao.queryRows(sql, params, Order.class);
		return list;
	}

}
