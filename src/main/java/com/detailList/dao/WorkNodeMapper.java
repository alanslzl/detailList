package com.detailList.dao;

import com.detailList.entity.WorkNode;

public interface WorkNodeMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkNode record);

    int insertSelective(WorkNode record);

    WorkNode selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkNode record);

    int updateByPrimaryKey(WorkNode record);
}