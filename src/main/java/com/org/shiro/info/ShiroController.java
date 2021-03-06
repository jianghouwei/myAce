package com.org.shiro.info;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.sys.model.Resource;
import com.org.sys.model.Users;
import com.org.sys.service.CommonService;


/**
 * 
 * TODO {Shiro Path}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
@Controller
public class ShiroController {

	@Autowired
	private CommonService commonService;
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/tologin")
	public ModelAndView toLogin(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/admin/login");
		return mv;
	}	
	/**
	 * 登陆成功
	 * @return
	 * @throws IOException 
	 */    
	@RequestMapping(value="/index",method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		Subject subject = SecurityUtils.getSubject();
		Users users = (Users) subject.getSession().getAttribute("users");
		if((subject.isAuthenticated()||subject.isRemembered())&& users != null){
			List<Resource> menuList = commonService.findMenuAll(users.getId());
			mv.addObject("menuList", menuList);
			mv.addObject("users", users);
			mv.setViewName("system/admin/index");
			return mv;
		}
		WebUtils.getAndClearSavedRequest(request);
		WebUtils.redirectToSavedRequest(request, response, "/");
		mv.setViewName("system/admin/login");
		return mv;
	}
	
	/**
	 * 登录失败
	 * @param userName
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/dologin",method = RequestMethod.POST)
	public ModelAndView fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		ModelAndView mv = new ModelAndView();
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		mv.setViewName("system/admin/login");
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/home")
	public String home(){
		return "system/admin/home";
	}
	
	
	
	/**
	 * 登出
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response,Model model) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/admin/login");
		return mv;
	}
}
