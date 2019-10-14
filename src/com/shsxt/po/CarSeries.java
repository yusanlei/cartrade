package com.shsxt.po;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CarSeries {
	
	/*public static void main(String[] args) throws ParseException {
		String regdate1 = "2019-06"+"-01";
		Date regdate = new SimpleDateFormat("yyyy-MM-dd").parse(regdate1);
		Date date = new Date();	
		long time = date.getTime()-regdate.getTime();
		System.out.println(time);
		DecimalFormat df = new DecimalFormat("0.00");
		double year = time/365/24/60/60/1000;
		System.out.println(year);
		Double valuePrice = 400000/10000*0.8*Math.pow(0.9, year);
		System.out.println(df.format(valuePrice));
	}*/
	
	private Integer id;
	private Integer groupId;
	private Integer brandId;
	private String fullname;
	private String name;
	private String firstletter;
	private Integer seriesstate;
	private Integer seriesorder;
	public CarSeries() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the groupId
	 */
	public Integer getGroupId() {
		return groupId;
	}
	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	/**
	 * @return the brandId
	 */
	public Integer getBrandId() {
		return brandId;
	}
	/**
	 * @param brandId the brandId to set
	 */
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	/**
	 * @return the fullName
	 */
	public String getFullname() {
		return fullname;
	}
	/**
	 * @param fullname the fullname to set
	 */
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the firstletter
	 */
	public String getFirstletter() {
		return firstletter;
	}
	/**
	 * @param firstletter the firstletter to set
	 */
	public void setFirstletter(String firstletter) {
		this.firstletter = firstletter;
	}
	/**
	 * @return the seriesstate
	 */
	public Integer getSeriesstate() {
		return seriesstate;
	}
	/**
	 * @param seriesstate the seriesstate to set
	 */
	public void setSeriesstate(Integer seriesstate) {
		this.seriesstate = seriesstate;
	}
	/**
	 * @return the seriesorder
	 */
	public Integer getSeriesorder() {
		return seriesorder;
	}
	/**
	 * @param seriesorder the seriesorder to set
	 */
	public void setSeriesorder(Integer seriesorder) {
		this.seriesorder = seriesorder;
	}
	
	
}
