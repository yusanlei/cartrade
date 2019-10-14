package com.shsxt.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;



/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		//System.out.println(request.getParameter("uname"));
		HttpServletRequest request2 = (HttpServletRequest)request;
		
		String method = request2.getMethod();
		String serverInfo = request.getServletContext().getServerInfo();
		String server = serverInfo.substring(serverInfo.indexOf("/")+1, serverInfo.indexOf("."));
		if ("GET".equalsIgnoreCase(method)&&Integer.parseInt(server)<8) {
			HttpServletRequest request3 = new MyWapper(request2);
			chain.doFilter(request3, response);
			return;
		}
		//System.out.println(request.getParameter("uname"));
		chain.doFilter(request, response);
	}

	//重写getParameter方法，自定义内部类实现
	class MyWapper extends HttpServletRequestWrapper{
		HttpServletRequest request = null;
		public MyWapper(HttpServletRequest request) {
			super(request);
			
		}
		@Override
		public String getParameter(String name) {
			String value = request.getParameter(name);
			try {
				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return value;
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
