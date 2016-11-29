package com.org.sys.dao;

import com.org.sys.model.MenuAuthority;

public interface MenuAuthorityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MenuAuthority record);

    int insertSelective(MenuAuthority record);

    MenuAuthority selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MenuAuthority record);

    int updateByPrimaryKey(MenuAuthority record);
}