package com.shsxt.po;

import java.util.Date;

public class Order {
	private Integer orderId;
	private Integer sellerId;
	private Integer buyerId;
	private Integer carId;
	private Double price;
	private Date createdate;
	private Date paydate;
	private Integer status;
	
	private String phonenum;
	private String carinfo;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	/**
	 * @return the orderId
	 */
	public Integer getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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
	 * @return the buyerId
	 */
	public Integer getBuyerId() {
		return buyerId;
	}
	/**
	 * @param buyerId the buyerId to set
	 */
	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
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
	 * @return the createdate
	 */
	public Date getCreatedate() {
		return createdate;
	}
	/**
	 * @param createdate the createdate to set
	 */
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	/**
	 * @return the paydate
	 */
	public Date getPaydate() {
		return paydate;
	}
	/**
	 * @param paydate the paydate to set
	 */
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
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
	
	
}
