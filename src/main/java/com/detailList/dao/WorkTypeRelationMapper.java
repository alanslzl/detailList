package com.detailList.dao;

import com.detailList.entity.WorkTypeRelation;

public interface WorkTypeRelationMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkTypeRelation record);

    int insertSelective(WorkTypeRelation record);

    WorkTypeRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkTypeRelation record);

    int updateByPrimaryKey(WorkTypeRelation record);
    
    void deleteWorkTypeRelationByDeatailListId(String detailListId);
}