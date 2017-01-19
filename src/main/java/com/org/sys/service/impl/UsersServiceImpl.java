package com.org.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.common.model.DtPage;
import com.org.sys.dao.UsersMapper;
import com.org.sys.model.Users;
import com.org.sys.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersMapper usersMapper;

	@Override
	public DtPage<Users> getUserInfoOfPage(DtPage<Users> dp) {
		Long count = usersMapper.selectOfCount(dp);
		List<Users> list = usersMapper.selectOfPage(dp);
		dp.setAaData(list);
		dp.setiTotalDisplayRecords(count);
		dp.setiTotalRecords(count);
		return dp;
	}

	@Override
	public Users getUserInfoById(Integer id) {
		return usersMapper.selectByPrimaryKey(id);
	}

	@Override
	public void doUserInfoById(Users userinfo) {
		usersMapper.updateByPrimaryKeySelective(userinfo);
	}

}
