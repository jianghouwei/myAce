package com.org.sys.service;

import com.org.common.model.DtPage;
import com.org.sys.model.Users;

/**
 * 
 * TODO { 用户管理 }
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface UsersService {

	/**
	 * 查询用户的分页数据
	 * @param dp
	 * @return
	 */
	DtPage<Users> getUserInfoOfPage(DtPage<Users> dp);
}
