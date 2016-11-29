package com.org.sys.dao;

import com.org.sys.model.RoleUsers;

public interface RoleUsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleUsers record);

    int insertSelective(RoleUsers record);

    RoleUsers selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleUsers record);

    int updateByPrimaryKey(RoleUsers record);
}