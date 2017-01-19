package com.org.test.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

@Controller
public class TestJqGridController {

	/**
	 * 访问登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "test/jqGrid")
	public ModelAndView jqGrid(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/test/jqGrid");
		return mv;
	}

	/**
	 * 
	 * @param response
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "createorder", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String createOrder(HttpServletRequest request,HttpServletResponse response) {
		try {
			String msg = request.getParameter("MSG");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", "0");
			map.put("message", msg);
			return JSON.toJSONString(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	/**
	 * 
	 * 上行短信状态 {“code”:”1”,”msg”:”success”} --接收成功 {“code”:”-1”,”msg”:”failure”}
	 * --接收失败（数据格式不对，或者数据不全） {“code”:”1”,”msg”:”repetition”} --重复接收
	 * {“code”:”1”,”msg”:”delay”} --状态返回滞后（状态返回时间与交易时间不在同一
	 * 
	 * @author mao.ru
	 * @param request
	 * @param response
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "createstatus", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String createStatus(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String msg = request.getParameter("msg");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", "0");
			map.put("message", msg);
			return JSON.toJSONString(map);
		} catch (Exception e) {
		}
		return null;
	}

}
