package com.cc.ordercount.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TokenInterceptor extends HandlerInterceptorAdapter{

	private Logger log = Logger.getLogger(TokenInterceptor.class);
	
	/**
	 * 验证用户是否有登录的权限
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Cookie cookie = CookieUtils.getCookie(request, "ud");
		if(cookie != null)
			return true;
		//log.error(request.getContextPath());
		response.sendRedirect(request.getContextPath()+"/account/triggerLogin");
		return false;
	}

}
