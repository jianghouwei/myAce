package com.org.sys.dao;

import com.org.sys.model.Users;

public interface UsersMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
    
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
    Users selectByLoginName(String loginName);
}