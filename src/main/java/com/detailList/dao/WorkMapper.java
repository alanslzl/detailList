package com.detailList.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.detailList.entity.Work;
import com.detailList.entity.WorkMsg;

public interface WorkMapper {
    int deleteByPrimaryKey(String id);

    int insert(Work record);

    int insertSelective(Work record);

    Work selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Work record);

    int updateByPrimaryKey(Work record);
    
    List<Work> selectWorkByWorkTypeId(Map<String, Object> paramMap);
    
    List<Work> selectNoTypeWork(Map<String, Object> paramMap);
    
    List<Work> selectWork(Map<String, Object> queryMap);
    
    Work selectByWorkId(String workId);
    
    List<Work> selectRelationWork(Map<String, Object> paramMap);
    
    Work qeruyWorkById(String workId);
    
    String queryWorkPerson(Map<String, Object> map);
    
    int  delWorkPerson(Map<String, Object> map);
    
    List<WorkMsg> queryWorkMsg(String workId);
    
    int insertWorkMsg(Map<String, Object> map);
    
    int updateState(Map<String, Object> map);
    
}