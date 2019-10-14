package com.shsxt.service;

import java.util.List;

import com.shsxt.dao.AdminDao;
import com.shsxt.po.Car;
import com.shsxt.po.Img;
import com.shsxt.po.Order;
import com.shsxt.util.Page;
import com.shsxt.util.StringUtil;

public	class AdminService {

	private AdminDao adminDao = new AdminDao();
	
	public Page<Car> findCarByPage(String pageNumStr, String pageSizeStr) {
		// 1、判断参数，设置分页参数的默认值
		Integer pageNum = 1; // 当前页，默认值
		if (!StringUtil.isEmpty(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		Integer pageSize = 4; // 每页显示的数量 默认值
		if (!StringUtil.isEmpty(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		//	查询总数量
		// 2、调用Dao层，查询当前用户下，云记的总记录数，返回总数量
		long total = adminDao.fondCarCount();
		
		// 3、判断总记录数是否大于0
		if (total < 1) {
			return null;
		}
		// 4、得到Page对象
		Page<Car> page = new Page<>(pageNum, pageSize, total);
		
		// 5、调用Dao层，分页查询当前登录用户下的云记列表
		// 得到开始查询的下标
		Integer index = (pageNum - 1) * pageSize;
		List<Car> list = adminDao.findCarByPage(index,pageSize);
		page.setDataList(list);
		return page;
		
	}

//	添加信息
	public Integer addDetail(String carId, String detail) {
//		非空判断
		if (StringUtil.isEmpty(carId)) {
			return 0;
		}if (StringUtil.isEmpty(detail)) {
			return 0;
		}
//		调用dao层添加操作
		int row = adminDao.addDetail(carId,detail);
		return row;
	}

	public Integer updateCarStatus(String carId) {
		int row = adminDao.updateCarStatus(carId);
		return row;
	}

	
	public Img getImageNames(String carId) {
		if (StringUtil.isEmpty(carId)) {
			return null;
		}
		Img img=adminDao.getImageNames(carId);
		return	img;
	}

	
	public Page<Order> findOrderByPage(String pageNumStr, String pageSizeStr) {
		// 1、判断参数，设置分页参数的默认值
		Integer pageNum = 1; // 当前页，默认值
		if (!StringUtil.isEmpty(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		Integer pageSize = 10; // 每页显示的数量 默认值
		if (!StringUtil.isEmpty(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		//	查询总数量
		// 2、调用Dao层，查询当前用户下，云记的总记录数，返回总数量
		long total = adminDao.fondOrderCount();
		
		// 3、判断总记录数是否大于0
		if (total < 1) {
			return null;
		}
		// 4、得到Page对象
		Page<Order> page = new Page<>(pageNum, pageSize, total);
		
		// 5、调用Dao层，分页查询当前登录用户下的云记列表
		// 得到开始查询的下标
		Integer index = (pageNum - 1) * pageSize;
		List<Order> list = adminDao.findOrderByPage(index,pageSize);
		page.setDataList(list);
		return page;
	}
}
