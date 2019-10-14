package com.shsxt.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.po.Order;
import com.shsxt.po.User;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.service.BuyService;

/**购买汽车
 * Servlet implementation class Buy
 */
@WebServlet("/buyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BuyService buyService = new BuyService();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		buy(request,response);
	}
	private void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取参数
		String carinfo = request.getParameter("carinfo");
		String carId = request.getParameter("carId");
		String sellerId = request.getParameter("sellerId");
		String price = request.getParameter("price");
		User user = (User) request.getSession().getAttribute("user");
		Integer buyerId = user.getUserId();
		//调用service层方法，创建订单，返回结果
		ResultInfo<Integer> resultInfo = buyService.createOrder(sellerId,buyerId,carId,price);
		if (resultInfo.getCode()==1) {
			//创建订单成功，设置订单信息到域对象中，请求转发到支付页面
			Order order = new Order();
			order.setOrderId(resultInfo.getResult());
			order.setCarId(Integer.parseInt(carId));
			order.setSellerId(Integer.parseInt(sellerId));
			order.setPrice(Double.parseDouble(price)*10000);
			order.setBuyerId(buyerId);
			request.setAttribute("order", order);
			request.setAttribute("carinfo", carinfo);
			request.getRequestDispatcher("index2.jsp").forward(request, response);
		}else{
			//失败跳转到首页
			// 动态设置主页包含
			request.setAttribute("changePage", "index/index.jsp");
			// 请求转发到首页
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
