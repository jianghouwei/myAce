package com.org.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestJqGridController {

	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="test/jqGrid")
	public ModelAndView jqGrid(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/test/jqGrid");
		return mv;
	}
}
