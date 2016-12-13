package com.org.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.org.common.model.DtPage;
import com.org.common.utils.UuidUtil;
import com.org.sys.model.Users;

/**
 * 
 * TODO {Controller}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class BaseController {

	protected Logger log = Logger.getLogger(this.getClass());

	protected HttpServletRequest request;

	protected HttpServletResponse response;

	/**
	 * 
	 * 获取用户角色权限
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	protected Users getUser() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Users ui = (Users) subject.getSession().getAttribute("users");
			return ui;
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * 得到PageData
	 */
	public DtPage<T> getPageData(HttpServletRequest request) {

		return null;
	}

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getMoV() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();

		return request;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public String get32UUID() {
		return UuidUtil.get32UUID();
	}
}
