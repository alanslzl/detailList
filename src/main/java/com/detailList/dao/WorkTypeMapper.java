package com.detailList.dao;

import java.util.List;

import com.detailList.entity.WorkType;

public interface WorkTypeMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkType record);

    int insertSelective(WorkType record);

    WorkType selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkType record);

    int updateByPrimaryKey(WorkType record);
    
    List<WorkType> selectWorkType(String detailListId);
    
    void deleteByDetailListId(String detailListId);
}