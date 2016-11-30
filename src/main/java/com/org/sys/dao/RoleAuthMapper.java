package com.org.sys.dao;

import java.util.Set;

import com.org.sys.model.RoleAuth;

public interface RoleAuthMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleAuth record);

    int insertSelective(RoleAuth record);

    RoleAuth selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleAuth record);

    int updateByPrimaryKey(RoleAuth record);
    
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
    Set<String> getAuthsByUserId(Integer userId);
}