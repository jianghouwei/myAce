package com.org.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.org.common.controller.BaseController;
import com.org.sys.model.Users;


/**
 * 
 * TODO {用户管理}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
@Controller
public class UserInfoController extends BaseController{
	
	/**
	 * 访问用户列表页
	 * @return
	 */
	@RequestMapping(value="test/jqGrid")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		ModelAndView mv = this.getMoV();
		mv.setViewName("system/userinfo/userInfo_list");
		return mv;
	}

	/**
	 * 
	 * TODO(用户列表数据)
	 *
	 * @author mao.ru
	 * @param request
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserPage",produces = "application/json;charset=UTF-8")
	public String getUserInfoPage(HttpServletRequest request,Users record){
		
		return null;
	}
}
