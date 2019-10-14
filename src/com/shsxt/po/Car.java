package com.shsxt.po;

import java.util.Date;

public class Car {
	private String name;
	private Integer id;
	private Integer carId;
	private Integer sellerId;
	private Double price;
	private Date regdate;
	private String regcity;
	private Date submitdate;
	private String district;
	private Double mileage;
	private Integer carcondition;
	private Integer status;
	private Date selltime;
	private String carinfo;
	private Integer carinfoId;
	
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the carId
	 */
	public Integer getCarId() {
		return carId;
	}
	/**
	 * @param carId the carId to set
	 */
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	/**
	 * @return the sellerId
	 */
	public Integer getSellerId() {
		return sellerId;
	}
	/**
	 * @param sellerId the sellerId to set
	 */
	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(Double price) {
		this.price = price;
	}
	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}
	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	/**
	 * @return the regcityId
	 */
	public String getRegcity() {
		return regcity;
	}
	/**
	 * @param regcityId the regcityId to set
	 */
	public void setRegcity(String regcity) {
		this.regcity = regcity;
	}
	/**
	 * @return the submitdate
	 */
	public Date getSubmitdate() {
		return submitdate;
	}
	/**
	 * @param submitdate the submitdate to set
	 */
	public void setSubmitdate(Date submitdate) {
		this.submitdate = submitdate;
	}
	/**
	 * @return the districtId
	 */
	public String getDistrict() {
		return district;
	}
	/**
	 * @param districtId the districtId to set
	 */
	public void setDistrict(String district) {
		this.district = district;
	}
	/**
	 * @return the mileage
	 */
	public Double getMileage() {
		return mileage;
	}
	/**
	 * @param mileage the mileage to set
	 */
	public void setMileage(Double mileage) {
		this.mileage = mileage;
	}
	/**
	 * @return the carcondition
	 */
	public Integer getCarcondition() {
		return carcondition;
	}
	
	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * @return the selltime
	 */
	public Date getSelltime() {
		return selltime;
	}
	/**
	 * @param selltime the selltime to set
	 */
	public void setSelltime(Date selltime) {
		this.selltime = selltime;
	}
	/**
	 * @return the carinfoId
	 */
	public String getCarinfo() {
		return carinfo;
	}
	/**
	 * @param carinfoId the carinfoId to set
	 */
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	/**
	 * @return the carinfoId
	 */
	public Integer getCarinfoId() {
		return carinfoId;
	}
	/**
	 * @param carinfoId the carinfoId to set
	 */
	public void setCarinfoId(Integer carinfoId) {
		this.carinfoId = carinfoId;
	}
	/**
	 * @param carcondition the carcondition to set
	 */
	public void setCarcondition(Integer carcondition) {
		this.carcondition = carcondition;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
