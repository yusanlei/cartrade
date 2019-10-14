package com.shsxt.service;

import com.shsxt.dao.BuyDao;
import com.shsxt.po.Order;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.util.StringUtil;

public class BuyService {

	private BuyDao buyDao = new BuyDao();
	/**
	 * 创建订单
	 * @param sellerId
	 * @param buyerId
	 * @param carId
	 * @param price
	 * @return
	 */
	public ResultInfo<Integer> createOrder(String sellerId, Integer buyerId, String carId, String price) {
		ResultInfo<Integer> resultInfo = new ResultInfo<>();
		System.out.println(sellerId);
		System.out.println(buyerId);
		System.out.println(carId);
		System.out.println(price);
		if (StringUtil.isEmpty(sellerId)||StringUtil.isEmpty(carId)||StringUtil.isEmpty(price)) {
			System.out.println("空值");
			resultInfo.setCode(0);
			return resultInfo;
		}
		if (sellerId.equals(buyerId.toString())) {
			System.out.println("非法购买");
			resultInfo.setCode(0);
			return resultInfo;
		}
		Integer key = buyDao.createOrder(sellerId,buyerId,carId,price);
		if (key>0) {
			resultInfo.setCode(1);
			resultInfo.setResult(key);
		}else{
			resultInfo.setCode(0);
		}
		return resultInfo;
	}
	
	/**
	 * 设置订单状态为支付完成,,设置车辆状态为已售出
	 * @param orderId
	 */
	
	
	public void setStatus(String orderId) {
		int row = buyDao.setStatus(orderId);
		if (row>1) {
			System.out.println("设置成功");
		}else {
			System.out.println("失败");
		}
	}
}
