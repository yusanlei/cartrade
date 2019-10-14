package com.shsxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shsxt.po.CarBrand;
import com.shsxt.po.CarInfo;
import com.shsxt.po.CarSeries;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.util.JDBCUtil;
import com.shsxt.util.StringUtil;

public class SellDao {
	
	/**
	 * 品牌列表
	 * @return
	 */
	public List<CarBrand> findCarBrand() {
		List<CarBrand> list = new ArrayList<CarBrand>();
		String sql = "select * from tb_car_brand order by firstletter";
		list = BaseDao.queryRows(sql, null, CarBrand.class);
		return list;
	}
	/**
	 * 根据品牌查车系列表
	 * @param brandId
	 * @return
	 */
	public List<CarSeries> findCarSeriesByBrandID(String brandId) {
		List<CarSeries> list = new ArrayList<>();
		String sql = "select * from tb_car_series where brandId = ? order by firstletter";
		List<Object> params = new ArrayList<>();
		params.add(brandId);
		list = BaseDao.queryRows(sql, params, CarSeries.class);
		return list;
	}
	
	/**
	 * 根据车系查车型列表
	 * @param seriesId
	 * @return
	 */
	public List<CarInfo> findCarInfoBySeriesId(String seriesId) {
		List<CarInfo> list = new ArrayList<>();
		String sql = "select * from tb_car_info where seriesId = ? order by year";
		List<Object> params = new ArrayList<>();
		params.add(seriesId);
		list = BaseDao.queryRows(sql, params, CarInfo.class);
		return list;
	}
	/**
	 * 估价，根据carinfoId查询价格
	 * @param carinfoId
	 * @return
	 */
	public Integer findPriceByCarinfoId(String carinfoId) {
		Integer price = 0;
		String sql = "select maxprice from tb_car_info where id = ?";
		List<Object> params = new ArrayList<>();
		params.add(carinfoId);
		price = (Integer) BaseDao.findSingValue(sql, params);
		return price;
	}
	/**
	 * 卖车
	 * @param districtId
	 * @param regcityId
	 * @param carinfoId
	 * @param regdate
	 * @param mileage
	 * @param condition
	 * @param price
	 * @return
	 */
	public int addOrUpdateCar(String district, String regcity, String carinfoId, String carinfo, String regdate, String mileage,
			String carcondition,Integer sellerId,String carId,String price) {
		int row = 0;
		int key = 0;
		String sql = "";
		List<Object> params = new ArrayList<>();
		params.add(sellerId);
		params.add(price);
		params.add(regdate);
		params.add(regcity);
		params.add(district);
		params.add(mileage);
		params.add(carcondition);
		params.add(carinfo);
		params.add(carinfoId);
		if (StringUtil.isEmpty(carId)) {
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			try {
				connection = JDBCUtil.getConnection();
				sql = "insert into tb_car(sellerId,price,regdate,regcity,submitdate,district,mileage,carcondition,carinfo,carinfoId) values(?,?,?,?,now(),?,?,?,?,?)";
				preparedStatement=connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				preparedStatement.setObject(1, sellerId);
				preparedStatement.setObject(2, price);
				preparedStatement.setObject(3, regdate);
				preparedStatement.setObject(4, regcity);
				preparedStatement.setObject(5, district);
				preparedStatement.setObject(6, mileage);
				preparedStatement.setObject(7, carcondition);
				preparedStatement.setObject(8, carinfo);
				preparedStatement.setObject(9, carinfoId);
				row = preparedStatement.executeUpdate();
				if (row>0) {
					resultSet=preparedStatement.getGeneratedKeys();
					if (resultSet.next()) {
						key=resultSet.getInt(1);
					}
				}
				return key;
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				JDBCUtil.close(resultSet, preparedStatement, connection);
			}
			
		}else {
			sql = "update tb_car set sellerId=?,price=?,regdate=?,regcity=?,submitdate=now(),district=?,mileage=?,carcondition=?,carinfo=?,carinfoId=? where carId=?";
			params.add(carId);
			row = BaseDao.executeUpdate(sql, params);						
			return row;
		}
		return row;		
		
	}
	/**
	 * 查询卖出的汽车数量
	 * @return
	 */
	public Long sellcount() {
		String sql = "select count(1) from tb_order where status=1";
		Long count = (Long) BaseDao.findSingValue(sql, null);
		return count;
	}
	/**
	 * 添加汽车图片
	 * @param iname1
	 * @param iname2
	 * @param iname3
	 * @param iname4
	 * @return
	 */
	public int addCarImg(String[] arr,String carId) {
		int row = 0;
		String sql = "insert into tb_img(carId,iname1,iname2,iname3,iname4) values(?,?,?,?,?)";
		List<Object> params = new ArrayList<>();
		params.add(carId);
		for (int i = 0; i < arr.length; i++) {						
			params.add(arr[i]);	
		}
		row = BaseDao.executeUpdate(sql, params);
		return row;
	}
		

}
