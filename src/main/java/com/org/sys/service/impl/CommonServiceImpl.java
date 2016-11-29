package com.org.sys.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sys.dao.RoleMapper;
import com.org.sys.dao.UsersMapper;
import com.org.sys.model.Users;
import com.org.sys.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	
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
		return null;
	}

}
