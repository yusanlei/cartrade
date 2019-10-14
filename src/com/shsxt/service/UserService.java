package com.shsxt.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.shsxt.dao.UserDao;
import com.shsxt.po.Car;
import com.shsxt.po.Order;
import com.shsxt.po.User;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.util.MD5Util;
import com.shsxt.util.Page;
import com.shsxt.util.StringUtil;


public class UserService {
	
	private UserDao userDao = new UserDao();
	/**
	 * 用户登录
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public ResultInfo<User> userLogin(String uname,String upwd){
		ResultInfo<User> resultInfo = new ResultInfo();
		User u = new User();
		u.setUname(uname);
		u.setUpwd(upwd);
		resultInfo.setResult(u);
		//1、判断非空
				//如果为空，设置code=0，msg=xxx，设置封装类中的result字段（user对象）
		if (StringUtil.isEmpty(uname)||StringUtil.isEmpty(upwd)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("用户名或密码不能为空");
			return resultInfo;
		}
		//2、调用Dao层，通过用户名查询用户对象，返回user对象
		User user = userDao.findUserByUname(uname);
		//3、判断用户对象是否为空
				//如果为空，设置code=0，msg=xxx，设置封装类中的result字段（user对象）
		if (user==null) {
			resultInfo.setCode(0);
			resultInfo.setMsg("用户名不存在");
			return resultInfo;
		}
		//4、如果不为空，将前台传递的用户密码与后台数据库中查询到的密码作比较（需要先将前台密码按照指定算法加密后再比较）
				//如果密码正确，设置code=1
				//如果密码不正确，设置code=0，msg=xxx，设置封装类中的result字段（user对象）
		upwd = MD5Util.encode(MD5Util.encode(upwd));
		if (upwd.equals(user.getUpwd())) {
			resultInfo.setCode(1);
			resultInfo.setResult(user);
			resultInfo.setMsg("登陆成功");
		}else{
			resultInfo.setCode(0);
			resultInfo.setMsg("密码错误");
		}
		//5、返回resultInfo对象给web层	
		return resultInfo;
	}

	public ResultInfo<User> updateInfo(HttpServletRequest request) throws IOException, ServletException {
		ResultInfo<User> resultInfo = new ResultInfo();
		//1、接收参数（昵称、心情）
		
		//2、非空判断（昵称）
		
		//3、从session作用域中获取用户对象

		//4、得到默认的头像值

		//5、文件上传
			//1、得到Part对象  request.getPart(name); name代表的是文件域的name属性值

			//2、得到上传的文件名

			//3、判断文件名是否为空
	
			//4、如果不为空，得到图片存放的路径，实现文件上传，更新头像的默认值
			
			//5、更新头像的默认值

		
	
		//6、调用Dao层，修改用户信息（昵称、心情、头像、用户ID），返回受影响的行数
		
		//7、判断受影响的行数
		//如果大于0，表示成功，更新session作用域
		//code=1
		//如果不大于0，表示失败
		//code=0，msg=xxx
		
		return resultInfo;
	}
	/**
	 * 用户注册
	 * @param uname
	 * @param upwd
	 * @param phonenum
	 * @return
	 */
	public ResultInfo<User> userRegister(String uname, String upwd, String phonenum) {
		ResultInfo<User> resultInfo = new ResultInfo();
		User u = new User();
		u.setUname(uname);
		u.setPhonenum(phonenum);
		resultInfo.setResult(u);
		if (StringUtil.isEmpty(uname)||StringUtil.isEmpty(upwd)||StringUtil.isEmpty(phonenum)) {
			resultInfo.setCode(0);
			resultInfo.setMsg("用户名、密码和手机号不能为空");
			return resultInfo;
		}
		User user = userDao.findUserByUname(uname);
		if (user!=null) {
			resultInfo.setCode(0);
			resultInfo.setMsg("该用户名已存在");
			return resultInfo;
		}
		int row = userDao.userRegister(uname,upwd,phonenum);
		if (row>0) {
			//注册成功
			resultInfo.setResult(u);
			resultInfo.setCode(1);
		}else {
			//注册失败
			resultInfo.setCode(0);
			resultInfo.setMsg("注册失败，请稍后重试");
			resultInfo.setResult(u);
		}
		return resultInfo;
	}

	public Page<Car> getCarInfoByUserId(String pageNumStr, String pageSizeStr, Integer userId) {
		
		//设置当前页及每页查询数量的默认值
		Integer pageNum = 1;
		Integer pageSize = 10;
		
		//当当前页不为默认值时,设置当前页的值为传入的值
		if(!StringUtil.isEmpty(pageNumStr)){
			pageNum = Integer.parseInt(pageNumStr);
		}
		
		//当前太传入每页显示数量时,这是默认每页显示数量为前台传入的值
		if(!StringUtil.isEmpty(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		//调用Dao查询当前用户下正在出售的车辆数量
		long CarCount = userDao.findCountByUserId(userId);
		
		Page<Car> page = new Page(pageNum,pageSize,CarCount);
		
		//查询索引
		Integer index = (pageNum-1)*pageSize;
		//调用dao层查询当前用户正在出售的车辆列表
		List<Car> carList = userDao.getCarInfoByUserId(index,pageSize,userId);
		
		//将列表信息设置到page
		page.setDataList(carList);
		
		return page;
	}

	/*
	 * 下架用户正在出售的车辆
	 */
	public Integer deleteCarInfo(String carId) {
		Integer code = 0;
		//如果车辆不存在,则返回0
		if(StringUtil.isEmpty(carId)){
			return code;
		}
		//调用dao层,返回受影响的行数
		code = userDao.deleteCarInfo(carId);
		
		return code;
	}

	/*
	 * 我的订单
	 */
	public List<Order> getMyIndent(Integer userId) {
		
		if(userId > 0){
			//调用Dao层,返回结果集对象
			List<Order> order = userDao.getMyIndent(userId);
			return order;
		}
		return null;
	}
}
