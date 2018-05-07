package com.detailList.dao;

import com.detailList.entity.workPerson;

public interface workPersonMapper {
    int deleteByPrimaryKey(String id);

    int insert(workPerson record);

    int insertSelective(workPerson record);

    workPerson selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(workPerson record);

    int updateByPrimaryKey(workPerson record);
}