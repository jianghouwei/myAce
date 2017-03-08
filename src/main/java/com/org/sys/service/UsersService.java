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
	 * 
	 * @param dp
	 * @return
	 */
	DtPage<Users> getUserInfoOfPage(DtPage<Users> dp);

	/**
	 * 依据用户Id 查询用信息
	 * 
	 * @param id
	 * @return
	 */
	Users getUserInfoById(Integer id);

	/**
	 * 保存用户信息
	 * 
	 * @param userinfo
	 */
	void doUserInfoById(Users userinfo);

	/**
	 *
	 * TODO(依据用户Id进行逻辑删除).<br/>
	 *
	 * @author mao.ru
	 * @param id
	 * @since JDK 1.7
	 */
	void delUserInfoById(Integer id);

	/**
	 * 新增用户
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	int insertUserInfoSelective(Users record);
}
