package com.org.sys.dao;

import com.org.sys.model.GroupUsers;

public interface GroupUsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupUsers record);

    int insertSelective(GroupUsers record);

    GroupUsers selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupUsers record);

    int updateByPrimaryKey(GroupUsers record);
}