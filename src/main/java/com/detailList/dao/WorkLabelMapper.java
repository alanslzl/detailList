package com.detailList.dao;

import com.detailList.entity.WorkLabel;

public interface WorkLabelMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkLabel record);

    int insertSelective(WorkLabel record);

    WorkLabel selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkLabel record);

    int updateByPrimaryKey(WorkLabel record);
}