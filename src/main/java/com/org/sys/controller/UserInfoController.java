package com.org.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.org.common.controller.BaseController;
import com.org.common.model.DtPage;
import com.org.sys.model.Users;
import com.org.sys.service.UsersService;


/**
 * 
 * TODO {用户管理}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
@Controller
public class UserInfoController extends BaseController<Users>{
	
	@Autowired
	private UsersService usersService;
	/**
	 * 访问用户列表页
	 * @return
	 */
	@RequestMapping(value="sys/userinfo")
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
	@RequestMapping(value = "sys/getUserPage",produces = "application/json;charset=UTF-8")
	public String getUserInfoPage(HttpServletRequest request,Users record){
		DtPage<Users> dp = getPageData(request);
		dp.setParam(record);
		dp = usersService.getUserInfoOfCount(dp);
		return JSON.toJSONString(dp);
	}
	
	/**
	 * 去编辑页面
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "userinfo/goEdit")
	public ModelAndView goUserInfoEdit(HttpServletRequest request,Users record){
		ModelAndView mv = this.getMoV();
		Users user = usersService.getUserInfoById(record.getId());
		mv.addObject("userInfo", user);
		mv.setViewName("system/userinfo/userinfo_edit");
		return mv;
	}
	
	/**
	 * 
	 * TODO(编辑页面保存)
	 *
	 * @author mao.ru
	 * @param request
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "userinfo/doEdit",produces = "application/json;charset=UTF-8")
	public String doUserInfoEdit(HttpServletRequest request,Users record){
		usersService.doUserInfoById(record);
		return getRetMSg("用户信息更新成功", "ok");
	}
	
	
	
	
}
