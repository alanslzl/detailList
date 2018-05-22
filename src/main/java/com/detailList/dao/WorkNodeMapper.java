package com.detailList.dao;

import java.util.List;

import com.detailList.entity.WorkNode;

public interface WorkNodeMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkNode record);

    int insertSelective(WorkNode record);

    WorkNode selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkNode record);

    int updateByPrimaryKey(WorkNode record);
    
    List<WorkNode> selectByWorkId(String workId);
    
    List<WorkNode> queryNodeByWorkId(String workId);
}