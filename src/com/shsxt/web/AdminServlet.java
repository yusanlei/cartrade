package com.shsxt.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.shsxt.po.Car;
import com.shsxt.po.Img;
import com.shsxt.po.Order;
import com.shsxt.service.AdminService;
import com.shsxt.util.Page;
import com.shsxt.util.StringUtil;

/**
 * 管理员服务端
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private	AdminService adminservice = new AdminService();
	
	/**
	 * 直接读取,需要审核的订单,跳转到管理员的index页面
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 接收用户行为
		String actionName = request.getParameter("actionName");
		if("checkCar".equals(actionName)){
			checkCar(request,response);
		}else if("view".equals(actionName)){
			viewOrder(request,response);
		}else if("carImage".equals(actionName)){
			carImage(request,response);
		}else{
//			查询未审核车辆
			carList(request,response);
		}
	}
	
//	打开订单流水的页面
	private void viewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("menu", "view");
		request.setAttribute("changePage", "admin/view.jsp");
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		
		Page<Order> page = adminservice.findOrderByPage(pageNum,pageSize);

		//	设置page信息到域对象进行跳转
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
	}

	
	
//	接收carId或者imgId加载车图片一个
	private void carImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		接收车Id
		String carId = request.getParameter("carId");
		String imageName = request.getParameter("imageName");
		//查询图片名
		if (!StringUtil.isEmpty(carId)) {
			Img img = adminservice.getImageNames(carId);		
			imageName = img.getIname1();
		}		
		// 2、得到图片存放在服务器中的路径
		String filePath = request.getServletContext().getRealPath("/WEB-INF/upload/");
		// 3、通过路径得到file对象
		File file = new File(filePath + imageName );
		// 4、判断file对象是否存在且是一个标准文件
		if (file.exists() && file.isFile()) {
			// 5、得到图片的后缀 
			String pic = imageName.substring(imageName.lastIndexOf(".")+1);
			// 6、通过不同的后缀设置不同的响应类型
			if ("PNG".equalsIgnoreCase(pic)) {
				response.setContentType("image/png");
			} else if ("JPG".equalsIgnoreCase(pic) || "JPEG".equalsIgnoreCase(pic)) {
				response.setContentType("image/jpeg");
			} else if ("GIF".equalsIgnoreCase(pic)) {
				response.setContentType("image/gif");
			}
			// 	7、通过FileUtils的工具类，将文件拷贝出去
			FileUtils.copyFile(file, response.getOutputStream());
		}
		
	}
	
	

//	添加车详情信息同时审核通过,返回结果1,执行删除dom操作
	private void checkCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String carId = request.getParameter("carId");
		String detail = request.getParameter("detail");
//		添加detail信息
		Integer code=adminservice.addDetail(carId,detail);

//		修改车辆待审核状态
//		这里通过流响应直接响应字符串1或0,不需要响应对象
		if(code>0){
			code=adminservice.updateCarStatus(carId);
			//这里可以补充一个删除操作
			
		}
//		这里通过流响应直接响应字符串1或0,不需要响应对象
		response.getWriter().write(code + "");
		response.getWriter().close();
	}

	//	分页查询信息车辆信息进行审核,并携带信息跳转至首页
	private void carList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("menu", "check");
//		获得分页信息
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		
		Page<Car> page = adminservice.findCarByPage(pageNum,pageSize);

		//	设置page信息到域对象进行跳转
		request.setAttribute("page", page);
		// 设置首页动态包含的页面值
		request.setAttribute("changePage", "admin/check.jsp");
		// 请求转发跳转到首页
		request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
	}
}
