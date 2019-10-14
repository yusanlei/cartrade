package com.shsxt.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.alibaba.fastjson.JSON;
import com.shsxt.dao.UserDao;
import com.shsxt.po.Car;
import com.shsxt.po.Order;
import com.shsxt.po.User;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.service.UserService;
import com.shsxt.util.Page;

/**
 * 用户模块
 */
@WebServlet("/userServlet")
@MultipartConfig
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//判断用户行为，根据行为调用相应的方法
		String actionName = request.getParameter("actionName");
		if ("login".equals(actionName)) {
			//用户登录
			userLogin(request,response);
		}else if ("register".equals(actionName)) {
			//用户注册
			userRegister(request,response);
		}else if ("logout".equals(actionName)) {
			//退出登录
			userLogout(request,response);
		}else if ("userCenter".equals(actionName)) {
			//用户中心
			userCenter(request,response);
		}else if ("mySell".equals(actionName)) {
			//出售列表
			mySell(request,response);
		}else if ("soldOut".equals(actionName)) {
			//下架出售车辆
			soldOut(request,response);
		}else if ("myIndent".equals(actionName)) {
			//我的订单
			myIndent(request,response);
		}
	}
	
	/*
	 * 当前用户订单
	 */
	private void myIndent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取当前用户Id
		User user = (User) request.getSession().getAttribute("user");
		Integer userId = user.getUserId();
		
		//调用service层方法,返回结果集对象
		List<Order> order = userService.getMyIndent(userId);
		
		//将结果集设置到域对象
		request.setAttribute("order", order);
		//动态设置主页包含
		request.setAttribute("changePage", "info.jsp");
		//动态设置个人中心页面包含
		request.setAttribute("userChangePage", "user/myIndent.jsp");
		
		//请求跳转
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
	}

	/*
	 * 下架用户正在出售的车辆
	 */
	private void soldOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取车辆ID及用户ID
		String carId = request.getParameter("carId");
		
		//调用service层,返回受影响的行数
		Integer code = userService.deleteCarInfo(carId);
		
		//将结果传入回调函数
		String json = JSON.toJSONString(code);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.close();
	}

	/*
	 * 用户正在出售的车辆
	 * 
	 */
	private void mySell(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取查询页面及每页查询数量
		String pageSize = request.getParameter("pageSize");
		String pageNum = request.getParameter("pageNum");
		//获取当前用户Id
		User user = (User) request.getSession().getAttribute("user");
		Integer userId = user.getUserId();
		
		//调用service层,返回结果集对象
		Page<Car> page = userService.getCarInfoByUserId(pageNum,pageSize,userId);
		
		//设置carltInfo结果集到域对象
		request.setAttribute("page",page);
		
		//设置主页动态包含内容是个人中心
		request.setAttribute("changePage", "info.jsp");
		
		//设置个人中心动态包含的页面
		request.setAttribute("userChangePage","user/sell.jsp");
		
		//请求跳转至个人中心
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	/**
	 * 用户注册
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void userRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String phonenum = request.getParameter("phonenum");
		ResultInfo<User> resultInfo = userService.userRegister(uname,upwd,phonenum);
		if (resultInfo.getCode()==1) {
			//注册成功
			request.getSession().setAttribute("user", resultInfo.getResult());
			response.sendRedirect("index.jsp");
		}else {
			//注册失败
			request.setAttribute("resultInfo", resultInfo);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}

	
	
	//设置动态包含为个人中心
	private void userCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置动态包含内容是个人中心
		request.setAttribute("changePage", "info.jsp");
		//请求转发到主页
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	//退出登录
	private void userLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//销毁sesion
		request.getSession().invalidate();
		//删除cookie
		Cookie cookie = new Cookie("user", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		//重定向跳转到登录页面
		response.sendRedirect("login.jsp");
		
	}
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//1、接收参数（用户名称、用户密码）
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		//2、调用Service层方法，返回封装类ResultInfo
		ResultInfo<User> resultInfo = userService.userLogin(uname, upwd);
		//3、判断是否登录成功（resultInfo对象中的code；1=成功，0=失败）
			//如果失败code=0，将resultInfo对象存到request作用域中，请求转发跳转到登录页面
			//如果成功code=1，将用户对象设置到session作用域中；判断用户是否选择记住密码，如果是，则将用户信息设置到cookie中；跳转到首页
		if (resultInfo.getCode()==1) {
			request.getSession().setAttribute("user", resultInfo.getResult());
			String rem = request.getParameter("rem");
			if ("1".equals(rem)) {
				Cookie cookie = new Cookie("user", uname+"-"+upwd);
				cookie.setMaxAge(3*24*60*60);
				response.addCookie(cookie);
			}
			//登陆成功跳转到首页
			if ("admin".equals(uname)) {
				response.sendRedirect("AdminServlet");
				return;
			}
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute("resultInfo", resultInfo);
			request.getRequestDispatcher("login.jsp").forward(request, response);;
		}		
	}

}
