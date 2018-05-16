package com.detailList.dao;

import java.util.List;

import com.detailList.entity.userGroup;

public interface userGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(userGroup record);

    int insertSelective(userGroup record);

    userGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(userGroup record);

    int updateByPrimaryKey(userGroup record);
    
    public List<userGroup> queryUserGroup(userGroup userGroup);
}