package com.org.sys.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sys.dao.ResourceMapper;
import com.org.sys.dao.RoleAuthMapper;
import com.org.sys.dao.RoleMapper;
import com.org.sys.dao.UsersMapper;
import com.org.sys.model.Resource;
import com.org.sys.model.Users;
import com.org.sys.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleAuthMapper roleAuthMapper;
	@Autowired
	private ResourceMapper resourceMapper;
	
	
	@Override
	public Users selectUsersByLoginName(String loginName) {
		return usersMapper.selectByLoginName(loginName);
	}


	@Override
	public Set<String> selectRoleByUserId(Integer userId) {
		return roleMapper.getRolesByUserId(userId);
	}


	@Override
	public Set<String> selectAuthByUserId(Integer userId) {
		return roleAuthMapper.getAuthsByUserId(userId);
	}


	@Override
	public List<Resource> findMenuAll(Integer userId) {
		// TODO Auto-generated method stub
		return resourceMapper.findMenuAll(userId);
	}

}
