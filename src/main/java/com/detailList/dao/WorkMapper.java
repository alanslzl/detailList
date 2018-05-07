package com.detailList.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.detailList.entity.Work;

public interface WorkMapper {
    int deleteByPrimaryKey(String id);

    int insert(Work record);

    int insertSelective(Work record);

    Work selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Work record);

    int updateByPrimaryKey(Work record);
    
    List<Work> selectWorkByWorkTypeId(Map<String, Object> paramMap);
    
    List<Work> selectNoTypeWork(Map<String, Object> paramMap);
    
    List<Work> selectWork(@Param("userId")String userId);
}