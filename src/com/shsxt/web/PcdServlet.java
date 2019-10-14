package com.shsxt.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.shsxt.po.PCD;
import com.shsxt.service.PcdService;
import com.shsxt.util.JsonUtil;

/**
 * 省市区联动
 */
@WebServlet("/pcdServlet")
public class PcdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PcdService pcdService = new PcdService();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int pid = Integer.parseInt(request.getParameter("pid"));
        List<PCD> pcdList = pcdService.findPCDByPid(pid);
        JsonUtil.toJson(response, pcdList);
	}

}
