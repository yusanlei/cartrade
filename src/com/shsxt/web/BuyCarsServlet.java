package com.shsxt.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.po.Car;
import com.shsxt.po.User;
import com.shsxt.service.BuyCarsService;
import com.shsxt.util.Page;

/**
 * Servlet implementation class BuyCarsServlet
 */
@WebServlet("/buyCarsServlet")
public class BuyCarsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 分页显示数据
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String actionName = request.getParameter("actionName");
		request.setAttribute("actionName", actionName);
		if ("searchBrand".equals(actionName)) {
			// 搜索品牌
			String brank = request.getParameter("brank");
			request.setAttribute("brank", brank);
			carList(request, response, brank, null, null, null);
		} else if ("searchPrice".equals(actionName)) {
			// 搜索价格
			String b = request.getParameter("b");
			String e = request.getParameter("e");
			request.setAttribute("b", b);
			request.setAttribute("e", e);
			carList(request, response, null, b, e, null);
		} else if ("searchRegdate".equals(actionName)) {
			// 搜索年限
			String regdate = request.getParameter("regdate");
			request.setAttribute("searchRegdate", regdate);
			carList(request, response, null, null, null, regdate);
		} else {
			carList(request, response, null, null, null,null);
		}

	}

	private void carList(HttpServletRequest request, HttpServletResponse response, String brank, String b,
			String e,String regdate) throws ServletException, IOException {
		// 1、得到分页参数（当前页pageNum、每页显示的数量pageSize）
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		// 2、调用Service层查询方法，返回Page对象
		Page<Car> page = new BuyCarsService().findNoteByPage(pageNum, pageSize, brank, b, e,regdate);
		// 3、将Page对象设置到作用域中
		request.setAttribute("page", page);
		// 动态设置主页包含
		request.setAttribute("changePage", "buy/buy.jsp");
		// 请求转发到首页
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}
}
