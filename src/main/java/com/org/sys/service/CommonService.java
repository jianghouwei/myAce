package com.org.sys.service;

import java.util.Set;

import com.org.sys.model.Users;

/**
 * 
 * TODO {用户，角色， 权限， 菜单 ---查询 方法}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface CommonService {
	
	 
    /**
     * 
     *
     * TODO( 依据 登录名查询用户名).<br/>
     *
     * @author mao.ru
     * @param loginName
     * @return
     * @since JDK 1.7
     */
    Users selectUsersByLoginName(String loginName);
    
    /**
     * 
     *
     * TODO(依据用户Id查询用户角色).<br/>
     *
     * @author mao.ru
     * @param userId
     * @return
     * @since JDK 1.7
     */
    Set<String> selectRoleByUserId(Integer userId);
    
    /**
     * 
     *
     * TODO(依据用户Id查询用户权限).<br/>
     *
     * @author mao.ru
     * @param userId
     * @return
     * @since JDK 1.7
     */
    Set<String> selectAuthByUserId(Integer userId);

}
