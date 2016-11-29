package com.org.sys.dao;

import com.org.sys.model.RoleGroup;

public interface RoleGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleGroup record);

    int insertSelective(RoleGroup record);

    RoleGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleGroup record);

    int updateByPrimaryKey(RoleGroup record);
}