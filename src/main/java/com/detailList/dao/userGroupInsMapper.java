package com.detailList.dao;

import com.detailList.entity.userGroupIns;

public interface userGroupInsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(userGroupIns record);

    int insertSelective(userGroupIns record);

    userGroupIns selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(userGroupIns record);

    int updateByPrimaryKey(userGroupIns record);
    
    int deleteByGroupId(Integer id);
}