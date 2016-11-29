package com.org.sys.dao;

import com.org.sys.model.GroupCompany;

public interface GroupCompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupCompany record);

    int insertSelective(GroupCompany record);

    GroupCompany selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupCompany record);

    int updateByPrimaryKey(GroupCompany record);
}