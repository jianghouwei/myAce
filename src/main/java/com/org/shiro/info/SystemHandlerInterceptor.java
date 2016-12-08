package com.org.shiro.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.org.sys.model.Users;

/**
 * 
 * TODO {统一登陆拦截 查看是否校验}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class SystemHandlerInterceptor implements HandlerInterceptor {

	/**
	 * 
	 * 对于已经登陆的校验 TODO 简单描述该方法的实现功能（前置处理）.
	 * 
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse, java.lang.Object)
	 * @author mao.ru date: 2016年7月4日 下午2:24:59 <br/>
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Subject subject = SecurityUtils.getSubject();
		Users ui = (Users) subject.getSession().getAttribute("users");
		if(ui != null){
			return true;
		}else{
			subject.logout();
			response.sendRedirect(request.getContextPath() + "/");
		}
		return false;

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
