package com.shsxt.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.po.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		String path = request.getRequestURI();
		//System.out.println(path);
		// 1、放行指定页面，不需要登录可以访问的页面 （例如：登录页面、注册页面等）
		if (path.contains("/login.jsp")||path.contains("/register.jsp")||path.contains("/index.jsp")
			) {
			chain.doFilter(request, response);
			return;
		}
		// 2、放行静态资源（例如：css、js、image等资源）
		if (path.contains("/statics")) {
			chain.doFilter(request, response);
			return;
		}
		 //3、放行指定操作，不需要登录即可执行的操作（例如：登录操作、注册操作等）
		if (path.contains("userServlet")) {
			String actionName= request.getParameter("actionName");
			if ("login".equals(actionName)) {
				chain.doFilter(request, response);
				return;
			}			
		}
		if (path.contains("sellServlet")) {
			String actionName= request.getParameter("actionName");
			if ("sellcount".equals(actionName)) {
				chain.doFilter(request, response);
				return;
			}			
		}
		if (path.contains("indexServlet")||path.contains("buyCarsServlet")||path.contains("speciflcServlet")) {			
				chain.doFilter(request, response);
				return;						
		}
		if (path.contains("AdminServlet")) {
			String actionName= request.getParameter("actionName");
			if ("carImage".equals(actionName)) {
				chain.doFilter(request, response);
				return;
			}			
		}
		
		//4、放行登陆状态
		User user = (User) request.getSession().getAttribute("user");
		if (user!=null) {
			chain.doFilter(request, response);
			return;
		}
		
		
		//自动登录
		//前提：未登录状态下，有cookie对象，可以实现免登录
			//1、判断session作用域中是否存在user对象
			//2、如果session域对象不存在，则查找cookie对象是否存在
				//如果有cookie，获取cookie的值，然后调用登录方法
		Cookie[] cookies = request.getCookies();
		if (cookies!=null&&cookies.length>0) {
			for (int i = 0; i < cookies.length; i++) {
				String name = cookies[i].getName();
				if ("user".equals(name)) {
					String value = cookies[i].getValue();
					String[] values = value.split("-");
					String uname=values[0];
					String upwd=values[1];
					request.getRequestDispatcher("userServlet?actionName=login&uname="+uname+"&upwd="+upwd).forward(request, response);
					return;
				}	
			}
		}
		
		
		//其他页面全部跳转到登陆页面
		response.sendRedirect("login.jsp");
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
