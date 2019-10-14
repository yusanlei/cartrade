package com.shsxt.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shsxt.po.Car;

public class BuyCarsDao {

	/**
	 * 查询车数据总数
	 * @param brank 
	 * @return
	 */
	public long fondNoteCountByUserId(String brank,String b,String e,String regdate) {
		String sql = "";
		List<Object> params = new ArrayList<>();
		if(brank != null){
			sql = "select count(1) from (select brandname,status,carId,price,sellerId,regdate,regcity,carinfo from tb_car c join tb_car_info i on c.carinfoId = i.id)car join tb_car_brand b on car.brandname = b.name and name = ? and status = 1";
			params.add(brank);
		}else if (b!=null&&e!=null) {
			sql = "select count(1) FROM tb_car where price between ? and ? and status = 1";
			params.add(b);
			params.add(e);
		}else if (regdate!=null) {			
			sql = "select count(1) FROM tb_car where date_format(regdate,'%Y')=? and status = 1";
			params.add(regdate);
			
		}
		else{
			sql = "select count(1) FROM tb_car where status = 1";
		}
			
			long count = (long) BaseDao.findSingValue(sql, params);
			return count;
	}

	
	/**
	 * 分页
	 * @param index
	 * @param pageSize
	 * @param brank
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Car> findNoteByPage(Integer index, Integer pageSize, String brank,String b,String e,String regdate) {
		String sql = "";
		List<Object> params = new ArrayList<>();
		if(brank != null){
			sql = "select id,name,status,carId,price,sellerId,regdate,regcity,carinfo from (select brandname,status,carId,price,sellerId,regdate,regcity,carinfo from tb_car c join tb_car_info i on c.carinfoId = i.id)car join tb_car_brand b on car.brandname = b.name and name = ? and status = 1 limit ?,?";
			params.add(brank);
		}else if (b!=null&&e!=null) {
			sql = "select status,carId,sellerId,price,regdate,regcity,carinfo from tb_car where price between ? and ? and status = 1 limit ?,?";
			params.add(b);
			params.add(e);
		}else if (regdate!=null) {
			sql = "select status,carId,sellerId,price,regdate,regcity,carinfo from tb_car where date_format(regdate,'%Y')=? and status = 1 limit ?,?";
			params.add(regdate);
		}
		else{
			sql = "select status,carId,sellerId,price,regdate,regcity,carinfo from tb_car where status = 1 limit ?,?";			
		}
		params.add(index);
		params.add(pageSize);
		List<Car> list = BaseDao.queryRows(sql, params, Car.class);
		return list;
	}


	/**
	 * 查询详细数据列表
	 * @param carId
	 * @return
	 */
	public Car getCarByCarId(String carId) {
		String sql = "SELECT carId,price,sellerId,regdate,regcity,carinfo from tb_car where carId = ?";
		List<Object> params = new ArrayList<>();
		params.add(carId);
		Car car = (Car) BaseDao.queryRow(sql, params, Car.class);
		return car;
	}

}
