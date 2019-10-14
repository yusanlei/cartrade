package com.shsxt.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.omg.PortableInterceptor.INACTIVE;

import com.shsxt.dao.SellDao;
import com.shsxt.po.Car;
import com.shsxt.po.CarBrand;
import com.shsxt.po.CarInfo;
import com.shsxt.po.CarSeries;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.util.StringUtil;

public class SellService {

	private SellDao sellDao = new SellDao();

	/**
	 * 品牌列表
	 * 
	 * @return
	 */
	public List<CarBrand> findCarBrand() {
		return sellDao.findCarBrand();
	}

	/**
	 * 根据品牌ID查系列
	 * 
	 * @param brandId
	 * @return
	 */
	public List<CarSeries> findCarSeriesByBrandID(String brandId) {
		List<CarSeries> list = sellDao.findCarSeriesByBrandID(brandId);
		return list;
	}

	/**
	 * 根据车系查车型
	 * 
	 * @param seriesId
	 * @return
	 */
	public List<CarInfo> findCarInfoBySeriesID(String seriesId) {
		List<CarInfo> list = sellDao.findCarInfoBySeriesId(seriesId);
		return list;
	}

	/**
	 * 估价
	 * 
	 * @param carinfoId
	 * @param regdate
	 * @param mileage
	 * @param condition
	 * @return
	 * @throws ParseException
	 */
	public ResultInfo<String> carvalue(String carinfoId, String regdate1, String mileage1, String carcondition1) {
		ResultInfo<String> resultInfo = new ResultInfo<>();
		if (StringUtil.isEmpty(carinfoId) || StringUtil.isEmpty(mileage1) || StringUtil.isEmpty(carcondition1)
				|| StringUtil.isEmpty(regdate1)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("车型，里程数，车况，日期不能为空");
			return resultInfo;
		}
		Integer price = sellDao.findPriceByCarinfoId(carinfoId);
		if (price > 0) {
			Double mileage = Double.parseDouble(mileage1);
			Double carcondition = Double.parseDouble(carcondition1);

			try {
				//根据上牌日期获取年限，再根据年限和车况来估价
				Date regdate = new SimpleDateFormat("yyyy-MM-dd").parse(regdate1);
				Date date = new Date();
				long time = date.getTime() - regdate.getTime();
				DecimalFormat df = new DecimalFormat("0.00");
				double year = time / 365 / 24 / 60 / 60 / 1000;
				System.out.println(year);
				Double valuePrice = price / 10000 * 0.8 * Math.pow(0.9, year) * (1 - 0.05 * carcondition);
				resultInfo.setCode(1);
				resultInfo.setResult(df.format(valuePrice));
				return resultInfo;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			resultInfo.setCode(0);
			resultInfo.setMsg("暂未查到此型号价格");
			return resultInfo;
		}
		return resultInfo;

	}

	/**
	 * 卖车提交信息
	 * @param districtId
	 * @param regcityId
	 * @param carinfoId
	 * @param regdate
	 * @param mileage
	 * @param condition
	 * @param sellerId
	 * @return
	 */
	public ResultInfo<Car> sell(String district, String regcity, String carinfoId, String carinfo, String regdate, String mileage,
			String carcondition,Integer sellerId,String carId,String price,String[] arr) {
		ResultInfo<Car> resultInfo = new ResultInfo();
		Car car = new Car();
		car.setDistrict(district);
		car.setRegcity(regcity);
		car.setCarcondition(Integer.parseInt(carcondition));
		car.setCarinfo(carinfo);
		car.setCarinfoId(Integer.parseInt(carinfoId));
		car.setPrice(Double.parseDouble(price));
		try {
			car.setRegdate(new SimpleDateFormat("yyyy-MM-dd").parse(regdate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		car.setMileage(Double.parseDouble(mileage));
		if (!StringUtil.isEmpty(carId)) {
			car.setCarId(Integer.parseInt(carId));
		}
		
		System.out.println(district);
		System.out.println(regcity);
		System.out.println(carinfo);
		System.out.println(carinfoId);
		if (StringUtil.isEmpty(carinfoId)||StringUtil.isEmpty(carinfo) || StringUtil.isEmpty(mileage) || StringUtil.isEmpty(carcondition)
				|| StringUtil.isEmpty(regdate) || StringUtil.isEmpty(district) || StringUtil.isEmpty(regcity)|| StringUtil.isEmpty(price)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("车型，里程数，车况，上牌日期,所在城市，上牌城市，售价,图片不能为空");
			return resultInfo;
		}
		int	row1 = sellDao.addOrUpdateCar(district,regcity,carinfoId,carinfo,regdate,mileage,carcondition,sellerId,carId,price);
		if (StringUtil.isEmpty(carId)&&row1>0) {
			carId=row1+"";
		}
		int row2 = sellDao.addCarImg(arr,carId);
		if (row1>0&&row2>0) {
			resultInfo.setCode(1);
		}else{
			//提交失败设置code为0并设置回写把car对象设置到结果中
			resultInfo.setCode(0);
			resultInfo.setMsg("提交失败，请稍后重试");
			resultInfo.setResult(car);
		}
		return resultInfo;
	}
	/**
	 * 查询卖出汽车数量
	 * @return
	 */
	public ResultInfo<Long> sellcount() {
		ResultInfo<Long> resultInfo = new ResultInfo<>();
		Long count = sellDao.sellcount();
		if (count<1) {
			count=(long) 100000000;
		}
		resultInfo.setResult(count);
		return resultInfo;
	}

}
