package com.detailList.dao;

import com.detailList.entity.WorkLabelRelation;

public interface WorkLabelRelationMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkLabelRelation record);

    int insertSelective(WorkLabelRelation record);

    WorkLabelRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkLabelRelation record);

    int updateByPrimaryKey(WorkLabelRelation record);
}