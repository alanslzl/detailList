package com.detailList.dao;

import java.util.List;

import com.detailList.entity.Work;

public interface WorkMapper {
    int deleteByPrimaryKey(String id);

    int insert(Work record);

    int insertSelective(Work record);

    Work selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Work record);

    int updateByPrimaryKey(Work record);
    
    List<Work> selectWorkByWorkTypeId(String workTypeId);
    
    List<Work> selectNoTypeWork(String detailListId);
    
    List<Work> selectWork(String userId);
}