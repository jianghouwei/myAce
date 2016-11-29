package com.org.sys.dao;

import java.util.Set;

import com.org.sys.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    /**
     * 
     *
     * TODO(这里描述这个方法的注意事项 – 可选).<br/>
     *
     * @author mao.ru
     * @param userId
     * @return
     * @since JDK 1.7
     */
    Set<String> getRolesByUserId(Integer userId);
}