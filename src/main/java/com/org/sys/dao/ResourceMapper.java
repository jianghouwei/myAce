package com.org.sys.dao;

import java.util.List;

import com.org.sys.model.Resource;

public interface ResourceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Integer id);
    
    /**
     * 
     * 依据用户Id查询用户菜单
     *
     * @author mao.ru
     * @param userId
     * @return
     * @since JDK 1.7
     */
    List<Resource> findMenuAll(Integer userId);
    
    /**
     * 
     * 依据父Id和用户id查询子菜单
     *
     * @author mao.ru
     * @param userId
     * @return
     * @since JDK 1.7
     */
   List<Resource> findMenuByParentId(Integer levelPid);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKeyWithBLOBs(Resource record);

    int updateByPrimaryKey(Resource record);
}