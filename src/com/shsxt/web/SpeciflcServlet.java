package com.shsxt.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.po.Car;
import com.shsxt.po.Img;
import com.shsxt.service.AdminService;
import com.shsxt.service.BuyCarsService;

/**
 * Servlet implementation class SpeciflcServlet
 */
@WebServlet("/speciflcServlet")
public class SpeciflcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BuyCarsService buyCarsService = new BuyCarsService();
	/**
	 * 根据参数查找数据,跳转到车数据详情页面
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carId = request.getParameter("carId");
		Car car = buyCarsService.getCars(carId);
		Img img = new AdminService().getImageNames(carId);
		request.setAttribute("img", img);
		request.getSession().setAttribute("car", car);
		//动态设置主页包含
		request.setAttribute("changePage", "buy/specific.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
