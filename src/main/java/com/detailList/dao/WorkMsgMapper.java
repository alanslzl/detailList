package com.detailList.dao;

import java.util.List;

import com.detailList.entity.WorkMsg;

public interface WorkMsgMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkMsg record);

    int insertSelective(WorkMsg record);

    WorkMsg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkMsg record);

    int updateByPrimaryKeyWithBLOBs(WorkMsg record);

    int updateByPrimaryKey(WorkMsg record);
    
    List<WorkMsg> queryWorkMsg(String workId);
}