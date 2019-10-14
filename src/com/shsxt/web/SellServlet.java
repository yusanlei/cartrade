package com.shsxt.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shsxt.po.Car;
import com.shsxt.po.CarBrand;
import com.shsxt.po.CarInfo;
import com.shsxt.po.CarSeries;
import com.shsxt.po.User;
import com.shsxt.po.vo.ResultInfo;
import com.shsxt.service.SellService;
import com.shsxt.util.JsonUtil;
import com.shsxt.util.StringUtil;
import com.sun.corba.se.spi.orbutil.fsm.Action;

/**
 * 卖车
 */
@MultipartConfig
@WebServlet("/sellServlet")
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SellService sellService = new SellService();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionName = request.getParameter("actionName");
		if ("brand".equals(actionName)) {
			// 品牌
			brandSelect(request, response);
		} else if ("series".equals(actionName)) {
			// 车系
			seriesSelect(request, response);
		} else if ("info".equals(actionName)) {
			// 车型
			infoSelect(request, response);
		} else if ("valueOrSell".equals(actionName)) {
			// 设置跳转到估价或卖车填写信息页面
			String valueOrSellId = request.getParameter("valueOrSellId");
			request.setAttribute("valueOrSellId", valueOrSellId);
			request.setAttribute("changePage", "sell/sellinfo.jsp");;
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if ("carvalue".equals(actionName)) {
			// 估价
			carvalue(request, response);
		} else if ("sell".equals(actionName)) {
			// 卖车
			sell(request, response);
		} else if ("update".equals(actionName)) {
			update(request, response);
		} else if ("sellcount".equals(actionName)) {
			// 显示卖车数量，跳转到卖车页面
			sellcount(request, response);
		}
	}

	/**
	 * 显示卖车数量，跳转到卖车页面
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void sellcount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("changePage", "sell/sell.jsp");
		ResultInfo<Long> resultInfo = sellService.sellcount();
		request.setAttribute("resultInfo", resultInfo);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * 修改卖车信息，目标：跳转到卖车信息页面
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String district = request.getParameter("district");
		String regcity = request.getParameter("regcity");
		String carinfoId = request.getParameter("carinfoId");
		String carinfo = request.getParameter("carinfo");
		String regdate = request.getParameter("regdate");
		String mileage = request.getParameter("mileage");
		String carcondition = request.getParameter("carcondition");
		String carId = request.getParameter("carId");
		Car car = new Car();
		car.setDistrict(district);
		car.setRegcity(regcity);
		car.setCarinfoId(Integer.parseInt(carinfoId));
		car.setCarinfo(carinfo);
		try {
			car.setRegdate(new SimpleDateFormat("yyyy-MM-dd").parse(regdate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		car.setMileage(Double.parseDouble(mileage));
		car.setCarcondition(Integer.parseInt(carcondition));
		car.setCarId(Integer.parseInt(carId));
		ResultInfo<Car> resultInfo = new ResultInfo<>();
		resultInfo.setResult(car);
		request.setAttribute("valueOrSellId", "1");
		request.setAttribute("resultInfo", resultInfo);
		request.setAttribute("changePage", "sell/sellinfo.jsp");;
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	/**
	 * 卖车
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void sell(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String district = request.getParameter("districthid");
		String regcity = request.getParameter("city2hid");
		String carinfoId = request.getParameter("info");
		String carinfo = request.getParameter("infohid");
		String regdate = request.getParameter("regdate");
		String mileage = request.getParameter("mileage");
		String carcondition = request.getParameter("carcondition");
		String price = request.getParameter("price");
		User user = (User) request.getSession().getAttribute("user");
		Integer sellerId = user.getUserId();
		String carId = request.getParameter("carId");
		
		String[] arr = { "iname1", "iname2", "iname3", "iname4" };
		// 文件上传
		// 1、得到Part对象 request.getPart(name); name代表的是文件域的name属性值
		for (int i = 0; i < arr.length; i++) {
			Part part = request.getPart(arr[i]);
			// 2、得到上传的文件名
			String fileName = part.getSubmittedFileName();
			// 3、判断文件名是否为空
			if (!StringUtil.isEmpty(fileName)) {
				// 4、如果不为空，得到图片存放的路径，实现文件上传，更新头像的默认值
				String path = request.getServletContext().getRealPath("/WEB-INF/upload/" + fileName);
				part.write(path);
				arr[i]=fileName;
				System.out.println(arr[i]);
			}
		}

		ResultInfo<Car> resultInfo = sellService.sell(district, regcity, carinfoId, carinfo, regdate, mileage,
				carcondition, sellerId, carId, price,arr);
		if (resultInfo.getCode() == 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script>alert('恭喜您，上传成功！');location.href='index.jsp';</script>");
			out.flush();
			out.close();
			// response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("valueOrSellId", "1");
			request.setAttribute("resultInfo", resultInfo);
			request.setAttribute("changePage", "sell/sellinfo.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * 估价
	 * 
	 * @param request
	 * @param response
	 */
	private void carvalue(HttpServletRequest request, HttpServletResponse response) {
		String district = request.getParameter("district");
		String regcity = request.getParameter("regcity");
		String carinfo = request.getParameter("carinfo");
		String carinfoId = request.getParameter("carinfoId");
		String regdate = request.getParameter("regdate");
		String mileage = request.getParameter("mileage");
		String carcondition = request.getParameter("carcondition");
		ResultInfo<String> resultInfo = sellService.carvalue(carinfoId, regdate, mileage, carcondition);
		JsonUtil.toJson(response, resultInfo);
	}

	/**
	 * 车型列表
	 * 
	 * @param request
	 * @param response
	 */
	private void infoSelect(HttpServletRequest request, HttpServletResponse response) {
		String seriesId = request.getParameter("seriesId");
		List<CarInfo> list = sellService.findCarInfoBySeriesID(seriesId);
		JsonUtil.toJson(response, list);
	}

	/**
	 * 系列列表
	 * 
	 * @param request
	 * @param response
	 */
	private void seriesSelect(HttpServletRequest request, HttpServletResponse response) {
		String brandId = request.getParameter("brandId");
		List<CarSeries> list = sellService.findCarSeriesByBrandID(brandId);
		JsonUtil.toJson(response, list);
	}

	/**
	 * 品牌列表
	 * 
	 * @param request
	 * @param response
	 */
	private void brandSelect(HttpServletRequest request, HttpServletResponse response) {
		List<CarBrand> list = sellService.findCarBrand();
		JsonUtil.toJson(response, list);
	}

}
