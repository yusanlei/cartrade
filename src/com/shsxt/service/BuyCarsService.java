package com.shsxt.service;

import java.util.List;

import com.shsxt.dao.BuyCarsDao;
import com.shsxt.po.Car;
import com.shsxt.util.Page;
import com.shsxt.util.StringUtil;

public class BuyCarsService {
	
	BuyCarsDao buyCarsDao = new BuyCarsDao();
	
	/**
	 * 分页查询汽车列表
	 	1、判断参数，设置分页参数的默认值
		2、调用Dao层，查询当前用户下，车辆的总记录数，返回总数量
		3、判断总记录数是否大于0
		4、得到Page对象
		5、调用Dao层，分页查询当前登录用户下的车辆列表
		6、将车辆列表设置到page对象中
		7、返回page对象
	 * @param brank 
	 * @param pageNum
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public Page<Car> findNoteByPage(String pageNumStr, String pageSizeStr, String brank,String b,String e,String regdate) {
		// 给当前页一个默认值
		Integer pageNum = 1;
		// 如果前台传值为空就使用默认值
		if (!StringUtil.isEmpty(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}

		Integer pageSize = 6;
		if (!StringUtil.isEmpty(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}

		// 数据库查询总数
		long total = buyCarsDao.fondNoteCountByUserId(brank,b,e,regdate);
		// 如果没有数据,返回一个空
		if (total < 1) {
			return null;
		}

		// 获取到page对象
		Page<Car> page = new Page<>(pageNum, pageSize, total);

		// 获取汽车列表的数据
		Integer index = (pageNum - 1) * pageSize;
		List<Car> list = buyCarsDao.findNoteByPage(index, pageSize,brank,b,e,regdate);

		// 把汽车列表存入对象中 返回
		page.setDataList(list);
		return page;
	}

	public Car getCars(String carId) {
		Car car = buyCarsDao.getCarByCarId(carId);
		return car;
	}
}
